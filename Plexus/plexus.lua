App = Application():set {
  colour = 128,
  backgroundColour = 1,
  terminatable = true
}

App:importFromTML "Plexus/plexus.tml"

local app = {
    pages = App:query "PageContainer".result[1]
}

app.pages:selectPage "main"

App:query "#user_text":on("trigger", function(self, value)
  -- Send
end)

App:query "#send":on("trigger", function(self)
  -- Send
end)

App:start()