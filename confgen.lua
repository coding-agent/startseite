cg.addPath('articles', '.')
cg.addFile('index.html.cgt')
cg.addFile('script.js')
cg.addFile('style.css.cgt')

local function getArticles()
    local list = {}

    for file in io.popen('ls articles/'):lines() do
        if file:sub(-4) == ".lua" then
            local article = loadfile("articles/" .. file)()
            if article then
                article.file = file:gsub("%.lua$", ".html")
                list[file:gsub("%.lua$", "")] = article
            end
        end
    end

    -- order articles by date in descending order
    table.sort(list, function (a, b) return a.date > b.date end)

    return list
end

cg.opt.articles = getArticles();
cg.opt.style = require('style')

cg.opt.doctype = "<!doctype html>"
cg.opt.header_links = [[
<link type="text/css" rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<meta name="google-adsense-account" content="ca-pub-5734329956723165">
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5734329956723165" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/c95d3d678b.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Share+Tech&display=swap" rel="stylesheet">
]]

email = "info@coding-agent.me"
github = "https://github.com/coding-agent/"

cg.opt.menu = [[
<div class="menu">
    <a href="index.html"><i class="fa-solid fa-house"></i> Home </a>
    <a href="mailto:]] .. email .. [["> <i class="fa-solid fa-envelope"></i> Contact </a>
    <a href="]].. github ..[["> <i class="fa-brands fa-github"></i> Github </a>
</div>
]]

cg.opt.highlight = require("highlight")
