local function DefaultCMD(projectName, fileName)
  local fileN = fileName or ''
  local projectN = projectName or ''
  local opt = {
    cargo = {
      run = "cargo run",
      build = "cargo build",
    },
    rustc = {
      run = "rustc -c " .. fileN .. " -o " .. fileN .. "-out"  .. " && " .. fileN,
      compile = "rustc -c " .. fileN .. " -o " .. fileN .. "-out" ,
    },
    nimble = {
      run = "nimble run",
      build = "nimble build"
    },
    nimc = {
      run = "nimc -c " .. fileN .. " -o " .. fileN  .. "-out".. " && " .. fileN,
      compile = "nimc -c " .. fileN .. " -o " .. fileN .. "-out",
    },
    cmake = {
      run = "cmake -GNinja -DCMAKE_BUILD_TYPE:STRING=Debug -B build/ -S ./ && ninja -C build/ && ./build/" .. projectN,
      build = "cmake -GNinja -DCMAKE_BUILD_TYPE:STRING=Debug -B build/ -S ./ && ninja -C build/",
    },
    make = {
      run = "make . &&" .. projectN,
      build = "make .",
    },
    cpp = {
      run = "g++ " .. fileN .. " -o " .. fileN .. "-out && " .. fileN .. "-out",
      compile = "g++ " .. fileN .. " -o " .. fileN .. "-out" ,
    },
    flutter = {
      run = "flutter run",
      build = "flutter build"
    },
    dart = {
      run = "dart " .. fileN .. " " .. fileN .. " && " .. fileN,
      compile = "dart -c " .. fileN .. " -o " .. fileN,
    },
    yarn = {
      run = "yarn start",
      build = "yarn build"
    },
    npm = {
      run = "npm run start",
      build = "npm run build"
    },
    django = {
      run = "./manage.py runserver",
    },
    python = {
      run = "python " .. fileN
    },
    javascript = {
      run = "node " .. fileN
    },
    lua = {
      run = "lua " .. fileN
    },
  }
  return opt
end

return DefaultCMD
