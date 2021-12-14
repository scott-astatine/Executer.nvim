local M = {
  {
    execType = "cargo",
    files = "Cargo.toml",
    projM = true
  },
  {
    execType = "rustc",
    files = "%.rs",
    projM = false
  },
  {
    execType = "cmake",
    files = "CMakeLists.txt",
    projM = true
  },

  {
    execType = "make",
    files = "akefile",
    projM = true
  },
  {
    execType = "cpp",
    files = "%.cpp",
    projM = false,
    compile = true
  },
  {
    execType = "nimble",
    files = "%.nimble",
    projM = true
  },
  {
    execType = "nim",
    files  = "%.nim",
    projM = false
  },

  {
    execType = "yarn",
    files = "yarn.lock",
    projM = true
  },
  {
    execType = "npm",
    files  = "-lock.json",
    projM = true
  },
  {
    execType = "flutter",
    files  = "pubspec.yaml",
    projM = true
  },
  {
    execType = "dart",
    files = "pubspec.yaml",
    projM = true
  },
  {
    execType = "django",
    files  = "manage.py",
    projM = true
  },
  {
    execType = "python",
    files  = "%.py",
    projM = false
  },
  {
    execType = "lua",
    files  = "%.lua",
    projM = false
  },
  {
    execType = "javascript",
    files  = "%.js",
    projM = false
  },
}
return M
