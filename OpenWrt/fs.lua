local fs = {}

fs.dir = {}

function fs.dir.make(path)
 path = path .."/" or "/bin/"

 local PATH = ""
 for dir in path:gmatch("(.-)/") do
  PATH = PATH .."/" ..dir
  if fs.dir.exist(PATH) == false then
   os.execute('mkdir ' ..PATH .." &>/dev/null")
  end
 end
 return fs.dir.exist(path)
end

function fs.dir.remove(path)
 path = path or "/tmp"
 
 if fs.dir.exist(path) then
  os.execute('rm -f -r ' ..path)
  if fs.dir.exist(path) == false then
   return true
  end
 end
 return false
end

function fs.dir.move(oldPath, newPath)
 oldPath = oldPath or "/"
 newPath = newPath or "/"
 
 if fs.dir.exist(oldPath) == true and fs.dir.exist(newPath) == false then
  os.execute('mv ' ..oldPath ..' ' ..newPath)
  if fs.dir.exist(newPath) == true then
   return true
  end  
 end
 return false
end

function fs.dir.rename(oldPath, newPath)
 return fs.dir.move(oldPath, newPath)
end

function fs.dir.copy(fromPath, toPath)
 fromPath = fromPath or "/"
 toPath = toPath or "/"
 
 if fs.dir.exist(fromPath) == true and fs.dir.exist(toPath) == false then
  os.execute('cp -r ' ..fromPath ..' ' ..toPath)
  if fs.dir.exist(toPath) == true then
   return true
  end  
 end
 return false
end

function fs.dir.exist(path)
 path = path or "/bin"

 if os.rename(path, path) then
  return true
 else
  return false
 end
end



fs.file = {}

function fs.file.make(path)
 path = path .."/" or "/bin/"
end

fs.file.text = {}

return fs
