///add_speed(speed, direction)
/*
 * works the same as GM's motion_add function
 * except we're using vx and vy instead of hspeed and vspeed
 */
speed = argument0;
direction = argument1;
hsp += hspeed;
vsp += vspeed;
hspeed = 0;
vspeed = 0;
hsp = max(-hsp_max, min(hsp_max, hsp));
vsp = max(-vsp_max, min(vsp_max, vsp));
