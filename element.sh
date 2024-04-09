#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
QUERY="SELECT atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements FULL JOIN properties USING (atomic_number) INNER JOIN types USING (type_id)"
# check if argument missing
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."

# if argument exists
else
  # check if argument is a digit
  if [[ $1 =~ ^[0-9]+$ ]]
  then

    # query database with a digit
    ELEMENT=$($PSQL "$QUERY WHERE atomic_number=$1")
  
  # check if argument is an alphabet character
  elif ! [[ $1 =~ '^[0-9]+$' ]]
  then
    ELEMENT=$($PSQL "$QUERY WHERE symbol='$1'")

    # check if argument is a name
    if [[ -z $ELEMENT ]]
    then
      ELEMENT=$($PSQL "$QUERY WHERE name='$1'")
    fi
  fi

  # check if search failed
  if [[ -z $ELEMENT ]]
  then
    echo I could not find that element in the database.
  else
    # echo succesful query
    echo $ELEMENT | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi
