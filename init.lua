wifi.setmode(wifi.STATIONAP) 
print("[debug]Set Station Mode.")
wifi.sta.config("home","fubaiwan")
print("[debug]Login router.")
cfg={}
cfg.ssid="eps"
cfg.pwd="12345678"
wifi.ap.config(cfg)
tmr.alarm(0, 1000, 1, function() --check if router is contected
    ip=wifi.sta.getip()
    if ip ~= nil then
        dofile("getap.lua");
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
