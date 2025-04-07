#!/bin/bash

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Loop until a valid username is entered
while true;
do
  echo "Enter your username:"
  read USERNAME

  # Check username length
  if [[ ${#USERNAME} -le 22 ]]; then
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

# echo "Guess the secret number between 1 and 1000:"

# # Initialize guess counter
# NUMBER_OF_GUESSES=0