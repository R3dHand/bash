#!/bin/bash
timestamp=$(date)
working_dir=$(pwd)
GITDIR=$(cmd.exe /c echo %GITDIR%)

#move to gitdir, substring to remove \r (carriage return)
cd "/mnt/c/${GITDIR::-1}"

for repository in $(dirname $(find . -name "*.git" ! -path "./gitBackup/*")); do

    #cd to repository to run commands
    pushd ${repository}
    #prompt
    echo ==============================
    echo STATUS for ${repository}
    echo ==============================

    git status

    #how to continue
    echo "Press enter to continue..."
    #user input
    read command
    while [[ ! "${command}" == "" ]]; do
        #statements
        cmd.exe /c git $(echo ${command})

	#prompt
        echo ==============================
        echo STATUS for ${repository}
        echo ==============================

	#status after user command
        git status

	#how to to continue
	echo "Press enter to continue..."
	#user input
        read command
    done
    popd
done

echo DONE
echo ${timestamp}

#return to bash directory
cd ${working_dir}

#add variables that need to be unset
unset timestamp working_dir GITDIR repository command

