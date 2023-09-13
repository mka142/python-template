#!/bin/bash

if [[ -z "$VIRTUAL_ENV" ]]; then
    echo "No VIRTUAL_ENV set"
    exit 1
else
    echo "VIRTUAL_ENV is set"
fi

pip install -r dev.requirements.txt

bold=$(tput bold)
normal=$(tput sgr0)

CURRENT_DIR=$(pwd)

# SET THIS TO YOUR PROJECT DIR
PROJECT_DIR=0


if [[ ! -d "$PROJECT_DIR" ]]; then
    echo "No project is not set"
    exit 1
fi

echo "${bold}Running pytest${normal}}"
cd $PROJECT_DIR && pytest
cd ../
echo "${bold}Running black${normal}"
black -l 88 --preview project/project 
echo "${bold}Running flake8${normal}"
flake8 project/project
echo "${bold}Creating Events documentation${normal}"