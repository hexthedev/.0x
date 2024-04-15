#!/bin/zsh

hexDir=~/repos/.0x
hexLayoutDir=$hexDir/unity/layouts
hexShortcutsDir=$hexDir/unity/shortcuts
hexIdeaVimRCPath=$hexDir/jetbrains/.ideavimrc
hexZshRcPath=$hexDir/.zshrc

unityLayoutDir=~/Library/Preferences/Unity/Editor-5.x/Layouts/default
unityShortcutsDir=~/Library/Preferences/Unity/Editor-5.x/shortcuts/default

systemIdeaVimRCPath=~/.ideavimrc
systemZshRcPath=~/.zshrc

performUpdate() {
  what=$1
  from=$2
  to=$3

  echo "Updating $what by copying from $from to $to" 
  rm -r $to
  cp -r $from $to
}

case "$1" in
  --pull)
    performUpdate "Unity Layouts" $unityLayoutDir $hexLayoutDir
    performUpdate "Unity Shortcuts" $unityShortcutsDir $hexShortcutsDir
    performUpdate ".ideavimrc" $systemIdeaVimRCPath $hexIdeaVimRCPath
    performUpdate ".zshrc" $systemZshRcPath $hexZshRcPath
    ;;
  --push)
    performUpdate "Unity Layouts" $hexLayoutDir $unityLayoutDir
    performUpdate "Unity Shortcuts" $hexShortcutsDir $unityShortcutsDir
    performUpdate ".ideavimrc" $hexIdeaVimRCPath $systemIdeaVimRCPath
    performUpdate ".zshrc" $hexZshRcPath $systemZshRcPath
    ;;
  *)
    echo "Failed"
    ;;
esac