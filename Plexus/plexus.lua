_G.util = require "lib.util" -- Work around for WIP pre-init file

_G.App = Plexus "/":set {
  colour = 128,
  backgroundColour = 1,
  terminatable = true
}

App:importFromTML "Plexus/ui/plexus.tml"

local app = {
    masterTheme = Theme.fromFile("masterTheme", "Plexus/ui/themes/master.theme"),
    defaultTheme = Theme.fromFile("defaultTheme", "Plexus/ui/themes/default.theme"),
    pages = App:query "PageContainer".result[1]
}

app.pages:selectPage "main"
App:addTheme(app.masterTheme)
App:addTheme(app.defaultTheme)

App:query "#control_bar > Button#up":on("trigger", function( self )
    App:navigateUp()
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

App:start()
