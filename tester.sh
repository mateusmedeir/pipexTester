#!/bin/bash

BLUE="\033[1;34m"
GREEN="\033[1;32m"
RED="\033[1;31m"
BOLD="\033[1;37m"
RESET="\033[0m"

OK=" ${GREEN}[ OK ]${RESET}"
FAIL=" ${RED}[ KO ]${RESET}"


make -C ../
mkdir outputs

#=================================== TESTERS ===================================#


printf "\n${BLUE}=============== ${BOLD}PIPEX TESTER${BLUE} ===============${RESET}\n"


#========================= MANDATORY =========================#


printf "\n${BOLD}MANDATORY${RESET}\n"

#TEST 1


../pipex src/file.txt "cat" "wc -l" outputs/mand-test-1-result.txt
< src/file.txt cat | wc -l > outputs/mand-test-1-expected.txt

printf "\ncat | wc -l:        "

if [ $(diff outputs/mand-test-1-result.txt outputs/mand-test-1-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 2


../pipex src/file.txt "cat" "grep Temos" outputs/mand-test-2-result.txt
< src/file.txt cat | grep Temos > outputs/mand-test-2-expected.txt

printf "\ncat | grep:         "

if [ $(diff outputs/mand-test-2-result.txt outputs/mand-test-2-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 3


../pipex src/file.txt "cat" "head -n 5" outputs/mand-test-3-result.txt
< src/file.txt cat | head -n 5 > outputs/mand-test-3-expected.txt

printf "\ncat | head -n 5:    "

if [ $(diff outputs/mand-test-3-result.txt outputs/mand-test-3-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 4


../pipex src/file.txt "cat" "uniq" outputs/mand-test-4-result.txt
< src/file.txt cat | uniq > outputs/mand-test-4-expected.txt

printf "\ncat | uniq:         "

if [ $(diff outputs/mand-test-4-result.txt outputs/mand-test-4-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 5


../pipex src/file.txt "grep -i a" "wc -l" outputs/mand-test-5-result.txt
< src/file.txt grep -i a | wc -l > outputs/mand-test-5-expected.txt

printf "\ngrep -i a | wc -l:  "

if [ $(diff outputs/mand-test-5-result.txt outputs/mand-test-5-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 6


../pipex src/file.txt "grep -i a" "uniq" outputs/mand-test-6-result.txt
< src/file.txt grep -i a | uniq > outputs/mand-test-6-expected.txt

printf "\ngrep -i a | uniq:   "

if [ $(diff outputs/mand-test-6-result.txt outputs/mand-test-6-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 7


../pipex ../ "ls -l" "wc -l" outputs/mand-test-7-result.txt
< ../ ls -l | wc -l > outputs/mand-test-7-expected.txt

printf "\nls -l | wc -l:      "

if [ $(diff outputs/mand-test-7-result.txt outputs/mand-test-7-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 8


../pipex ../ "ls -a" "sort" outputs/mand-test-8-result.txt
< ../ ls -a | sort > outputs/mand-test-8-expected.txt

printf "\nls -a | sort:       "

if [ $(diff outputs/mand-test-8-result.txt outputs/mand-test-8-expected.txt | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


printf "\n"


printf "\n${BLUE}============================================${RESET}\n"
printf "\n"
