# Disable AnyConnect to break Umbrella
echo "Disabling AnyConnect fully, VPN will disconnect"
sudo launchctl unload /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist

seconds_remain="5"

while [ $seconds_remain -gt 0 ]
do
echo "Sleeping for" $seconds_remain
sleep 1
seconds_remain=$[$seconds_remain-1]
done

# Re-register service now with Umbrella config removed
echo "Re-enabling AnyConnect, Umbrella will be broken until next connect"
sudo launchctl load /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist
