--!strict
local fs = require("@lune/fs")
local Lynx = require("@lynx/lynx")

local app = Lynx.new()
local default_template = fs.readFile("./templates/default.html")

app:get("/", function(context)
      local root_html = fs.readFile("./views/root.html")
      local page_html = default_template:gsub("<!%-%- REPLACE_ME_WITH_BODY %-%->", root_html)

      return context:html(page_html)
end)

app:get("/install", function(context)
      local install_html = fs.readFile("./views/install.html")
      local page_html = default_template:gsub("<!%-%- REPLACE_ME_WITH_BODY %-%->", install_html)

      return context:html(page_html)
end)

print("serving app on localhost:4040")

app:serve {
      port = 4040,
}
