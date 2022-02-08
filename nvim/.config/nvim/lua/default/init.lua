-- local c = require 'custom'
-- c:get {'mappings.normal.lsp', default = 'l'}
-- c:get('mappings.normal.lsp', 'l')

local M = {}

function M:init()
    local ok, mod = pcall(require, 'custom.mappings')
    if ok and type(mod) == 'table' then
        M = vim.tbl_deep_extend('error', self, {mappings = mod})
    end
end

function M:get(key, default)
    local split_key = vim.split(key, '.', {plain=true, trimempty=true})
    local target = self
    for i, key in ipairs(split_key) do
        if vim.tbl_contains(vim.tbl_keys(target), key) then
            target = target[key]
        else
            return default
        end
    end
    return target
end

-- function M:inject(key, opts)
--     local split_key = vim.split(key, '.', {plain=true, trimempty=true})
--     local target = self
--     for i, key in ipairs(split_key) do
--         if vim.tbl_contains(vim.tbl_keys(target), key) then
--             target = target[key]
--         else
--             return default
--         end
--     end
--     if type(target) == 'function' then
--         target(opts)
--     else
--         return target
--     end
-- end

M:init()

return M
