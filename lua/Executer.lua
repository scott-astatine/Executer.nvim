local M = {}
M.dCMD = require('Executer.defaultCMD')
local stId = require('Executer.identifiers')
local outputWin = require('Executer.outputWin')
local cFcmd = {}
local singleFrun = false
local runfileName = nil


local function loadConfig(path)
  local contents = ''
  local file = io.open(path, "r")

  if file then
    contents = file:read("*a")
    local ok, res = pcall(vim.fn.json_decode, contents)
    io.close(file)
    if ok then
      return res
    else
      return nil
    end
  end
end

-- Generate config with default config structure
M.generateConfig = function ()
  M.setup()
  local c = {
    projectName = vim.g.projectName or '',
    cmd = M.dCMD(vim.g.projectName, runfileName)[vim.g.execType] or {
      run = "",
      build = ""
    }
  }
  local ok, jsonStr = pcall(vim.fn.json_encode, c)
  if ok then
    local cFile = io.open(".ExecuterConf.json", "w+")
    if cFile then
      cFile:write(jsonStr)
      cFile:close()
    end
  end
end

-- Returns a string containing space separated items
local function walkDir(directory)
    local t, popen = "", io.popen
    local pfile = popen('ls "'..directory..'"')
    for filename in pfile:lines() do
        t = t .. " " .. filename
    end
    pfile:close()
    return t
end

-- Gets config for current project
M.setup = function ()
  local findfile = function (file)
    if vim.fn.findfile(file, ';') ~= '' then
      return true
    else
      return false
    end
  end
  if findfile('.ExecuterConf.json') then
    local confFile = loadConfig(vim.fn.getcwd() .. '/.ExecuterConf.json')
    if confFile then
      if confFile.projectName then
        vim.g.projectName = confFile.projectName
      end
      if confFile.cmd then
        cFcmd = confFile.cmd
      end
    end
  else
    local dirList = walkDir(vim.fn.getcwd())
    local bufname = vim.fn.bufname(vim.fn.bufnr())
    local function dListhas(str)
      if dirList:match(str) then
        return true
      else
        return false
      end
    end

    for _, v in pairs(stId) do
      if v.projM then
        if dListhas(v.files) then
          vim.g.execType = v.execType
          break
        end
      else
        if dListhas(v.files) or bufname:match(v.files) then
          singleFrun = true
          vim.g.execType = v.execType
          runfileName = bufname
          break
        end
      end
    end
  end
end

-- Runs the project
M.runProject = function ()
  M.setup()
  if cFcmd.run then
    outputWin(cFcmd.run)
  else
    if singleFrun then
      outputWin(M.dCMD(vim.g.projectName, runfileName)[vim.g.execType].run)
    elseif vim.g.execType then
      local exe = M.dCMD(vim.g.projectName)[vim.g.execType].run
      outputWin(exe)
    else
      print("Could not determine what language or project manager you're using!\nDefine `cmd` run, build cmd in `.ExecuterConf.json file")
    end
  end
end

-- Builds the project
M.buildProject = function ()
  M.setup()
  if cFcmd.build then
    outputWin(cFcmd.build)
  else
    if singleFrun then
      local compileC = M.dCMD(vim.g.projectName, runfileName)[vim.g.execType].compile
      local runC = M.dCMD(vim.g.projectName, runfileName)[vim.g.execType].run
      if compileC then
        outputWin(compileC)
      else
        outputWin(runC)
      end
    elseif vim.g.execType then
      outputWin(M.dCMD(vim.g.projectName)[vim.g.execType].build)
    else
      print("Project build cmd not configured!")
    end
  end
end


return M
