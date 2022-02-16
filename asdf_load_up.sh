#!/usr/bin/env bash

MISSING=0
ASDF_REPO_PATH=
for required_progs in asdf sed awk git 
do
  if [ `which ${required_progs} | grep -ci ${required_progs}` -lt 1 ]; then
    echo ">> Please install '${required_progs}' or make sure it is in the PATH"
    MISSING=1
  fi
done

if [ $MISSING -gt 0 ]; then
  echo "Usage: $0 <path to plugin repo>"
  exit
fi

if [ ! -f ${ASDF_REPO_PATH}/README.md ]; then
  echo "The asdf plugin repo is not checked out. checking out.
fi
