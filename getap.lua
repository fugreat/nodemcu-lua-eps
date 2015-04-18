function getTimeHW()
    return tmr.now()/100000
end 
function getTimeWeb(tm) 
    print("getTimeWeb")
end
function syncTime(tm)
    print("syncTime")
end
tmr.alarm(1, 10000, 1, function()
    last_t = nil 
    function listap(t)
      res=file.open("log.log","a+");
      tm = getTimeHW(tm)
      if(res) then
          for k,v in pairs(t) do
              file.writeline(tm..","..k..","..v) 
              print(tm..","..k..","..v)
          end  
           
      end 
      file.close()
    end
    wifi.sta.getap(listap) 
end) 