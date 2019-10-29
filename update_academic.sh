#!/usr/bin/env bash

# Source Themes Academic: Theme updater
# Checks for available updates and then asks to install any updates.
# https://sourcethemes.com/academic/
#
# Command: bash ./update_academic.sh

# Check for prerequisites.
if [ ! -d "themes" ];then
  echo "No themes directory, create it"
  mkdir themes
fi

if [ -d "themes/academic" ];then
  echo 'Find directoy "themes/academic", update by "git pull"'
  cd themes/academic
  git pull
  cd ../../
else
  echo 'Directoy "themes/academic" not found, do "ln -s"'
  cd themes
  ln -s ../../hugo-academic academic
  cd ../
fi


