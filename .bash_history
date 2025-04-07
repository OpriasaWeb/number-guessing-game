mkdir number_guessing_game
cd number_guessing_game/
git init
git status
touch number_guess.sh
chmod +x number_guess.sh 
git status
touch README.md
git status
git add .
git status
git commit -m "Initial commit"
git branch
git branch -m main
git branch
git checkout -b feat/generate-random-guess
git branch
./number_guess.sh 
git status
git add .
git commit -m "feat: randomly generate a number script"
git status
git checkout main 
git merge feat/generate-random-guess 
git log --oneline
git branch -d feat/generate-random-guess 
git checkout -b feat/username-as-input
./number_guess.sh 
git status
git diff
git branch
git add .
git status
git commit -m "feat: loop until a valid username is entered, usernames only allow 22 characters"
git status
git checkout main 
git merge feat/username-as-input 
git branch
git log --oneline
git branch -d feat/username-as-input 
git branch
git log
git checkout -b feat/welcome-message-logic
git branch
./number_guess.sh 
./number_guess.sh 
git status
git add .
git commit -m "feat: welcome message logic but with mock data done"
git status
git checkout main
git merge feat/welcome-message-logic 
git branch
git log --oneline
git branch -d feat/welcome-message-logic 
git status
git branch
git checkout -b feat/random-guessing-logic
./number_guess.sh 
git branch
git checkout main 
git merge feat/random-guessing-logic 
git branch
git log --oneline
git checkout feat/random-guessing-logic 
git status
git add .
git commit -m "feat: random number guessing game logic"
git status
git checkout main 
git merge feat/random-guessing-logic 
git status
git log --ogline
git log --oneline
git status
git branch
git branch -d feat/random-guessing-logic 
git checkout -b feat/database-setup-number-guess
git status
./number_guess.sh 
./number_guess.sh 
git checkout main
git branch
git status
git add .
git commit -m "feat: set up database logic"
git checkout feat/database-setup-number-guess 
git status
git checkout main
git log --oneline
git log HEAD~1
git log HEAD~2
git reset --hard HEAD~1
git status
git branch
git checkout feat/database-setup-number-guess 
./number_guess.sh 
./number_guess.sh 
./number_guess.sh 
./number_guess.sh 
./number_guess.sh 
./number_guess.sh 
./number_guess.sh 
git status
git add .
git commit -m "feat: number guess logic with database interaction"
git status
git log
git checkout main
git branch
git merge feat/database-setup-number-guess 
git branch
git status
git add .
git commit -m "fix: adjust some codes"
git branch
git branch -d feat/database-setup-number-guess 
git checkout -b fix/number-guess-debugging
git branch
git status
git status
./number_guess.sh 
./number_guess.sh 
./number_guess.sh 
git branch
git checkout main 
git checkout fix/number-guess-debugging 
git status
git add .
git commit -m "fix: modify and fixed code as debugging"
git status
git checkout main 
git merge fix/number-guess-debugging 
git status
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql
git status
git add .
git commit -m "feat: add sql dump file"
psql --username=freecodecamp --dbname=postgres
psql -U postgres < number_guess.sql
cd number_guessing_game/
rm README.md 
git status
git add .
git commit -m "fix: final code modifications"
git status
git status
\l
\list
list
/list
/l
ls
cd ../
psql --username=freecodecamp --dbname=postgres
