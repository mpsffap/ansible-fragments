local M = {}

function M.find_files_slight()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "/",
		prompt_title = "  /  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_root()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "/root",
		prompt_title = "  /root  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_home()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "~",
		prompt_title = "  ~  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_mps()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "~/mps",
		prompt_title = "  ~/mps  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_scratch()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "~/mps/scratch",
		prompt_title = "  ~/mps/scratch  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_repo()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "~/mps/repo",
		prompt_title = "  ~/mps/repo  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_etc()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "/etc",
		prompt_title = "  /etc  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_var()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "/var",
		prompt_title = "  /var  ",
		follow = true,
		hidden = true,
	}))
end

function M.find_files_log()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	builtin.find_files(themes.get_ivy({
		cwd = "/var/log",
		prompt_title = "  /var/log  ",
		follow = true,
		hidden = true,
	}))
end

return M