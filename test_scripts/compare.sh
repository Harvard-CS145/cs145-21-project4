#!/bin/bash
function compare {
  if diff -q $1 $2 > /dev/null; then
    printf "\nSUCCESS: Message received matches message sent!\n"
  else
    printf "\nFAILURE: Message received doesn't match message sent.\n"
  fi
  printf "\n"
}

compare $1 $2
