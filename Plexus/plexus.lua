App = Application():set {
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

App:query "#user_text":on("trigger", function(self, value)
  -- Send
end)

App:query "#send":on("trigger", function(self)
  -- Send
end)

App:start()
