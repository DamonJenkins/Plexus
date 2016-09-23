_G.util = require "lib.util" -- Work around for WIP pre-init file

_G.App = Plexus "/":set {
  colour = 128,
  backgroundColour = 1,
  terminatable = true
}

App:importFromTML "Plexus/ui/plexus.tml"

local app = {
    defaultTheme = Theme.fromFile("defaultTheme", "Plexus/ui/themes/default.theme"),
    pages = App:query "PageContainer".result[1]
}

app.pages:selectPage "main"
App:addTheme(app.defaultTheme)

App:query "Button#exit":on("trigger", function() App:stop(); term.clear(); term.setCursorPos( 1, 1 ) end)

App:query "#control_bar > Button#up":on("trigger", function( self )
    App:navigateUp()
end)

App:query "#control_bar > Button#sidebar_toggle":on("trigger", function()
    App:toggleSidebar()
end)

App:query "#back":on("trigger", function( self )
    local pos = #App.history.entries + App.history.offset
    if pos > 1 then
        App:historyNavigate(-1)
        local pos = #App.history.entries + App.history.offset
        App:goToDirectory(Plexus.static.cleanPath( App.history.entries[ pos ] ), true )
    end
end)

App:query "#next":on("trigger", function( self )
    local pos = #App.history.entries + App.history.offset
    if pos < #App.history.entries then
        App:historyNavigate(1)
        local pos = #App.history.entries + App.history.offset
        App:goToDirectory( Plexus.static.cleanPath( App.history.entries[ pos ] ), true )
    end
end)

App:query "#header_container Button":on("trigger", function( self )
    App:sortBy( self.id == "name_header" and "Name" or "Size" )
end)

App:start()
