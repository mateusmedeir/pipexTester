#!/bin/bash

GREEN="\033[1;32m"
RED="\033[1;31m"
PURPLE="\033[1;35m"
RESET="\033[0m"

OK=" ${GREEN}[ OK ]${RESET}"
FAIL=" ${RED}[ FAIL ]${RESET}"

##BASIC TESTERS

#TEST 1

printf "\n${PURPLE}=============== BASIC ===============${RESET}\n"
../pipex file1 "cat" "wc -l" file2
< file1 cat | wc -l > file3

printf "\ncat | wc -l:   "

if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 2

../pipex file1 "cat" "grep Yes" file2
< file1 cat | grep Yes > file3

printf "\ncat | grep Yes:"

if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi

printf "\n"

printf "\n"
