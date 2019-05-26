#!/bin/bash
echo "running node_setup..."

cmd.exe /c npm init
#server
cmd.exe /c npm install lite-server --save-dev
#sass
cmd.exe /c npm install --save-dev node-sass@4.9.3
#gulp
cmd.exe /c npm install -g gulp-cli@2.0.1
cmd.exe /c npm install gulp@3.9.1 --save-dev
cmd.exe /c npm install gulp-sass@3.1.0  browser-sync@2.23.6 --save-dev
echo "node_modules" >> .gitignore

#add necessary lines to package.json
if [[ -f "temp.json" ]]; then
    rm temp.json
fi
sed '/scripts/ a\    "start": "npm run lite",\n    "lite": "lite-server\n    "scss": "node-sass -o css/ css/",' <package.json >temp.json
printf "%s" "$(cat temp.json)" > package.json



#create an index.html file for the project
if [[ -f "index.html" ]];then
    echo "index.html exists... skipping"
else
    cp /mnt/c/Users/corey/Corey-All-/R3dHand/bash/html-template.html index.html
    echo "creating index.html"
fi

#html template will set script and links so lets create those directories and files

#css
if [[ -d "./css" ]];then
    echo "css dir exists... skipping"
else
    mkdir css
    echo "" > css/styles.css
    #setup project to use scss
    echo "" > css/styles.scss
    echo "creating ./css"
fi

#java script
if [[ -d "./js" ]];then
    echo "js dir exists... skipping"
else
    mkdir js
    echo "" > js/scripts.js
    echo "creating ./js"
    #copy gulp-template
    cp /mnt/c/Users/corey/Corey-All-/R3dHand/bash/gulp-template.js gulpfile.js
fi

#possible needed directories
if [[ -d "./img" ]];then
    echo "img dir exists... skipping"
else
    mkdir img
fi


# echo "run development server[y/N]"
# read option
# if [[ "${option}" == "y" || "${option}" == 'Y' ]]; then
#     cmd.exe /c npm start
# fi

cmd.exe /c gulp

rm temp.json
echo "DONE"
