#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Loop until a valid username is entered
while true;
do
  echo "Enter your username:"
  read USERNAME

  # Get user info
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

  # Check username length
  if [[ ${#USERNAME} -le 22 ]]; then
    # ------------------------
    # NOTE: Welcome message logic
    # ------------------------
    if [[ -z $USER_ID ]]; then
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      $PSQL "INSERT INTO users(username) VALUES('$USERNAME');"
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
    else
      GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
      BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
    break
  else
    echo "Username must be 22 characters or less. Please try again."
  fi
done

# ------------------------
# STEP 2: Simulated user data (mock database)
# ------------------------
# Pretend we already have some data
MOCK_USERNAME="player1"
MOCK_GAMES_PLAYED=5
MOCK_BEST_GAME=3



# ------------------------
# STEP 4: Random number guessing game
# ------------------------
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read USER_GUESS

  # Check if input is an integer
  if ! [[ "$USER_GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if (( USER_GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( USER_GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done