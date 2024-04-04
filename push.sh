#!/bin/zsh

# Define default values
pull=0
push=0

# Parse options
zparseopts -D --pull=pull --push=push

if [[ -n "$pull" && "$push" == 1 ]]; then
  echo "Error: --pull and --push are mutually exclusive options"
  exit 1
fi

if [[ -n "$pull" && "$push" == 0 ]]; then
  echo "Error: choose either --pull or --push"
  exit 1
fi

echo $@

#hexDir=~/repos/.0x
#hexLayoutDir=$hexDir/unity/layouts
#unityLayoutDir=

#rm -r $layoutDir
#cp -r ~/Library/Preferences/Unity/Editor-5.x/Layouts/default $layoutDir

#cd $layoutDir
#pwd
