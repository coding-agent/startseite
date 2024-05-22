-- how-to-build-a-blog-the-hard-way.lua

return {
    title = "How to build a blog the hard way?",
    lang = "eng",
    date = "14-04-2024",
}

-- confgen.lua

cg.addFile("how-to-build-a-blog-the-hard-way.html.cgt")

-- Import the metadata to then be passed to opt.article
-- to be used inside the html file in this example
local article = require("how-to-build-a-blog-the-hard-way")
cg.opt.article["how-to-build-a-blog-the-hard-way"] = article

-- how-to-build-a-blog-the-hard-way.html.cgt

<! local article = opt.articles["how-to-build-a-blog-the-hard-way"] !>
<h1><% article.title %></h1>
<h2><% article.date %></h2>
