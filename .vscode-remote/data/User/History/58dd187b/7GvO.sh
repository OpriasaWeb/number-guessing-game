#!/bin/bash

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

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
      # User exists
      echo "Welcome back, $USERNAME! You have played $MOCK_GAMES_PLAYED games, and your best game took $MOCK_BEST_GAME guesses."
    else
      # User doesn't exist
      echo "Welcome, $USERNAME! It looks like this is your first time here."
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
# STEP 3: Welcome message logic
# ------------------------
if [[ "$USERNAME" == "$MOCK_USERNAME" ]]; then
  echo "Welcome back, $USERNAME! You have played $MOCK_GAMES_PLAYED games, and your best game took $MOCK_BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

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