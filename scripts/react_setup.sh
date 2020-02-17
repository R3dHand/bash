#!/bin/bash

# constants
bashDir="/mnt/c/Users/corey/Corey-All-/R3dHand/bash"

# functions
# using sed update accepts 3 args
    # 1 <pattern> to search
    # 2 <text> to add
    # 3 <input> file to read and update
update () {
    pattern=$1
    text=$2
    input=$3
    echo "updating ${input} with '${text}'"
    sed "/${pattern}/ a\\${text}"  <${input} >temp
    printf "%s" "$(cat temp)" > ${input}
    rm temp
}

# establish var for WSL so script will run on WSL or Linux
if grep -qEi "(Microsoft|WSL)" /proc/version; then
    echo "running WSL"
    wsl="cmd.exe /c"
elif grep -qEi "(amzn)" /proc/version; then
    wsl=""
    echo "running amazon ec2"
fi

# prompt user for app name
echo "Enter name of your react app..."
read app
# create app
echo "Creating app -- ${app}"
${wsl} yarn create react-app ${app}

# change directory to new app
echo "Changing directories from $(pwd)"
cd "./${app}"
echo "to $(pwd)"

#===============
#=== Modules ===
#===============
# bootstrap
${wsl} yarn add bootstrap@4.0.0
${wsl} yarn add reactstrap@5.0.0 react-popper@0.9.2
${wsl} yarn add bootstrap-social@5.1.1
# font awesome
${wsl} yarn add font-awesome@4.7.0
# router
${wsl} yarn add react-router-dom@4.2.2
# forms
${wsl} yarn add react-redux-form@1.16.8
# redux
${wsl} yarn add redux@3.7.2
${wsl} yarn add react-redux@5.0.7

#===================
#=== Directories ===
#===================
# assets
mkdir ./public/assets
mkdir ./public/assets/images
# components
mkdir ./src/components

#=================================
#=== Files to create or modify ===
#=================================
# index.js
update "import ReactDOM" "import 'bootstrap/dist/css/bootstrap.min.css';\nimport 'font-awesome/css/font-awesome.min.css';\nimport 'bootstrap-social/bootstrap-social.css';" "./src/index.js"

#==================
#=== Components ===
#==================
# App.js
printf "%s" "$(cat ${bashDir}/scripts/templates/App.js)" > ./src/App.js
# Home
printf "%s" "$(cat ${bashDir}/scripts/templates/HomeComponent.js)" > ./src/components/HomeComponent.js
# Main
printf "%s" "$(cat ${bashDir}/scripts/templates/MainComponent.js)" > ./src/components/MainComponent.js
# Header
printf "%s" "$(cat ${bashDir}/scripts/templates/HeaderComponent.js)" > ./src/components/HeaderComponent.js
# Footer
printf "%s" "$(cat ${bashDir}/scripts/templates/FooterComponent.js)" > ./src/components/FooterComponent.js

# compile and open in browser
${wsl} yarn start
