#!/bin/zsh

# source
root=~/repos/.0x
layouts=$root/unity/layouts
shortcuts=$root/unity/shortcuts
jb_keys=$root/jetbrains/keymaps
vs_keys=$root/vscode/keybindings.json
rc=$root/.zshrc

# dest
sys_layouts=~/Library/Preferences/Unity/Editor-5.x/Layouts/default
sys_shortcuts=~/Library/Preferences/Unity/Editor-5.x/shortcuts/default
sys_rider_keys=~/Library/Application\ Support/JetBrains/Rider2024.1/keymaps
sys_pycharm_keys=~/Library/Application\ Support/JetBrains/PyCharm2024.1/keymaps
sys_vs_keys=~/Library/Application\ Support/Code/User/keybindings.json
sys_rc=~/.zshrc

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
    performUpdate "Unity Layouts" $sys_layouts $layouts
    performUpdate "Unity Shortcuts" $sys_shortcuts $shortcuts
    performUpdate "Jetbrains Keymaps" $sys_rider_keys $jb_keys
    performUpdate "VS Code Keybindings" $sys_vs_keys $vs_keys
    performUpdate ".zshrc" $sys_rc $rc
    ;;
  --push)
    performUpdate "Unity Layouts" $layouts $sys_layouts
    performUpdate "Unity Shortcuts" $shortcuts $sys_shortcuts
    performUpdate "Jetbrains Keymaps (Rider)" $jb_keys $sys_rider_keys
    performUpdate "Jetbrains Keymaps (Pycharm)" $jb_keys $sys_pycharm_keys
    performUpdate "VS Code Keybindings" $vs_keys $sys_vs_keys
    performUpdate ".zshrc" $rc $sys_rc
    ;;
  *)
    echo "Use --pull to pull from system, or --push to push to system"
    ;;
esac
