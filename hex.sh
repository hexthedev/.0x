#!/bin/zsh

hexDir=~/repos/.0x
hexLayoutDir=$hexDir/unity/layouts
hexShortcutsDir=$hexDir/unity/shortcuts

unityLayoutDir=~/Library/Preferences/Unity/Editor-5.x/Layouts/default
unityShortcutsDir=~/Library/Preferences/Unity/Editor-5.x/shortcuts/default

performUpdate() {
  what=$1
  from=$2
  to=$3

  echo "Updating $what by copying from $from to $to" 
  rm -r $to
  cp -r $from $to
}

update() {
  layoutFrom=$1
  layoutTo=$2
  shortcutFrom=$3
  shortcutTo=$4

  performUpdate "Unity Layouts" $layoutFrom $layoutTo
  performUpdate "Unity Shortcuts" $shortcutFrom $shortcutTo
}

case "$1" in
  --pull)
    update $unityLayoutDir $hexLayoutDir $unityShortcutsDir $hexShortcutsDir
    ;;
  --push)
    update push
    ;;
  *)
    echo "Invalid argument. Use 'pull' or 'push'."
    ;;
esac