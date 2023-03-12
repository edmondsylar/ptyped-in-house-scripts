#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Get the driver name from user input
echo "Enter the driver name:"
read driver_name

# Scaffold the file structure template
mkdir "$driver_name"
mkdir "$driver_name/static"
mkdir "$driver_name/static/js"
mkdir "$driver_name/static/css"
mkdir "$driver_name/static/img"
mkdir "$driver_name/templates"
touch "$driver_name/templates/home.html"
touch "$driver_name/templates/index.html"
mkdir "$driver_name/controllers"
touch "$driver_name/controllers/homeController.py"
mkdir "$driver_name/models"
touch "$driver_name/models/userModel.py"
mkdir "$driver_name/views"
touch "$driver_name/views/homeView.py"
touch "$driver_name/app.py"
touch "$driver_name/readme.md"

# Replace occurrences of "my-driver-name" with the driver name entered by user
sed -i "s/my-driver-name/$driver_name/g" "$driver_name/app.py"

# Get preferred location from user input
echo "Enter preferred location (leave blank to use current location):"
read location

# Move the scaffolded directory to preferred location if specified
if [[ -z "$location" ]]; then
  echo "Scaffolded directory created in $(pwd)/$driver_name"
else
  mv "$driver_name" "$location/"
  echo "Scaffolded directory created in $location/$driver_name"
fi

# Start flask app
export FLASK_APP="$driver_name/app.py"
flask run
