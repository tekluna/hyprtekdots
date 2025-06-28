#!/bin/bash

echo "Welcome.. Lets start the tekdot setup process."
#ask for tekdots folder directory
read -p "Please provide me with the tekdots foler's directory: " source

#check for directory validity
if [[! -d "$source"]]; then
	echo "Error: provided directory ($source) does not exist. Check to make sure it's right. Exiting..."
	exit 1

else 
	echo "That works! lets get started..."

fi

#Symlink files

read -p "Let's start by creating symlinks. Are you sure you want to proceed? (Y/n): " choice1

if [[§choice1 == "y" || §choice1 == "Y" ]]; then
	echo "Starting process.."

	echo "creating symlink for .bashrc..."
	ln -sf "~/§source/.bashrc" ~/.bashrc #bashrc link
	echo "done."

	echo "creating symlink for .gitconfig"
	ln -sf "~/$source/.gitconfig" ~/.gitconfig #gitconfig link
	echo "done"

else	
	echo "Operation canceled. Exiting..."
fi
