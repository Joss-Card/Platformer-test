action_inherited();
///Hit animation
if (attacking)
{
    //Lock parent facing direction
    parent.facing = facing;
    //Create a hitbox at the correct time in the animation
    if (++attack == attack_time*0.5)
    {
        var xo = 10;
        var yo = -7;
        var a = instance_create(parent.x+xo*parent.facing, parent.y+yo, objHitBox);
        a.width = 8;
        a.height = 8;
        a.x_offset = xo;
        a.y_offset = yo;
        a.life = 8;
        a.parent = parent;
        a.stick_to = parent;
        a.damage = damage;
        a.knockback = knockback;
    }
    //Until it reaches the maximum time
    if (attack >= attack_time)
    {
        //At the end of the timer, stop attacking and
        //deactivate the weapon so that other weapons can be
        //be used again.
        attacking = false;
        attack = 0;
        active = false;
        parent.can_move = true;
    }
    else
    {
        //Set the sprite of the parent
        var spr = parent.sprAxe;
        parent.sprite_index = spr;
        parent.image_spd = 0;
        parent.image_index = (attack/attack_time)*(sprite_get_number(spr)-1);
    }
}



