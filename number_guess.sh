#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(($RANDOM%1000+1))

# handle user identification
echo Enter your username:
read USERNAME
# check if returning user
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
if ! [[ -z $USER_ID ]]
then
	PLAYED_GAMES=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
	USER_BEST=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $PLAYED_GAMES games, and your best game took $USER_BEST guesses."
	#echo "Welcome back, $USERNAME! You have played $PLAYED_GAMES, and your best game took $USER_BEST guesses."
# new user
else
	echo Welcome, $USERNAME! It looks like this is your first time here.
    	# add userdata to database THIS NEEDS TO MOVE TO BEGINNING AND NEEDS IF CHECK
    	INSERT_USERNAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
fi

# start game
CORRECT_ANSWER=FALSE
TRIES=0
echo Guess the secret number between 1 and 1000:
while [ $CORRECT_ANSWER == FALSE ]
do
  # echo answer while testing program
  #echo $NUMBER
	read ANSWER
	((TRIES=TRIES+1))

  # if not a number
  if ! [[ $ANSWER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
	  
  # number too high
	elif [[ $ANSWER > $NUMBER ]]
  then
		echo "It's lower than that, guess again:"
  
  # number too low
	elif [[ $ANSWER < $NUMBER ]]
  then
		echo "It's higher than that, guess again:"

  # correct answer
  elif [[ $ANSWER == $NUMBER ]]
	then
		CORRECT_ANSWER=TRUE
		echo You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!

    # increment games_played with one
    GET_GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE name='$USERNAME'")
    if [[ -z $GET_GAMES_PLAYED ]]
    then
      GET_GAMES_PLAYED=0
    fi
    ((GET_GAMES_PLAYED=GET_GAMES_PLAYED+1))
    INSERT_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GET_GAMES_PLAYED WHERE name='$USERNAME'")
    # check and update best game
    GET_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE name='$USERNAME'")
    if [[ $GET_BEST_GAME > $TRIES ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$TRIES WHERE name='$USERNAME'")
    elif [[ -z $GET_BEST_GAME ]]
    then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$TRIES WHERE name='$USERNAME'")
    fi

	fi
done