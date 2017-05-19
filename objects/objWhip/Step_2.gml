action_inherited();
///Hit animation
if (attacking)
{
    ///Lock parent facing direction
    parent.facing = facing;
    ///Increase timer
    attack++;
    if (attack == 12)
    {
        var xo = 16;
        var yo = -7;
        var a = instance_create(parent.x+xo*parent.facing, parent.y+yo, objHitBox);
        a.width = 6;
        a.height = 3;
        a.x_offset = xo;
        a.y_offset = yo;
        a.life = 4;
        a.parent = parent;
        a.stick_to = parent;
        a.damage = damage;
        a.knockback = knockback;
    }
    ///Until it reaches the maximum time
    if (attack >= attack_time)
    {
        ///At the end of the timer, stop attacking and
        ///deactivate the weapon so that other weapons can be
        ///be used again.
        attacking = false;
        attack = 0;
        active = false;
    }
    else
    {
        ///Set the sprite of the parent
        var spr = parent.sprWhip;
        parent.sprite_index = spr;
        parent.image_spd = 0;
        parent.image_index = (attack/attack_time)*(sprite_get_number(spr)-1);
    }
}



