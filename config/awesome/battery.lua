local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")

local volume_widget = wibox.widget.textbox()
volume_widget:set_text("bat: ???")

local function acpi_handler(widget, stdout, stderr, exitreason, exitcode)
   local _, status, charge_str, time = string.match(stdout, '(.+): (%a+), (%d?%d%d)%%,? ?.*')
   local charge = tonumber(charge_str)
   if charge <= 15 then
      volume_widget:set_markup('<span foreground="#F06060">bat: ' .. charge_str .. "%</span>")
   else
      volume_widget:set_markup('<span>bat: ' .. charge_str .. "%</span>")
   end
end

watch("acpi", 10, acpi_handler, battery_widget)

return volume_widget
