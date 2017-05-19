///Movement & collisions

///Check if parent still exists
if (parent != noone)
if (!instance_exists(parent))
{
    parent = noone;
}

///Gravity
if (grav != 0)
{
    hsp += lengthdir_x(grav, grav_dir);
    vsp += lengthdir_y(grav, grav_dir);
}

///Increase gravity over time, up until a maximum amount
grav = min(grav+grav_add, grav_max);

///Limit speed
hsp = clamp(hsp, -hsp_max, hsp_max);
vsp = clamp(vsp, -vsp_max, vsp_max);

///Calculate directional speed
var sp = point_distance(0, 0, hsp, vsp);
direction = point_direction(0, 0, hsp, vsp);

///This is for inter-pixel movement
var isp = sp;

///Movement
while(isp > 0)
{
    //Move in direction of travel
    var i = min(1, isp);
    var x_add = lengthdir_x(i, direction);
    var y_add = lengthdir_y(i, direction);
    isp -= i;
    
    //Check for blocks at new position
    var block = instance_place(x+x_add, y+y_add, objSolid);
    if (block != noone)
    {
        if (bounce > 0)
        {
            bounce--;
            hsp *= -bounce_x;
            vsp *= -bounce_y;
            break;
        }
        else
        {
            hit = block;
            x += x_add; y += y_add;
            instance_destroy();
            break;
        }
    }
    else
    {
        //Check for semi-solid blocks at new position
        if (!fallthrough)
        {
            var platform = instance_place(x+x_add, y+y_add, objSemiSolid);
            if (platform != noone)
            {
                if (bounce > 0)
                {
                    bounce--;
                    hsp *= -bounce_x;
                    vsp *= -bounce_y;
                    break;
                }
                else
                {
                    hit = platform;
                    x += x_add; y += y_add;
                    instance_destroy();
                    break;
                }
            }
        }
        var inst = instance_place(x+x_add, y+y_add, target);
        if (inst != noone &&
            inst != parent &&
            ds_list_find_index(collided, inst) == -1)
        {
            if (inst.can_damage)
            {
                //Damage!
                inst.take_damage += damage;
                inst.damager = parent;
                //Knockback!
                var dir = point_direction(xprevious, yprevious, mid_x(inst), mid_y(inst));
                with (inst)
                {
                    add_speed(other.knockback, dir);
                    vsp -= min(1, other.knockback);
                }
                //Reduce pierce by 1
                pierce--;
                if (pierce < 0)
                {
                    hit = inst;
                    instance_destroy();
                    break;
                }
            }
            //Add to list so that we don't collide with it again
            ds_list_add(collided, inst);
        }
        else
        {
            x += x_add;
            y += y_add;
        }
    }
}

///Wrap around screen
wrapped = wrap(8);

///Friction
if (frict != 0)
{
    hsp = approach(hsp, 0, frict);
    vsp = approach(vsp, 0, frict);
}




