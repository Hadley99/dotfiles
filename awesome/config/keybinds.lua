local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

local keybinds = {}

-- local MODKEY = "Mod4"

-- {{{ Key bindings
keybinds.globalkeys = gears.table.join(awful.key({MODKEY}, "r", function()
    awful.spawn.with_shell("rofi -show drun")
end, {
    description = "Open rofi drun menu",
    group = "launcher"
}), awful.key({MODKEY, "Shift"}, "s", function()
    awful.spawn.with_shell("flameshot gui")
end, {
    description = "Take a screenshot",
    group = "launcher"
}), awful.key({MODKEY}, "s", hotkeys_popup.show_help, {
    description = "show help",
    group = "awesome"
}), awful.key({MODKEY, "Shift"}, "Tab", awful.tag.viewprev, {
    description = "view previous",
    group = "tag"
}), awful.key({MODKEY}, "Tab", awful.tag.viewnext, {
    description = "view next",
    group = "tag"
}), awful.key({MODKEY}, "Escape", awful.tag.history.restore, {
    description = "go back",
    group = "tag"
}),

-- Cycle focus
awful.key({"Mod1"}, "Tab", function()
    awful.client.focus.byidx(1)
    if client.focus then
        client.focus:raise()
    end
end, {
    description = "Cycle Through client",
    group = "client"
}), --
awful.key({"Mod1", "Shift"}, "Tab", function()
    awful.client.focus.byidx(-1)
    if client.focus then
        client.focus:raise()
    end
end, {
    description = "Cycle Through client (Reverse)",
    group = "client"
}),

-- Focus
awful.key({MODKEY}, "h", function()
    awful.client.focus.bydirection('left')
end, {
    description = "focus left client",
    group = "client"
}), awful.key({MODKEY}, "j", function()
    awful.client.focus.bydirection('down')
end, {
    description = "focus down client",
    group = "client"
}), awful.key({MODKEY}, "k", function()
    awful.client.focus.bydirection('up')
end, {
    description = "focus up client",
    group = "client"
}), awful.key({MODKEY}, "l", function()
    awful.client.focus.bydirection('right')
end, {
    description = "focus right client",
    group = "client"
}), awful.key({MODKEY}, "w", function()
    mymainmenu:show()
end, {
    description = "show main menu",
    group = "awesome"
}),

-- Layout manipulation
awful.key({MODKEY, "Shift"}, "h", function()
    awful.client.swap.bydirection("left")
end, {
    description = "Swap with left client",
    group = "Client"
}), --
awful.key({MODKEY, "Shift"}, "j", function()
    awful.client.swap.bydirection('down')
end, {
    description = "swap with down client",
    group = "client"
}), -- 
awful.key({MODKEY, "Shift"}, "k", function()
    awful.client.swap.bydirection("up")
end, {
    description = "swap with up client",
    group = "client"
}), -- 
awful.key({MODKEY, "Shift"}, "l", function()
    awful.client.swap.bydirection("right")
end, {
    description = "swap with right client",
    group = "client"
}), -- 
awful.key({MODKEY}, "u", awful.client.urgent.jumpto, {
    description = "jump to urgent client",
    group = "client"
}),

-- Standard program
awful.key({MODKEY}, "Return", function()
    awful.spawn(TERMINAL)
end, {
    description = "open a terminal",
    group = "launcher"
}), awful.key({MODKEY, "Control"}, "r", awesome.restart, {
    description = "reload awesome",
    group = "awesome"
}), awful.key({MODKEY, "Shift"}, "q", awesome.quit, {
    description = "quit awesome",
    group = "awesome"
}), awful.key({MODKEY}, "l", function()
    awful.tag.incmwfact(0.05)
end, {
    description = "increase master width factor",
    group = "layout"
}), awful.key({MODKEY}, "h", function()
    awful.tag.incmwfact(-0.05)
end, {
    description = "decrease master width factor",
    group = "layout"
}), -- awful.key({modkey, "Shift"}, "h", function()
--     awful.tag.incnmaster(1, nil, true)
-- end, {
--     description = "increase the number of master clients",
--     group = "layout"
-- }), awful.key({modkey, "Shift"}, "l", function()
--     awful.tag.incnmaster(-1, nil, true)
-- end, {
--     description = "decrease the number of master clients",
--     group = "layout"
-- }),
awful.key({MODKEY, "Control"}, "h", function()
    awful.tag.incncol(1, nil, true)
end, {
    description = "increase the number of columns",
    group = "layout"
}), awful.key({MODKEY, "Control"}, "l", function()
    awful.tag.incncol(-1, nil, true)
end, {
    description = "decrease the number of columns",
    group = "layout"
}), awful.key({MODKEY}, "space", function()
    awful.layout.inc(1)
end, {
    description = "select next",
    group = "layout"
}), awful.key({MODKEY, "Shift"}, "space", function()
    awful.layout.inc(-1)
end, {
    description = "select previous",
    group = "layout"
}), awful.key({MODKEY, "Control"}, "n", function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        c:emit_signal("request::activate", "key.unminimize", {
            raise = true
        })
    end
end, {
    description = "restore minimized",
    group = "client"
}), -- Prompt
awful.key({MODKEY}, "x", function()
    awful.prompt.run {
        prompt = "Run Lua code: ",
        textbox = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
    }
end, {
    description = "lua execute prompt",
    group = "awesome"
}))

keybinds.clientkeys = gears.table.join(awful.key({MODKEY}, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
end, {
    description = "toggle fullscreen",
    group = "client"
}), awful.key({MODKEY, "Shift"}, "c", function(c)
    c:kill()
end, {
    description = "close",
    group = "client"
}), awful.key({MODKEY, "Control"}, "space", awful.client.floating.toggle, {
    description = "toggle floating",
    group = "client"
}), awful.key({MODKEY, "Control"}, "Return", function(c)
    c:swap(awful.client.getmaster())
end, {
    description = "move to master",
    group = "client"
}), awful.key({MODKEY}, "o", function(c)
    c:move_to_screen()
end, {
    description = "move to screen",
    group = "client"
}), awful.key({MODKEY}, "t", function(c)
    c.ontop = not c.ontop
end, {
    description = "toggle keep on top",
    group = "client"
}), awful.key({MODKEY}, "n", function(c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
end, {
    description = "minimize",
    group = "client"
}), awful.key({MODKEY}, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
end, {
    description = "(un)maximize",
    group = "client"
}), awful.key({MODKEY, "Control"}, "m", function(c)
    c.maximized_vertical = not c.maximized_vertical
    c:raise()
end, {
    description = "(un)maximize vertically",
    group = "client"
}), awful.key({MODKEY, "Shift"}, "m", function(c)
    c.maximized_horizontal = not c.maximized_horizontal
    c:raise()
end, {
    description = "(un)maximize horizontally",
    group = "client"
}))

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    keybinds.globalkeys = gears.table.join(keybinds.globalkeys, -- View tag only.
    awful.key({MODKEY}, "#" .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end, {
        description = "view tag #" .. i,
        group = "tag"
    }), -- Toggle tag display.
    awful.key({MODKEY, "Control"}, "#" .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            awful.tag.viewtoggle(tag)
        end
    end, {
        description = "toggle tag #" .. i,
        group = "tag"
    }), -- Move client to tag.
    awful.key({MODKEY, "Shift"}, "#" .. i + 9, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
            end
        end
    end, {
        description = "move focused client to tag #" .. i,
        group = "tag"
    }), -- Toggle tag on focused client.
    awful.key({MODKEY, "Control", "Shift"}, "#" .. i + 9, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:toggle_tag(tag)
            end
        end
    end, {
        description = "toggle focused client on tag #" .. i,
        group = "tag"
    }))
end

keybinds.clientbuttons = gears.table.join(awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {
        raise = true
    })
end), awful.button({MODKEY}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", {
        raise = true
    })
    awful.mouse.client.move(c)
end), awful.button({MODKEY}, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", {
        raise = true
    })
    awful.mouse.client.resize(c)
end))

return keybinds
-- }}}
