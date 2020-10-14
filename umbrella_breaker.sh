#/bin/bash

# Fail if bash errors out
set -e

# Get desired umbrella state
echo "Umbrella is the worst. This tool disables Umbrella by unloading AnyConnect"
printf 'Disable AnyConnect Umbrella? (disable/enable): '
read -r UMBRELLA_STATE

# Take appropriate and decisive action
case $UMBRELLA_STATE in

  [d,D]isable)
    echo "Disabling AnyConnect - remember to enable later to fix AnyConnect"
    sudo launchctl unload /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist
    ;;

  [e,E]nable)
    echo "Disabling AnyConnect - remember to enable later to fix AnyConnect"
    sudo launchctl load /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist
    ;;
esac
