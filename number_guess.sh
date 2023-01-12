#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate secret number
SECRET_NUMBER=$(( RANDOM % 1001 ))
GUESS_NUM=1
# get customer name

echo Enter your username:
read NAME
USERNAME=$($PSQL "SELECT username FROM users WHERE username='$NAME'")
# if user does not exist
if [[ -z $USERNAME ]]
then
  INSERT_NAME=$($PSQL "INSERT INTO users(username) VALUES('$NAME')")
  echo "Welcome, $NAME! It looks like this is your first time here."
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
  INSERT_GAMES=$($PSQL "INSERT INTO games(user_id, games_played, best_game) VALUES($USER_ID, 0, NULL)")  
else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read NUMBER
GUESS() {
  if [[ $1 ]]
  then
      echo -e "\n$1"
  fi
  (( GUESS_NUM++ ))
  read NUMBER
}
# check if NUMBER match the SECRET_NUMBER
until [[ $NUMBER -eq $SECRET_NUMBER ]]
do 
  if [[ ! $NUMBER =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:"
  elif [[ $NUMBER -lt $SECRET_NUMBER ]]
  then
    GUESS "It's lower than that, guess again:"
  elif [[ $NUMBER -gt $SECRET_NUMBER ]]
  then
    GUESS "It's higher than that, guess again:"
  fi
done
echo "You guessed it in $GUESS_NUM tries. The secret number was $NUMBER. Nice job!"
(( GAMES_PLAYED++ ))
INSERT_GAMES_PLAYED=$($PSQL "UPDATE games SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")
BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE user_id=$USER_ID")
if [[ -z $BEST_GAME ]]
then
  INSERT_BEST_GAME=$($PSQL "UPDATE games SET best_game=$GUESS_NUM WHERE user_id=$USER_ID")
elif [[ $BEST_GAME -gt $GUESS_NUM ]]
then
  INSERT_BEST_GAME=$($PSQL "UPDATE games SET best_game=$GUESS_NUM WHERE user_id=$USER_ID")
fi