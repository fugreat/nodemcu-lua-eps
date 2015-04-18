wifi.setmode(wifi.STATION) 
print("[debug]Set Station Mode.")
wifi.sta.config("home","fubaiwan")
print("[debug]Login router.")
tmr.alarm(0, 1000, 1, function() --check if router is contected
    ip=wifi.sta.getip()
    if ip ~= nil then
        print("[debug]Router contected!, ip is "..ip.."\r\n")
        run("telnet.lua")
        print("[debug]open telnet\r\n")
        run("moto_driver.lua")
        print("[debug]open moto driver")
        run("mqtt.lua")
        print("[debug]open mqtt\r\n")
        tmr.stop(0)
    end 
end) 

 
function run(filename)
res=file.open(filename,"r");
file.close() 
    if res then 
        dofile(filename)
    else 
        print("No file named "..filename.." to run!")
    end
    
end
