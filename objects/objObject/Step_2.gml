///Movement

///Collide with water
var previous_in_water = in_water;
in_water = place_meeting(x, y, objLiquid);
if (previous_in_water != in_water)
{
    collide_water(weight);
}

///Limit speed
vsp = clamp(vsp, -vsp_max, vsp_max);
hsp = clamp(hsp, -hsp_max, hsp_max);

///Store previous velocity variables
previous_hsp = hsp;
previous_vsp = vsp;

///Check if this object can collide
if (collide)
{
    //Reset last colliding variables
    collide_y = false;
    collide_x = false;
    
    //This is for inter-pixel movement!
    cx += hsp;
    cy += vsp;
    var hspNew = floor(cx);
    var vspNew = floor(cy);
    cx -= hspNew;
    cy -= vspNew;
    
    //Vertical
    repeat(abs(vspNew))
    {
        var svsp = sign(vspNew);
        if (check_collision(0, svsp))
        {
            //Get the block collided with, and prompt
            //the block's "collide with entity" event
            with (instance_place(x, y+svsp, objBlock))
            {
                entity = other.id;
                event_user(0);
            }
            //Bounce vsp back, or if bounce is 0 then
            //set vsp to 0
            vsp *= -y_bounce;
            if (abs(vsp) < 0.2)
            {
                vsp = 0;
            }
            //Set collide_y to true for this step
            collide_y = true;
            break;
        }
        else
        {
            y += svsp;
        }
    }
    
    //Horizontal
    repeat(abs(hspNew))
    {
        var shsp = sign(hspNew);
        if (slopes)
        {
            //Move up slope
            if (check_collision(shsp, 0) && !check_collision(shsp, -1))
            {
                --y;
                hsp *= 0.86; //reduce horizontal speed when going up a slope
            }
            //Move down slope
            if (!check_collision(shsp, 0) && !check_collision(shsp, 1) && check_collision(shsp, 2))
            {
                ++y;
            }
        }
        //Collide with walls
        if (check_collision(shsp, 0))
        {
            //Get the block collided with, and prompt
            //the block's "collide with entity" event
            with (instance_place(x+shsp, y, objBlock))
            {
                entity = other.id;
                event_user(0);
            }
            //Bounce hsp back, or if bounce is 0 then
            //set hsp to 0
            hsp *= -x_bounce;
            if (abs(hsp) < 0.2)
            {
                hsp = 0;
            }
            //Set collide_x to true for this step
            collide_x = true;
            break;
        }
        else
        {
            x += shsp;
        }
    }
}
else
///If this object doesn't collide, then just move
{
    x += hsp;
    y += vsp;
}

///Reset moving platform variable
moving_platforms = false;


