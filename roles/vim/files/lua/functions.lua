local function _is_treesitter_hl()
	for _, highlighter in pairs(vim.treesitter.highlighter.active) do
		if highlighter.bufnr == vim.api.nvim_get_current_buf() then
			return true
		end
	end
	return false
end

function ShowHighlightCaptures()
	local fn = vim.fn
	if _is_treesitter_hl() then
		vim.cmd('TSHighlightCapturesUnderCursor')
	else
		local matches = {}
		for _, id in pairs(fn.synstack(fn.line('.'), fn.col('.'))) do
			local id2 = fn.synIDtrans(id)
			local name1 = fn.synIDattr(id, 'name')
			local name2 = fn.synIDattr(id2, 'name')
			table.insert(matches, '@' .. name1 .. ' -> ' .. name2)
		end
		if #matches == 0 then
			matches = {"No highlight group found!"}
		end
		vim.lsp.util.open_floating_preview(matches, "treesitter-hl-captures")
	end
end
