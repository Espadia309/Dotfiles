-- Pick the per-machine file from /etc/hostname.
-- Add a line here for each machine; unknown hostnames fall back to "desktop".
local hosts = {
	espadiacachyos = "framework",
}

local ok, f = pcall(io.open, "/etc/hostname")
local hostname = ""
if ok and f then
	hostname = (f:read("*l") or ""):gsub("%s+", "")
	f:close()
end

-- Host file first: it defines monitors, workspace rules and hypridle_conf
require("configs/hosts/" .. (hosts[hostname] or "desktop"))

-- Shared config
require("configs/key-bindings")
require("configs/autostart")
require("configs/windows-rules")
require("configs/heart")
require("configs/environment")
