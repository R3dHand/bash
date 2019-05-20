#!/bin/bash
echo "running node_setup..."

cmd.exe /c npm init
cmd.exe /c npm install lite-server --save-dev
echo "node_modules" >> .gitignore

#add necessary lines to package.json
if [[ -f "temp.json" ]]; then
    rm temp.json
fi
sed '/scripts/ a\    "start": "npm run lite",\n    "lite": "lite-server",' <package.json >temp.json
printf "%s" "$(cat temp.json)" > package.json



#create an index.html file for the project
if [[ -f "index.html" ]];then
    echo "index.html exists... skipping"
else
    #change dirs to source script
    source "/mnt/c/Users/corey/Corey-All-/R3dHand/bash/html-template.sh"
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

echo "run development server[y/N]"
read option
if [[ "${option}" == "y" || "${option}" == 'Y' ]]; then
    cmd.exe /c npm start
fi

rm temp.json
echo "DONE"
