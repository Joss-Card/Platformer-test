///Affect objects in the water
ds_list_destroy(entity_list);
entity_list = collision_multiple(x, y, objObject);
var size = ds_list_size(entity_list);
for (var i = 0; i < size; i++)
{
    with (entity_list[|i])
    {
        //Apply factors
        move_factor = other.move_factor;
        acc_factor = other.acc_factor;
        frict_factor = other.frict_factor;
        jump_factor = other.jump_factor;
        grav_factor = other.grav_factor;
        //Limit speed
        hsp = clamp(hsp, -other.hsp_max, other.hsp_max);
        vsp = clamp(vsp, other.vsp_up, other.vsp_down);
    }
}



///Springy code: pull each point toward its neighbours
for (i = 0; i <= points; i++)
{
    if (i > 0)
    {
        var l = pointList[i-1];
        var left = spread*(pointList[i].y-l.y);
        l.vspeed += left;
        l.y += left;
    }
    if (i < points-1)
    {
        var r = pointList[i+1];
        var right = spread*(pointList[i].y-r.y);
        r.vspeed += right;
        r.y += right;
    }
}




