local schema = require('vn-night.schema')

local line_theme = {}

line_theme.normal = {
	a = { bg = schema.purple, fg = schema.fg, gui = "bold" },
	b = { bg = schema.gray[4], fg = schema.gray[8] },
	c = { bg = schema.gray[4], fg = schema.fg },
}

line_theme.insert = {
	a = { bg = schema.teal, fg = schema.fg, gui = "bold" },
	b = { bg = schema.gray[4], fg = schema.gray[8] },
	c = { bg = schema.gray[4], fg = schema.fg },
}

line_theme.command = {
	a = { bg = schema.orange, fg = schema.fg, gui = "bold" },
	b = { bg = schema.gray[4], fg = schema.gray[8] },
	c = { bg = schema.gray[4], fg = schema.fg },
}

line_theme.visual = {
	a = { bg = schema.blue, fg = schema.fg, gui = "bold" },
	b = { bg = schema.gray[4], fg = schema.gray[8] },
	c = { bg = schema.gray[4], fg = schema.fg },
}

line_theme.replace = {
	a = { bg = schema.red, fg = schema.fg, gui = "bold" },
	b = { bg = schema.gray[4], fg = schema.gray[8] },
	c = { bg = schema.gray[4], fg = schema.fg },
}

line_theme.inactive = {
	a = { bg = schema.purple, fg = schema.fg, gui = "bold" },
	b = { bg = schema.gray[3], fg = schema.gray[6] },
	c = { bg = schema.gray[3], fg = schema.gray[6] },
}

return line_theme
