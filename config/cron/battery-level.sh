export DISPLAY=:0

battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 85 ]
then
    notify-send --urgency=critical "Battery low" "Battery level is ${battery_level}%!"
fi
