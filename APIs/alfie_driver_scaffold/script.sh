#!/bin/bash

echo "Enter driver name:"
read driver_name

if [ -z "$driver_name" ]
then
    echo "Driver name cannot be empty."
    exit 1
fi

echo "Enter location (press enter to use default):"
read location

if [ -z "$location" ]
then
    location="$(pwd)/$driver_name"
else
    location="$location/$driver_name"
fi

mkdir -p "$location/static/js"
mkdir -p "$location/static/css"
mkdir -p "$location/static/img"
mkdir -p "$location/templates"
mkdir -p "$location/controllers"
mkdir -p "$location/models"
mkdir -p "$location/views"

touch "$location/app.py"
echo "from flask import Flask\n\napp = Flask(__name__)\n\n\n@app.route(\"/\")\ndef home():\n    return {\"Success\":\"You can start developing your alfie driver\"}\n\nif __name__ == '__main__':\n    app.run()" > "$location/app.py"
touch "$location/readme.md"

echo "Alfie driver '$driver_name' successfully created at location '$location'"
