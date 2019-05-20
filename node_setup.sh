#!/bin/bash
#echo "running node_setup..."

#npm init
#npm install lite-server --save-dev
#echo "node_modules" >> .gitignore

#add necessary lines to package.json



#create an index.html file for the project
if [[ -f "index.html" ]];then
    echo "index.html exists... skipping"
else
    source "html-template.sh"
    echo "creating index.html"
fi

#html template will set script and links so lets create those directories and files
if [[ -d "./css" ]];then
    echo "css dir exists... skipping"
else
    mkdir css
    echo "" > css/styles.css
    echo "creating ./css"
fi

if [[ -d "./js" ]];then
    echo "js dir exists... skipping"
else
    mkdir js
    echo "" > js/scripts.js
    echo "creating ./js"
fi

