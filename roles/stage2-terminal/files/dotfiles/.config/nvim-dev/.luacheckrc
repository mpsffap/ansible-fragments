-- luacheck configuration
-- .luacheckrc

std = lua51

exclude_files = {
    ".deps/",
}

globals = {
    "vim",
    "describe",
    "it",
    "before_each",
    "after_each",
}

unused = false