#!/bin/bash

BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
BOLD="\033[1;37m"
RESET="\033[0m"

OK=" ${GREEN}[ OK ]${RESET}"
FAIL=" ${RED}[ KO ]${RESET}"


make -C ../
gcc -o ../pipex -L../ -lftpipex
mkdir outputs
clear

#=================================== TESTERS ===================================#


printf "\n${BLUE}=============== ${BOLD}PIPEX TESTER${BLUE} ===============${RESET}\n"


#========================= MANDATORY =========================#


printf "\n${BOLD}MANDATORY                   Output${RESET}\n"

#TEST 1


../pipex src/file.txt "cat" "wc -l" outputs/mand-test-1-result.txt 2> /dev/null
< src/file.txt cat | wc -l > outputs/mand-test-1-expected.txt

printf "\ncat | wc -l:               "

if [ $(diff outputs/mand-test-1-result.txt outputs/mand-test-1-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 2


../pipex src/file.txt "cat" "grep Temos" outputs/mand-test-2-result.txt 2> /dev/null
< src/file.txt cat | grep Temos > outputs/mand-test-2-expected.txt

printf "\ncat | grep Temos:          "

if [ $(diff outputs/mand-test-2-result.txt outputs/mand-test-2-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 3


../pipex src/file.txt "cat" "head -n 5" outputs/mand-test-3-result.txt 2> /dev/null
< src/file.txt cat | head -n 5 > outputs/mand-test-3-expected.txt

printf "\ncat | head -n 5:           "

if [ $(diff outputs/mand-test-3-result.txt outputs/mand-test-3-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 4


../pipex src/file.txt "cat" "uniq" outputs/mand-test-4-result.txt 2> /dev/null
< src/file.txt cat | uniq > outputs/mand-test-4-expected.txt

printf "\ncat | uniq:                "

if [ $(diff outputs/mand-test-4-result.txt outputs/mand-test-4-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 5


../pipex src/file.txt "grep -i a" "wc -l" outputs/mand-test-5-result.txt 2> /dev/null
< src/file.txt grep -i a | wc -l > outputs/mand-test-5-expected.txt

printf "\ngrep -i a | wc -l:         "

if [ $(diff outputs/mand-test-5-result.txt outputs/mand-test-5-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 6


../pipex src/file.txt "grep -i a" "uniq" outputs/mand-test-6-result.txt 2> /dev/null
< src/file.txt grep -i a | uniq > outputs/mand-test-6-expected.txt

printf "\ngrep -i a | uniq:          "

if [ $(diff outputs/mand-test-6-result.txt outputs/mand-test-6-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 7


../pipex ../ "ls -l" "wc -l" outputs/mand-test-7-result.txt 2> /dev/null
< ../ ls -l | wc -l > outputs/mand-test-7-expected.txt

printf "\nls -l | wc -l:             "

if [ $(diff outputs/mand-test-7-result.txt outputs/mand-test-7-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 8


../pipex ../ "ls -a" "sort" outputs/mand-test-8-result.txt 2> /dev/null
< ../ ls -a | sort > outputs/mand-test-8-expected.txt

printf "\nls -a | sort:              "

if [ $(diff outputs/mand-test-8-result.txt outputs/mand-test-8-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 9


../pipex src/file.txt "sort" "awk '{print \$1}'" outputs/mand-test-9-result.txt 2> /dev/null
< src/file.txt sort | awk '{print $1}' > outputs/mand-test-9-expected.txt

printf "\nsort | awk '{print \$1}':   "

if [ $(diff outputs/mand-test-9-result.txt outputs/mand-test-9-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 10


../pipex src/file.txt "sort" "ola" outputs/mand-test-10-result.txt 2> outputs/mand-test-10-result.txt
< src/file.txt sort | ola > outputs/mand-test-10-expected.txt 2> outputs/mand-test-10-expected.txt

printf "\nsort | ola:                "

if [ $(grep -i "Command" outputs/mand-test-10-result.txt | wc -l) != 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 11


../pipex src/file.txt "sort" "grep 'hello world'" outputs/mand-test-11-result.txt
< src/file.txt sort | grep 'hello world' > outputs/mand-test-11-expected.txt

printf "\nsort | grep 'hello world': "

if [ $(diff outputs/mand-test-11-result.txt outputs/mand-test-11-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 12


../pipex src/file.txt "sort" "grep '" outputs/mand-test-12-result.txt
< src/file.txt sort | grep "'" > outputs/mand-test-12-expected.txt

printf "\nsort | grep '              "

if [ $(diff outputs/mand-test-12-result.txt outputs/mand-test-12-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 13


../pipex src/file.txt "sort" "grep man'hã" outputs/mand-test-13-result.txt
< src/file.txt sort | grep "man'hã" > outputs/mand-test-13-expected.txt

printf "\nsort | grep man\'hã:        "

if [ $(diff outputs/mand-test-13-result.txt outputs/mand-test-13-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi



printf "\n"


printf "\n${BLUE}============================================${RESET}\n\n"
printf "You can see the logs in ${BOLD}outputs/${RESET}\n\n"
