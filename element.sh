#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
NOTEXIST(){
 if [[ -z $ELEMENT ]]
 then 
  echo -e "\nI could not find that element in the database."
  exit
fi
}
if [[ -z $1 ]]
then
echo "Please provide an element as an argument"
elif [[ ! $1 =~ ^[0-9]+$ ]]
then
ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number)INNER JOIN types USING(type_id) WHERE symbol='$1' OR name = '$1'")
NOTEXIST
echo "$ELEMENT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING_POINT BAR BOILING_POINT
do 
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
else
ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
NOTEXIST
echo "$ELEMENT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING_POINT BAR BOILING_POINT
do 
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done

fi