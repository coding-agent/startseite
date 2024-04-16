cg.addFile('index.html.cgt')
cg.addFile('style.css.cgt')

cg.opt.articles = {}

for file in io.popen('ls articles/'):lines() do
    if file:sub(-4) == ".lua" then
        local article = loadfile("articles/" .. file)()
        if article then
            article.file = "articles/" .. file:gsub("%.lua$", ".html")
            cg.addFile(article.file .. ".cgt")
            cg.opt.articles[file:gsub("%.lua$", "")] = article;
        end
    end
end

cg.opt.style = require('style')
cg.opt.doctype = "<!doctype html>"
cg.opt.header_links = [[
<link rel="stylesheet" type="text/css" href="/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Share+Tech&display=swap" rel="stylesheet">
]]
