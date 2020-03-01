#!/bin/bash
cp -r sources/ressources/scripts output/
cp sources/ressources/executor-service-files/* output/service-files/
cp sources/ressources/known-hosts output/
cp sources/ressources/ssh-config output/
cp sources/ressources/user-github-identity-map output/
cp sources/ressources/.gitignore output/

echo 0