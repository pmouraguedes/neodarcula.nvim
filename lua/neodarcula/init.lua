-- Define the neodarcula colorscheme
local M = {}

M.colors = {
	fg = "#BCBEC4", -- General text
	bg_inactive = "#000000", -- Inactive window background
	bg = "#1E1F22",
	selection = "#214283", -- Selection background (more blue)
	current_line = "#26282E", -- Current line highlight
	string = "#6AAB73", -- Strings
	number = "#56A8F5", -- Numbers
	keyword = "#CF8E6D", -- Keywords (e.g., public, class, implements, enum)
	comment = "#7A7E85", -- Comments
	constant = "#C77DBB", -- Constants
	type = "#CF8E6D", -- Types (used sparingly, not for enum/class names)
	func = "#56A8F5", -- Functions/Methods/Constructors declaration (blue)
	operator = "#BCBEC4", -- Operators (matches foreground)
	error = "#BC3F3C", -- Errors
	warning = "#C29E4A", -- Warnings
	info = "#606060", -- Info
	hint = "#606060", -- Hints (same as info in Darcula)
	gray = "#606366", -- UI elements like LineNr
	annotation = "#B3AE60", -- Annotations (e.g., @Component)
	variable = "#C77DBB", -- Class/instance/static variables (pinkish-purple)
	search_bg = "#22535E", -- Other matches
	inc_search_bg = "#00006B", -- During active search
	cur_search_bg = "#00006B", -- Current match after search
	flash_label_bg = "#FF007F", -- Flash.nvim label background
	lsp_reference_text = "#373B39", -- Selection background
	eyeliner_bg = "#000000", -- eyeliner.nvim background
	eyeliner_fg = "#FFFFFF", -- eyeliner.nvim background
	float_border = "#CF8E6D",
	title = "#CF8E6D",
	special = "#D5B778", -- xml tags, tree-sitter
	treesitter_context_bg = "#373B39",
    tab_selected_bg = "#273828",
}

-- Default configuration
local default_config = {
	transparent = false,
	dim = false,
}

M.config = default_config

-- Function to setup configuration
function M.setup(opts)
	M.config = vim.tbl_extend("force", default_config, opts or {})
end

