#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# ------------------------
# NOTE: Random number guessing game
# ------------------------
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

# Loop until a valid username is entered
while true;
do
  echo "Enter your username:"
  read USERNAME

  # Get user username
  FOUND_USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")

  # Check username length
  if [[ ${#USERNAME} -le 22 ]]; then
    if [[ "$USERNAME" == "$FOUND_USERNAME" ]]; then
      # Get user info
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
      GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
      BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")

      if [[ -z "$GAMES_PLAYED" || "$GAMES_PLAYED" == "null" ]]; then
        GAMES_PLAYED=0
      fi
      if [[ -z "$BEST_GAME" || "$BEST_GAME" == "null" ]]; then
        BEST_GAME="N/A"
      fi

      echo "DEBUG: GAMES_PLAYED=$GAMES_PLAYED, BEST_GAME=$BEST_GAME"

      echo "DEBUG: Found username, printing welcome back message"

      # User exists
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    else

      echo "DEBUG: Does not found username, printing welcome message"

      # User doesn't exist
      echo "Welcome, $USERNAME! It looks like this is your first time here."

      # Insert to database new username and get the user id
      $PSQL "INSERT INTO users(username) VALUES('$USERNAME');"
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
    fi

    echo "DEBUG: Username length valid, breaking loop"
    break
  else
    echo "Username must be 22 characters or less. Please try again."
  fi
done

echo "Guess the secret number between 1 and 1000:"

while true; do
  read USER_GUESS

  ((NUMBER_OF_GUESSES++))

  # Check if input is an integer
  if ! [[ "$USER_GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  if (( USER_GUESS == SECRET_NUMBER )); 
  then
    echo "DEBUG: Correct guess, inserting game result into database"
    INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")
    if [[ -z "$INSERT_RESULT" ]]; then
      echo "ERROR: Insert failed."
    else
      echo "Insert succeeded: $INSERT_RESULT"
      echo "DEBUG: USER_ID=$USER_ID, GAMES_PLAYED=$GAMES_PLAYED, BEST_GAME=$BEST_GAME"
    fi
    echo "DEBUG: Insert completed, printing success message"
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    echo "DEBUG: Correct guess, breaking loop"
    break
  elif (( USER_GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done