-- confgen.lua

cg.addFile("confgen.ini.cgt")

-- optionally you could also sent an output path
-- otherwise it will output to the cwd
-- both absolute and relative paths work

cg.addFile("confgen.ini.cgt", "relative/path")

-- recursively adds files inside a path

cg.addPath(".config")

-- You can also set an output path here
cg.addPath(".config", "relative/path")
