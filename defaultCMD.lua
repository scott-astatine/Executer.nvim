local function DefaultCMD(projectName, fileName)
  local fileN = fileName or ''
  local projectN = projectName or ''
  local opt = {
    cargo = {
      run = "cargo run",
      build = "cargo build",
      fmt = "cargo fmt"
    },
    rustc = {
      run = "rustc -c " .. fileN .. " -o /tmp/" .. fileN .. " && /tmp/" .. fileN,
      compile = "rustc -c " .. fileN .. " -o /tmp/" .. fileN,

    },
    nimble = {
      run = "nimble run",
      build = "nimble build"
    },
    nimc = {
      run = "nimc -c " .. fileN .. " -o /tmp/" .. fileN .. " && /tmp/" .. fileN,
      compile = "nimc -c " .. fileN .. " -o /tmp/" .. fileN,

    },
    cmake = {
      run = [[cmake -GNinja -DCMAKE_BUILD_TYPE:STRING=Debug -B build/ -S ./ && ninja -C build/ && ./build/]] .. projectN,
      build = "cmake -GNinja -DCMAKE_BUILD_TYPE:STRING=Debug -B build/ -S ./ && ninja -C build/",
    },
    cpp = {
      run = "gcc -c " .. fileN .. " -o /tmp/" .. fileN .. " && /tmp/" .. fileN,
      compile = "gcc -c " .. fileN .. " -o /tmp/" .. fileN,

    },
    yarn = {
      run = "yarn dev",
      build = "yarn build"
    },
    npm = {
      run = "npm run dev",
      build = "npm run build"
    },
    django = {
      run = "./manage.py runserver",
    },
    python = {
      run = "python " .. fileN
    },
    node = {
      run = "node " .. fileN
    },
    lua = {
      run = "lua " .. fileN
    },
  }
  return opt
end

return DefaultCMD
