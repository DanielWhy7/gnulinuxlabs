# Task 1
git init

echo "A square on a branch" > text.txt

git add text.txt; git commit -m "upload text.txt"

echo "A square enjoys a life" >> text.txt

git add text.txt; git commit -m "update text.txt"

git log

git checkout

git diff main HEAD

git switch main

# Task 2
git switch -c feature

echo "\n\nAn epic square >> right there totally there" >> text.txt

git add text.txt

git commit -m "The square become even better"

git switch main

echo "\n\n\n\n Wow What a square?? => <== Meaw" >> text.txt

git add text.txt

git commit -m "new square??"

git merge dev -X theirs
