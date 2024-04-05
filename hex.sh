#!/bin/zsh

hexDir=~/repos/.0x
hexLayoutDir=$hexDir/unity/layouts
unityLayoutDir=~/Library/Preferences/Unity/Editor-5.x/Layouts/default

update() {
  targ=$1
  dest=$2

  # Unity Layouts
  echo "Copying Unity Layouts from $targ to $dest" 
  rm -r $dest
  cp -r $targ $dest
}

case "$1" in
  --pull)
    update $unityLayoutDir $hexLayoutDir
    ;;
  --push)
    update push
    ;;
  *)
    echo "Invalid argument. Use 'pull' or 'push'."
    ;;
esac