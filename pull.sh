#!/bin/zsh
hexDir=~/repos/.0x
layoutDir=$hexDir/unity/layouts

rm -r $layoutDir
mkdir $layoutDir
cp -r ~/Library/Preferences/Unity/Editor-5.x/Layouts/default $layoutDir

cd $layoutDir
pwd
