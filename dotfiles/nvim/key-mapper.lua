local M = {}

local normalMode = 'n'
local anyMode = ''

function M.loadKeyBindings()
  -- deactivate Keys
  M.deactivateKey(anyMode, '<up>', '<nop>')
  M.deactivateKey(anyMode, '<down>', '<nop>')
  M.deactivateKey(anyMode, '<left>', '<nop>')
  M.deactivateKey(anyMode, '<right>', '<nop>')

  toggleNvimTree()

  splitMoveWrapper()
end

function toggleNvimTree()
  M.mapKey(normalMode,'<Leader>t',":NvimTreeToggle <CR>")
end

function splitMoveWrapper()
  function splitMoveLeft()
    M.mapKey(normalMode,'<Leader>h','<C-W>h')
  end

  function splitMoveDown()
    M.mapKey(normalMode,'<Leader>j','<C-W>j')
  end

  function splitMoveUp()
    M.mapKey(normalMode,'<Leader>k','<C-W>k')
  end

  function splitMoveRight()
    M.mapKey(normalMode,'<Leader>l','<C-W>l')
  end
  splitMoveLeft()
  splitMoveDown()
  splitMoveUp()
  splitMoveRight()
end



function M.mapKey(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

function M.deactivateKey(mode, key)
  M.mapKey(mode,key,'<nop>')
end

return M
