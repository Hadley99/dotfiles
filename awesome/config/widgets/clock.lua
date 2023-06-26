local wibox = require("wibox")

-- Create a textclock widget
local clock_widget = wibox.widget.textclock("%b %d %a %I:%M%p")
clock_widget.font = "Roboto Bold 10"

local textclock_clr = wibox.widget.background()
textclock_clr:set_widget(clock_widget)
textclock_clr:set_fg("#FFFFFF")

return textclock_clr
