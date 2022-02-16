#!/usr/bin/env bash

ASDF_REPO_PATH=./asdf-plugin-repo

if [ ! -f ${ASDF_REPO_PATH}/README.md ]; then
  echo "The asdf plugin repo is not checked out. checking out."
  git submodule update --init --remote --force --recursive
  if [ ! -f ${ASDF_REPO_PATH}/README.md ]; then
    echo ">> Error... couldn't get a working checkout of the asdf plugin repo."
    fallback_count=`wc -l fallback/load_plugins`
    echo "If you want to continue with the cached ${fallback_count} entries enter \"GO AHEAD\":"
    read confirmation
    if [ `echo "${confirmation}" | grep -i ahead | grep -ci go` -gt 0 ]; then
      echo "Proceeding with massive plugin load up"
      bash fallback/load_plugins
      exit 0
    fi
  fi
fi

plugin_count=`find ${ASDF_REPO_PATH}/plugins -type f | wc -l`

echo "Repo successfully downloaded. There are ${plugin_count} plugins to load. Enter \"GO AHEAD\" to add:"
read confirmation
if [ `echo "${confirmation}" | grep -i ahead | grep -ci go` -gt 0 ]; then
  echo "Proceeding with massive plugin load up"

  for plugin in `find ${ASDF_REPO_PATH}/plugins -type f`
  do
    #./asdf-plugin-repo/plugins/conform
    plugin_name=`echo ${plugin} |  tr '/' '\012' | tail -1 | awk '{print $1}'`
    plugin_url=`cat ${plugin} | awk '{print $3}' | sed -e 's#git/$#git#' -e 's#git/ #git#'`
    asdf plugin add ${plugin_name} ${plugin_url}
  done
fi
