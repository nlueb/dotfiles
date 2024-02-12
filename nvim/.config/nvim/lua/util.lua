function _G.IsWSL()
    local version = vim.fn.readfile('/proc/version', '', 1)
    if vim.tbl_isempty(version) then
        error 'Could not read /proc/version'
    end
    return string.find(version[1], 'microsoft')
end

function _G.ShowHighlightCapture()
    local current_pos = vim.inspect_pos()
    local matches = {}
    if #current_pos.treesitter > 0 then
        matches = {' Treesitter:'}
    end
    for _, hl in pairs(current_pos.treesitter) do
        if hl.hl_group_link then
            table.insert(matches, '| ' .. hl.hl_group .. ' -> ' .. hl.hl_group_link)
        else
            table.insert(matches, '| ' .. hl.hl_group)
        end
    end
    if #current_pos.semantic_tokens > 0 then
        table.insert(matches, '')
        table.insert(matches, '󰭤 Semantic Tokens:')
    end
    for _, hl in pairs(current_pos.semantic_tokens) do
        if hl.opts.hl_group_link then
            table.insert(matches, '| ' .. hl.opts.hl_group .. ' -> ' .. hl.opts.hl_group_link .. ' @ ' .. hl.opts.priority)
        else
            table.insert(matches, '| ' .. hl.opts.hl_group .. ' @ ' .. hl.opts.priority)
        end
    end
    if #current_pos.syntax > 0 then
        table.insert(matches, '')
        table.insert(matches, '󰉊 Syntax:')
    end
    for _, hl in pairs(current_pos.syntax) do
        if hl.hl_group_link then
            table.insert(matches, '| ' .. hl.hl_group .. ' -> ' .. hl.hl_group_link)
        else
            table.insert(matches, '| ' .. hl.hl_group)
        end
    end
    if #matches > 0 then
        vim.lsp.util.open_floating_preview(matches, 'hl-capture', {})
    else
        vim.lsp.util.open_floating_preview({'No highlight groups found!'}, 'hl-capture', {})
    end
end
