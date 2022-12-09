#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~ My Salon ~~~~\n"

SERVICE_MENU(){
if [[ $1 ]]
then
    echo -e "\n$1"
fi
echo "Welcome to My Salon, how may I help you?"
echo -e "\n1) cut \n2) color \n3) perm \n4) style \n5) trim \n6) exit"
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
	1) service ;;
  2) service ;;
  3) service ;;
  4) service ;;
  5) service ;;
	6) EXIT ;;
  *) SERVICE_MENU "I could not find that service. What would you like today?" ;;
esac
}
  service() {
        
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
		    # if customer doesn't exist
   if [[ -z $CUSTOMER_NAME ]]
    then
      # get new customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert new cuctomer data
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
		fi
     # get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone ='$CUSTOMER_PHONE'")
     # get service time 
      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
      read SERVICE_TIME
      
			# insert new appointment
			INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        # appointment info
APPOINTMENT_INFO=$($PSQL "SELECT services.name, time, customers.name FROM services INNER JOIN appointments USING(service_id) INNER JOIN customers USING(customer_id) WHERE service_id = $SERVICE_ID_SELECTED AND time = '$SERVICE_TIME' ")
echo "$APPOINTMENT_INFO" | while read S_NAME BAR TIME BAR NAME
do
echo "I have put you down for a $S_NAME at $TIME, $NAME."
done
      
  }

EXIT() {
	echo -e "\nThanks for visiting us.\n"
}

SERVICE_MENU