action_inherited();
///Fire animation
if (firing)
{
    ///Lock parent's facing direction
    parent.facing = facing;
    ///Increase firing timer
    fire++;
    ///Until it reaches the maximum time
    if (fire > fire_time/4)
    {
        ///Parent can move again now
        parent.can_move = true;
    }
    if (fire >= fire_time)
    {
        ///Stop firing animation & deactivate so that other
        ///weapons can be used again.
        firing = false;
        fire = 0;
        active = false;
    }
    else
    {
        ///Set the sprite of the parent
        var spr;
        switch (aim_direction)
        {
            default:
                spr = parent.sprFireRight;
                break;
            case 45:
            case 135:
                spr = parent.sprFireUpRight;
                break;
            case 225:
            case 315:
                spr = parent.sprFireDownRight;
                break;
            case 90:
                spr = parent.sprFireUp;
                break;
            case 270:
                spr = parent.sprFireDown;
                break;
        }
        parent.sprite_index = spr;
        //parent.image_spd = 0;
        parent.image_index = (fire/fire_time)*(sprite_get_number(spr)-1);
    }
}



