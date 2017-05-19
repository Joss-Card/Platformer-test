///Movement
collide_x = false; //reset collide x & y even when not moving
collide_y = false;

///Movement & moving entities on top or stuck in the block
if (hsp != 0 || vsp != 0)
{
    ///Limit speed
    hsp = clamp(hsp, -hsp_max, hsp_max);
    vsp = clamp(vsp, -vsp_max, vsp_max);
    
    ///Set current position as previous position
    xprevious = x;
    yprevious = y;
    
    ///This is for inter-pixel movement!
    cx += hsp;
    cy += vsp;
    var hspNew = floor(cx);
    var vspNew = floor(cy);
    cx -= hspNew;
    cy -= vspNew;
    
    ///Get a list of all entities on top of this block
    ds_list_destroy(on_top);
    on_top = block_get_entities(hspNew, vspNew, hspNew, vspNew);
    
    ///Horizontal movement
    if (hspNew != 0)
    {
        var ahsp = abs(hspNew);
        var shsp = ahsp/hspNew;
        for (var i = 0; i < ahsp; i++)
        {
            if (!check_collision(shsp, 0) &&
                !place_meeting(x+shsp, y, objPlatformReverse))
            {
                x += shsp;
            }
            else
            {
                hsp *= -1;
                collide_x = true;
                break;
            }
        }
    }
    
    ///Vertical movement
    if (vspNew != 0)
    {
        var avsp = abs(vspNew);
        var svsp = avsp/vspNew;
        for (var i = 0; i < avsp; i++)
        {
            if (!check_collision(0, svsp) &&
                !place_meeting(x, y+svsp, objPlatformReverse))
            {
                y += svsp;
            }
            else
            {
                vsp *= -1;
                collide_y = true;
                break;
            }
        }
    }
    
    ///Move all of the entities on top of this block
    block_move_entities();
}


