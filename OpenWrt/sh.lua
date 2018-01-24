local sh = {}

sh.command = ""
sh.result = "init_system"
sh.code = "init"

function sh.exec(command)
 sh.command = command or "uptime"
 sh.result = "null"

 local fd = io.popen(sh.command)
 if fd then
  sh.result = fd:read('*all')
  if sh.result then
   sh.code = "ok"
  else
   sh.code = "error receive result"
  end

  fd:close()
 else
  sh.code = "error exec command"
 end

 return sh.result, sh.code, sh.command 
end

return sh
