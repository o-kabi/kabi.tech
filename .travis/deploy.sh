#!/bin/bash
# print outputs and exit on first failure
# setup ssh agent, git config and remote
set -xe
eval $(ssh-agent bash)
ssh-add /home/travis/.ssh/travis_rsa
git remote add deploy "travis@kabi.tech:/var/www/kabi.tech"
git config user.name "Travis CI"
git config user.email "travis@kabi.tech"
# commit compressed files and push it to remote
rm -f .gitignore
git add .
git status # debug
git commit -m "Deploy compressed files"
git push -f deploy HEAD:master