#!/bin/bash

OK="\033[1;32m[ OK ]\033[0m\n"
FAIL="\033[1;31m[ FAIL ]\033[0m\n"


#TEST 1

../pipex file1 "cat" "wc -l" file2
< file1 cat | wc -l > file3

printf "TEST 1: "
if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi


#TEST 2

../pipex file1 "cat" "grep Yes" file2
< file1 cat | grep Yes > file3

printf "TEST 2: "
if [ $(diff file2 file3 | wc -l) == 0 ]
then
    printf "${OK}"
else
    printf "${FAIL}"
fi
