local wibox = require("wibox")

-- Create a textclock widget
local clock_widget = wibox.widget.textclock("%b %d %a %I:%M%p")
clock_widget.font = "Roboto Bold 10"
clock_widget.markup = '<span color="#FFFFFF" >' .. clock_widget.text .. '</span>'

return clock_widget
