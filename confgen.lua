cg.addPath('articles', '.')
cg.addPath('scripts')
cg.addFile('index.html.cgt')
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

    local function dateToNumber(date_str)
        local day, month, year = date_str:match("(%d%d)-(%d%d)-(%d%d%d%d)")
        return tonumber(year .. month .. day)
    end

    table.sort(list, function (a, b)
        return dateToNumber(a.date) < dateToNumber(b.date)
    end)

    return list
end

cg.opt.articles = getArticles();
cg.opt.style = require('style')

cg.opt.doctype = "<!doctype html>"
cg.opt.header_links = [[
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-adsense-account" content="ca-pub-5734329956723165">
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-5734329956723165" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/c95d3d678b.js" crossorigin="anonymous"></script>
<link type="text/css" rel="stylesheet" href="style.css">
<link rel="apple-touch-icon" sizes="180x180" href="assets/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon-16x16.png">
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