function M.load()
	vim.cmd("highlight clear")

	if vim.g.syntax_on then
		vim.cmd("syntax reset")
	end

	vim.g.colors_name = "neodarcula"

	local colors = M.colors
	local cfg = M.config

	-- TODO workaround, see bellow
	local normal_bg = colors.bg
	if cfg.transparent then
		---@diagnostic disable-next-line: cast-local-type
		normal_bg = nil
	end

	-- Apply highlights
	-- TODO somehow this doesn't work
	-- local normal_bg = cfg.transparent and nil or colors.bg
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = normal_bg })

	-- NormalNC (inactive windows) - black background
	local normalnc_bg = cfg.dim and colors.bg_inactive or nil
	vim.api.nvim_set_hl(0, "NormalNC", { fg = colors.fg, bg = normalnc_bg })

	vim.api.nvim_set_hl(0, "NormalFloat", {
		fg = colors.fg,
		bg = normal_bg,
	})
	vim.api.nvim_set_hl(0, "Visual", { bg = colors.selection })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.current_line })
	vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.current_line })
	vim.api.nvim_set_hl(0, "LineNr", {
		fg = colors.gray,
		bg = normal_bg,
	})
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.fg, bg = colors.current_line })
	vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = colors.current_line })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.gray, bg = colors.current_line })
	vim.api.nvim_set_hl(0, "VertSplit", {
		fg = colors.gray,
		bg = normal_bg,
	})
	vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = colors.current_line })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.selection })
	vim.api.nvim_set_hl(0, "Search", { bg = colors.search_bg, fg = colors.fg, bold = false })
	vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.inc_search_bg, fg = colors.fg, bold = true })
	vim.api.nvim_set_hl(0, "CurSearch", { bg = colors.cur_search_bg, fg = colors.fg, bold = true })

    -- Tabs
    vim.api.nvim_set_hl(0, "TabLineSel", { bg = colors.tab_selected_bg })

	-- Syntax highlighting (fallback)
	vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
	vim.api.nvim_set_hl(0, "String", { fg = colors.string })
	vim.api.nvim_set_hl(0, "Number", { fg = colors.number })
	vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword })
	vim.api.nvim_set_hl(0, "Constant", { fg = colors.constant })
	vim.api.nvim_set_hl(0, "Type", { fg = colors.type })
	vim.api.nvim_set_hl(0, "Function", { fg = colors.func })
	vim.api.nvim_set_hl(0, "Operator", { fg = colors.operator })
	vim.api.nvim_set_hl(0, "Identifier", { fg = colors.fg })

	-- Diagnostics (LSP)
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.info })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.hint })
	vim.api.nvim_set_hl(0, "LspInlayHint", { fg = colors.hint })

	-- Treesitter integration (fallback)
	vim.api.nvim_set_hl(0, "@keyword", { fg = colors.keyword })
	vim.api.nvim_set_hl(0, "@keyword.import", { fg = colors.keyword })
	vim.api.nvim_set_hl(0, "@namespace", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "@string", { fg = colors.string })
	vim.api.nvim_set_hl(0, "@number", { fg = colors.number })
	vim.api.nvim_set_hl(0, "@function", { fg = colors.func })
	vim.api.nvim_set_hl(0, "@function.call", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "@variable", { fg = colors.variable })
	vim.api.nvim_set_hl(0, "@comment", { fg = colors.comment, italic = true })
	vim.api.nvim_set_hl(0, "@type", { fg = colors.type })
	vim.api.nvim_set_hl(0, "@constant", { fg = colors.constant })
	vim.api.nvim_set_hl(0, "@attribute", { fg = colors.annotation })
	vim.api.nvim_set_hl(0, "Special", { fg = colors.special })
	vim.api.nvim_set_hl(0, "TreesitterContext", { bg = colors.treesitter_context_bg })

	-- LSP Semantic Tokens
	vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = colors.keyword }) -- e.g., public, class, implements, enum
	vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = colors.fg }) -- Package paths
	vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = colors.fg }) -- Class names
	vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = colors.fg }) -- Interface names
	vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = colors.fg }) -- Enum names (e.g., InventoryError)
	vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = colors.fg }) -- Default for all methods
	vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = colors.fg }) -- Function/method calls
	vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = colors.fg }) -- Variables (general)
	vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = colors.variable }) -- Class/instance/static fields
	vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = colors.fg }) -- Parameters
	vim.api.nvim_set_hl(0, "@lsp.type.constant", { fg = colors.constant })
	vim.api.nvim_set_hl(0, "@lsp.type.string", { fg = colors.string })
	vim.api.nvim_set_hl(0, "@lsp.type.number", { fg = colors.number })
	vim.api.nvim_set_hl(0, "@lsp.type.operator", { fg = colors.operator })
	vim.api.nvim_set_hl(0, "@lsp.type.annotation", { fg = colors.annotation })
	vim.api.nvim_set_hl(0, "@lsp.mod.annotation", { fg = colors.annotation })
	vim.api.nvim_set_hl(0, "@lsp.mod.constructor", { fg = colors.func }) -- General constructors (blue)
	vim.api.nvim_set_hl(0, "@lsp.typemod.method.declaration", { fg = colors.func }) -- Method declarations
	vim.api.nvim_set_hl(0, "@lsp.typemod.enum.constructor", { fg = colors.func }) -- Enum constructors (blue)
	vim.api.nvim_set_hl(0, "@lsp.typemod.type.struct", { fg = colors.func }) -- Structs (blue)
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = colors.keyword }) -- Default library variables
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly", { fg = colors.variable }) -- Readonly variables (pinkish-purple)
	vim.api.nvim_set_hl(0, "@lsp.typemod.string.format", { fg = colors.keyword }) -- String format specifiers
	vim.api.nvim_set_hl(0, "@lsp.typemod.type", { fg = colors.func }) -- Types (blue)
	vim.api.nvim_set_hl(0, "@lsp.typemod.type.defaultLibrary", { fg = colors.keyword }) -- Default library types

	vim.api.nvim_set_hl(0, "LspReferenceText", { bg = colors.lsp_reference_text, underline = false }) -- Gray background for text references

	vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.float_border, bg = normal_bg })
	vim.api.nvim_set_hl(0, "Title", { fg = colors.title })

	-- Telescope integration
	vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.title, bg = normal_bg })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = colors.fg, bg = normal_bg })
	vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = colors.fg })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = normal_bg })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.selection })

	-- fzf-lua integration
	-- faz-lua will inherit Title and other groups automatically

	-- Flash.nvim
	vim.api.nvim_set_hl(0, "FlashLabel", {
		fg = colors.flash_label_bg,
		bg = normal_bg,
		bold = true,
	})

	-- eyeliner.nvim
	vim.api.nvim_set_hl(
		0,
		"EyelinerPrimary",
		{ fg = colors.eyeliner_fg, bg = colors.eyeliner_bg, bold = true, underline = false }
	)
	vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.eyeliner_fg, bg = colors.eyeliner_bg, underline = false })
end

return M
