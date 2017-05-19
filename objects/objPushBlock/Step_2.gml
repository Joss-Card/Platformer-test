action_inherited();
///Movement
if (x != xstart || y != ystart)
{
    ///Friction
    hsp = approach(hsp, 0, frict);
    vsp = approach(vsp, 0, frict);
    
    //Move back in to position
    var dir = point_direction(x, y, xstart, ystart);
    var dis = point_distance(x, y, xstart, ystart);
    if (dis > 1)
    {
        add_speed(dis/pow, dir);
    }
}




