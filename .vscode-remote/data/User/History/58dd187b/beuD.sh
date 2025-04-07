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

echo "Guess the secret number between 1 and 1000:"

# Initialize guess counter
NUMBER_OF_GUESSES=0