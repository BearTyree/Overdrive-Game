window_set_size(1200,720)
xsp=0
ysp=0
grav=1
gravchanged=0
	show_debug_message("grav:" + string(grav))
	show_debug_message("x:" + string((grav + 1) % 2))
	show_debug_message("y:" + string(grav % 2))