///Hold Event
if (!firing)
{
    ///Increase drawback
    drawback = approach(drawback, drawback_max, 1);
    ///Set sprite
    var spr;
    switch (aim_direction)
    {
        default:
            spr = parent.sprDrawRight;
            break;
        case 45:
        case 135:
            spr = parent.sprDrawUpRight;
            break;
        case 225:
        case 315:
            spr = parent.sprDrawDownRight;
            break;
        case 90:
            spr = parent.sprDrawUp;
            break;
        case 270:
            spr = parent.sprDrawDown;
            break;
    }
    parent.sprite_index = spr;
    //parent.image_spd = 0;
    parent.image_index = (drawback/drawback_max)*(sprite_get_number(spr)-1);
    ///Stop parent (the object holding the weapon) from moving
    parent.can_move = false;
    active = true; //Set to active so that other weapons cannot be used
}



