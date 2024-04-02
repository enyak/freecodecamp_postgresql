#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
# list services
SERVICE_MENU() {
echo -e "\nPlease choose a service."

SERVICES=$($PSQL "SELECT * FROM services")
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
  echo -e "$SERVICE_ID) $SERVICE_NAME"
done
# choose service
read SERVICE_ID_SELECTED
# if input is not a number
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
  SERVICE_MENU "Please enter a number."
else
  SELECTED_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # if not found
  if [[ -z $SELECTED_SERVICE ]]
  then
    # back to service menu
    SERVICE_MENU "The service you requested doesn't exist."
  
  fi
fi
}
SERVICE_MENU

# succesful selection

echo -e "\nPlease enter your phone number."
read CUSTOMER_PHONE
# check if customer in db
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
  echo -e "Please enter your name."
  read CUSTOMER_NAME
  # add customer to db
  NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
fi
echo -e "\nPlease enter time for appointment."
read SERVICE_TIME
# mark appointment in table
APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

# Result printout
SERVICE_CHOSEN=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

echo -e "\nI have put you down for a $SERVICE_CHOSEN at $SERVICE_TIME, $CUSTOMER_NAME."