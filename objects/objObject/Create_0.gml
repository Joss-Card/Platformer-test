///Set variables
///This code sets GM's built in variables to 0
///becase we'll be using hsp, vsp, grav instead
image_speed = 0;
hspeed = 0;
vspeed = 0;
gravity = 0;
friction = 0;
image_xscale = 1;
image_yscale = 1;
///position/movement variables
previous_hsp = 0;
previous_vsp = 0;
hsp = 0;
vsp = 0;
hsp_max = 10;
vsp_max = 10;
weight = 1; //< weight used to determine liquid & bouncy platform impact
///cx and cy are used for non-full pixel movement
cx = 0;
cy = 0;
xscale = 1;
yscale = 1;
///In water?
in_water = false;
///Use slopes? Turn off too boost performance (or delete the slope code in End Step)
slopes = true;
///Fall through semi-solid platforms?
fallthrough = false;
///Can the object collide with blocks?
collide = true;
///Did the object collide in the last frame?
collide_x = false;
collide_y = false;
///How much should the object bounce when colliding? 0 = no bounce, 1 = full bounce
x_bounce = 0;
y_bounce = 0;


