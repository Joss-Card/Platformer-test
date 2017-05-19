///Release Event
if (!firing)
{
    if (drawback >= drawback_max)
    {
        ///The bow's been drawn enough, so fire an arrow! 
        fire = 0; //reset fire timer
        firing = true;
        facing = parent.facing;
        ///Create the arrow and set all its variables
        with (instance_create(mid_x(parent), mid_y(parent), objArrow))
        {
            image_angle = other.aim_direction;
            //a.image_xscale = parent.facing;
            parent = other.parent;
            target = objEntity;
            damage = other.damage;
            knockback = other.knockback;
            pierce = other.pierce;
            set_speed(35, image_angle);
            hsp += random_range(-1, 1);
        }
    }
    else
    {
        ///Let go of the weapon without drawing back enough
        ///Enable the user to move again, and deactivate
        ///the weapon so that other weapons can be used.
        parent.can_move = true;
        active = false;
    }
    drawback = 0;
}


