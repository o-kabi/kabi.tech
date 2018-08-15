#!/bin/sh
# print outputs and exit on first failure
echo "test1"
# setup ssh agent, git config and remote
eval "$(ssh-agent -s)"
echo "test2"
ssh-add ~/.ssh/travis_rsa
git remote add deploy "travis@kabi.tech:/var/www/kabi.tech"
git config user.name "Travis CI"
git config user.email "travis@kabi.tech"
echo "test3"
# commit compressed files and push it to remote
rm -f .gitignore
cp .travis/deployignore .gitignore
echo "test4"
git add .
git status # debug
git commit -m "Deploy compressed files"
git push -f deploy HEAD:master
echo "test5"