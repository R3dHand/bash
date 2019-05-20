#!/bin/bash
timestamp=$(date)
WORKINGDIR=$(pwd)
#move to git dir
cd /mnt/c/Users/corey/Corey-All-/R3dHand
for repository in $(dirname $(find . -name "*.git" ! -path "./gitBackup/*")); do
    pushd ${repository}
    #PROMPT
    echo ==============================
    echo STATUS for ${repository}
    echo ==============================
    git status
    #how to continue
    echo "press enter to continue..."
    #input git command
    read command
    while [[ ! "${command}" == "" ]]; do
        cmd.exe /c git $(echo ${command})
        #prompt again
        echo ==============================
        echo STATUS for ${repository}
        echo ==============================
        git status
        #how to continue
        echo "press enter to continue"
        #input next command
        read command
    done
    popd
done
echo DONE
echo ${timestamp}
#return to working directory
cd ${WORKINGDIR}
#unset variables
unset WORKINGDIR timestamp command repository

