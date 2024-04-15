#!/bin/zsh

hexDir=~/repos/.0x
hexLayoutDir=$hexDir/unity/layouts
hexShortcutsDir=$hexDir/unity/shortcuts
hexJetbrainsKeymapsDir=$hexDir/jetbrains/keymaps
hexZshRcPath=$hexDir/.zshrc

unityLayoutDir=~/Library/Preferences/Unity/Editor-5.x/Layouts/default
unityShortcutsDir=~/Library/Preferences/Unity/Editor-5.x/shortcuts/default

systemIdeaVimRCPath=~/.ideavimrc
systemZshRcPath=~/.zshrc

jetbrainsRiderKeys='/Users/james.mccafferty/Library/Application Support/JetBrains/Rider2024.1/keymaps'
jetbrainsPycharmKeys='/Users/james.mccafferty/Library/Application Support/JetBrains/PyCharm2024.1/keymaps'

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
    performUpdate "Jetbrains Keymaps" $jetbrainsRiderKeys $hexJetbrainsKeymapsDir
    performUpdate ".zshrc" $systemZshRcPath $hexZshRcPath
    ;;
  --push)
    performUpdate "Unity Layouts" $hexLayoutDir $unityLayoutDir
    performUpdate "Unity Shortcuts" $hexShortcutsDir $unityShortcutsDir
    performUpdate "Jetbrains Keymaps (Rider)" $hexJetbrainsKeymapsDir $jetbrainsRiderKeys
    performUpdate "Jetbrains Keymaps (Pycharm)" $hexJetbrainsKeymapsDir $jetbrainsPycharmKeys
    performUpdate ".zshrc" $hexZshRcPath $systemZshRcPath
    ;;
  *)
    echo "Failed"
    ;;
esac