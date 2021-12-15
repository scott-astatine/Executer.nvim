local api = vim.api

local conf = {
    bufnr = nil,
    tabpages = {},
    winopts = {
      relativenumber = false,
      number = false,
      list = false,
      winfixwidth = true,
      winfixheight = true,
      foldenable = false,
      spell = false,
      signcolumn = 'yes',
      foldmethod = 'manual',
      foldcolumn = '0',
      cursorcolumn = false,
      cursorline = false,
      colorcolumn = '0',
      wrap = false,
    },
    bufopts = {
      {name = 'swapfile', val = false},
      {name = 'modifiable', val = false},
      {name = 'filetype', val = 'Executer'}
    },
    mappings = {
      { key = "q", cb = "<cmd>bdelete!Executer<cr>" },
    }
}

local function bufConf()
    for _, bn in ipairs(api.nvim_list_bufs()) do
      if vim.fn.bufname(bn) == "Executer" then
        pcall(api.nvim_buf_delete, bn, { force = true })
      end
    end

    conf.bufnr = vim.fn.bufnr()
    api.nvim_buf_set_name(conf.bufnr, 'Executer')

    for _, opt in ipairs(conf.bufopts) do
      vim.bo[conf.bufnr][opt.name] = opt.val
    end

    for _, b in pairs(conf.mappings) do
      api.nvim_buf_set_keymap(conf.bufnr, b.mode or 'n', b.key, b.cb, {noremap = true, silent = true, nowait = true})
    end
    return conf.bufnr
end

local function execWin(cmd)
  api.nvim_command('sp term://' .. cmd)
  bufConf()
  api.nvim_command("resize 10")
  for k, v in pairs(conf.winopts) do
    vim.wo[k] = v
  end
  api.nvim_command("wincmd p")
end

return execWin
