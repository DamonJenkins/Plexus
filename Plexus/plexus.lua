_G.util = require "lib.util" -- Work around for WIP pre-init file

App = Plexus "/Titanium":set {
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

App:start()
