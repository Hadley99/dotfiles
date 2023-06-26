local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local volume = {}

volume.icon = wibox.widget {

    widget = wibox.widget.imagebox,
    image = "/home/hadley/.config/awesome/icons/volume/volume-medium.svg", -- Replace with the path to your volume icon image
    resize = true,
    forced_width = 20,
    forced_height = 20
}
volume.icon_container = wibox.container.place(volume.icon)

volume.slider = wibox.widget {
    bar_shape = gears.shape.rounded_rect,
    bar_height = 3,
    bar_color = "#FF0000",
    handle_color = "#FFF",
    handle_shape = gears.shape.circle,
    handle_border_color = "#000",
    handle_border_width = 1,
    minimum = 0,
    maximum = 100,
    widget = wibox.widget.slider
}

volume.popup = awful.popup {
    widget = volume.slider,
    -- hide_on_right_click = true,
    ontop = true,
    visible = false,
    type = 'normal',
    maximum_width = 400,
    maximum_height = 50,
    shape = function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, 6)
    end
}

-- Function to toggle the volume slider popup
function volume.toggle_popup()
    if volume.popup.visible then
        volume.popup.visible = false
    else
        -- Update the volume slider position and value
        local volume_level = tonumber(io.popen("amixer -D pulse sget Master"):read("*all"):match("(%d?%d?%d)%%"))
        volume.slider:set_value(volume_level)

        -- Show the volume slider popup
        -- Calculate the position below the wibar
        local screen_geometry = awful.screen.focused().geometry
        local slider_width = 400 -- Specify the desired width of the slider

        -- Position the popup below the wibar
        volume.popup:geometry({
            x = mouse.coords().x - (slider_width - 10),
            y = mouse.coords().y + 18,
            width = slider_width,
            height = 50
        })
        -- 
        -- volume.popup:move_next_to(mouse.current_widget_geometry)
        volume.popup.visible = true
        -- volume.popup:move_next_to(volume.icon_container)
    end
end

function volume.update_icon()
    local volume_level = tonumber(io.popen("amixer -D pulse sget Master"):read("*all"):match("(%d?%d?%d)%%"))

    if volume_level >= 75 then
        volume.icon.image = "/home/hadley/.config/awesome/icons/volume/volume-medium.svg"

    elseif volume_level >= 25 then
        volume.icon.image = "/home/hadley/.config/awesome/icons/volume/volume-low.svg"

    elseif volume_level > 0 then
        volume.icon.image = "/home/hadley/.config/awesome/icons/volume/volume-zero.svg"

    else
        volume.icon.image = "/home/hadley/.config/awesome/icons/volume/volume-mute.svg"
    end

end

awful.widget.watch("amixer -D pulse sget Master", 2, function(widget, stdout)
    volume.update_icon()
    local volume_level = tonumber(stdout:match("(%d?%d?%d)%%"))
    volume.slider:set_value(volume_level)
end)

volume.slider:connect_signal("property::value", function()
    local volume_level = volume.slider:get_value()
    os.execute("amixer -D pulse sset Master " .. volume_level .. "%")
end)

volume.icon:connect_signal("button::press", function(_, _, _, button)
    if button == 1 then -- Left mouse button
        volume.toggle_popup()
    end
end)

return volume
