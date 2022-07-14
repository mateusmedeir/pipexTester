#!/bin/bash

BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
BOLD="\033[1;37m"
RESET="\033[0m"

OK=" ${GREEN}[ OK ]${RESET}"
FAIL=" ${RED}[ KO ]${RESET}"

#=============== BASIC TESTERS ===============#


#TEST 1

printf "\n${BLUE}=============== ${BOLD}PIPEX TESTER${BLUE} ===============${RESET}\n"

printf "\n${BOLD}BASIC${RESET}\n"
../pipex file1 "cat" "wc -l" file2
< file1 cat | wc -l > file3

printf "\ncat | wc -l:      "

if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 2

../pipex file1 "cat" "grep Yes" file2
< file1 cat | grep Yes > file3

printf "\ncat | grep:       "

if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi

#TEST 3

../pipex file1 "cat" "head -n 5" file2
< file1 cat | head -n 5 > file3

printf "\ncat | head -n 5:  "

if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


printf "\n"


printf "\n${BLUE}============================================${RESET}\n"
printf "\n"
