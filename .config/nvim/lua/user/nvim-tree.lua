local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

nvim_tree.setup({
  view = {
    mappings = {
      list = {
        { key = 'vs', action = 'vsplit' },
        { key = 'hs', action = 'split' },
      }
    },
  },
})
