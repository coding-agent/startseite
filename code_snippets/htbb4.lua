-- example.txt.cgt

<! local i = 0 !>
<! while i <= 5 do !>
<% i %>
<! i = i + 1 !>
<! end !>

-- confgen.lua

cg.addFile('example.txt.cgt')

-- example.txt
1
2
3
4
5
