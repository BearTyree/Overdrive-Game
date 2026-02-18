ysp+=0.1

if keyboard_check(vk_left)
{
	if sign(xsp) == -1
	{
		xsp+=-0.1/(abs(xsp) + 1)
	}
	if sign(xsp) == 1
	{
		xsp=-0.1
	}
	if sign(xsp) == 0
	{
		xsp+=-0.1/(abs(xsp) + 1)
	}
}


if keyboard_check(vk_right)
{
	if sign(xsp) == 1
	{
		xsp+=0.1/(abs(xsp) + 1)
	}
	if sign(xsp) == -1
	{
		xsp=0.1
	}
	if sign(xsp) == 0
	{
		xsp+=0.1/(abs(xsp) + 1)
	}
}

if !keyboard_check(vk_right) && !keyboard_check(vk_left)
{
	xsp-=xsp/20
}


if place_meeting(x+((grav + 1) % 2)* sign(2 - 1.1*(grav - 1 % 4)),y+((grav) % 2)* sign(2 - 1.1*(grav - 1 % 4)),oGround)
{
	ysp=0
	if keyboard_check(vk_up)
	{
		ysp=-4
	}
}

switch grav % 4
{
	case 1:
		move_and_collide(xsp,ysp,oGround)
	break;
	case 2:
		move_and_collide(ysp,xsp,oGround)
	break;
	case 3:
		move_and_collide(-xsp,-ysp,oGround)
	break;
	case 0:
		move_and_collide(-ysp,-xsp,oGround)
	break;
}

if place_meeting(x,y,oSpike)
{
	room_restart()
}


if place_meeting(x,y,oObjective) && gravchanged == 0
{
	grav+=1
	gravchanged=1
	show_debug_message("grav:" + string(grav))
	show_debug_message("x:" + string(((grav + 1) % 2)* sign(2 - 1.1*(grav - 1 % 4))))
	show_debug_message("y:" + string(((grav) % 2)* sign(2 - 1.1*(grav - 1 % 4))))
}

if !place_meeting(x,y,oObjective)
{
	gravchanged=0
}