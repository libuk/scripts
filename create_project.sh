#!/bin/bash

##########################
# A script that creates a project folder
#
# File Structure:
#
# <project_name>/
#   index.html
#   css/
#       style.css
#   js/
#       index.js
#
#
# Author: @libuk
##########################

sleep 1.5
echo "This script will create a basic project folder"
sleep 1
echo "What is the name of your project?"

read inputline

cd ~/projects/

# exit if folder already exists
if [ -d $inputline ]

then
    echo "folder already exists, exiting program"
    exit

else
    mkdir $inputline && cd $inputline

    # create basic file structure
    touch index.html

    # js
    mkdir js && cd js && touch index.js && cd ../

    # css
    mkdir css && cd css && touch style.css && cd ../

    sleep 1
    echo "The project ${inputline} has been created"

    sleep 1.5
fi

exit

done