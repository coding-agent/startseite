return function (file)
    local highlighted = io.popen("tree-sitter highlight -H code_snippets/" .. file):read("*a")

    highlighted = highlighted:gsub("<head.-</head>", "")
    highlighted = highlighted:gsub("<body>", '<div class="code">')
    highlighted = highlighted:gsub("</body>", "</div>")

    return highlighted
end
