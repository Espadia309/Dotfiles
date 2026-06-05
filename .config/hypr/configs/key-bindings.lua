require("configs/variables")

-- apps
hl.bind(MainMod.."+ RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(MainMod.."+ E", hl.dsp.exec_cmd(fileManager))
hl.bind(MainMod.."+ SPACE", hl.dsp.exec_cmd(menu))
hl.bind(MainMod.."+ D", hl.dsp.exec_cmd("vesktop"))
hl.bind(MainMod.."+ O", hl.dsp.exec_cmd(notes))
hl.bind(MainMod.."+ T", hl.dsp.exec_cmd(textedit))
hl.bind(MainMod.."+ B", hl.dsp.exec_cmd(browser))
hl.bind(MainMod.."+ L", hl.dsp.exec_cmd("hyprlock"))

-- change wallpaper using rofi script :
hl.bind(MainMod.."+ W", hl.dsp.exec_cmd("bash "..scripts.."/menu-rofi.sh"))

-- basic functions
hl.bind(MainMod.."+ SHIFT + Q", hl.dsp.window.close(activewindow))
hl.bind(MainMod.."+ F", hl.dsp.window.fullscreen(toggle, activewindow))
hl.bind(MainMod.."+ SHIFT + SPACE", hl.dsp.window.float(toggle, activewindow))

-- screenshots functions
hl.bind(MainMod.."+ PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(MainMod.."+ SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- window focus
hl.bind(MainMod.."+ H", hl.dsp.focus({direction = "left"}))
hl.bind(MainMod.."+ J", hl.dsp.focus({direction = "down"}))
hl.bind(MainMod.."+ K", hl.dsp.focus({direction = "up"}))
hl.bind(MainMod.."+ L", hl.dsp.focus({direction = "right"}))

-- windows move 
hl.bind(MainMod.."+ SHIFT + H", hl.dsp.window.move({direction = "left"}))
hl.bind(MainMod.."+ SHIFT + J", hl.dsp.window.move({direction = "up"}))
hl.bind(MainMod.."+ SHIFT + K", hl.dsp.window.move({direction = "down"}))
hl.bind(MainMod.."+ SHIFT + L",hl.dsp.window.move({direction = "right"}))

-- workspace switch
hl.bind(MainMod.."+ ampersand", hl.dsp.focus({workspace = 1}))
hl.bind(MainMod.."+ eacute", hl.dsp.focus({workspace = 2}))
hl.bind(MainMod.."+ quotedbl", hl.dsp.focus({workspace = 3}))
hl.bind(MainMod.."+ apostrophe", hl.dsp.focus({workspace = 4}))
hl.bind(MainMod.."+ parenleft", hl.dsp.focus({workspace = 5}))
hl.bind(MainMod.."+ minus", hl.dsp.focus({workspace = 6}))
hl.bind(MainMod.."+ egrave", hl.dsp.focus({workspace = 7}))
hl.bind(MainMod.."+ underscore", hl.dsp.focus({workspace = 8}))
hl.bind(MainMod.."+ ccedilla", hl.dsp.focus({workspace = 9}))
hl.bind(MainMod.."+ R", hl.dsp.focus({workspace = 10}))

-- move focused window in workspace
hl.bind(MainMod.."+ SHIFT + ampersand", hl.dsp.window.move({workspace = 1}))
hl.bind(MainMod.."+ SHIFT + eacute", hl.dsp.window.move({workspace = 2}))
hl.bind(MainMod.."+ SHIFT + quotedbl", hl.dsp.window.move({workspace = 3}))
hl.bind(MainMod.."+ SHIFT + apostrophe", hl.dsp.window.move({workspace = 4}))
hl.bind(MainMod.."+ SHIFT + parenleft", hl.dsp.window.move({workspace = 5}))
hl.bind(MainMod.."+ SHIFT + minus", hl.dsp.window.move({workspace = 6}))
hl.bind(MainMod.."+ SHIFT + egrave", hl.dsp.window.move({workspace = 7}))
hl.bind(MainMod.."+ SHIFT + underscore", hl.dsp.window.move({workspace = 8}))
hl.bind(MainMod.."+ SHIFT + ccedilla", hl.dsp.window.move({workspace = 9}))
hl.bind(MainMod.."+ SHIFT + R", hl.dsp.window.move({workspace = 10}))

-- move and resize floating
hl.bind(MainMod.."+ mouse:272", hl.dsp.window.drag())
hl.bind(MainMod.."+ mouse:273", hl.dsp.window.resize())