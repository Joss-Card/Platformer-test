action_inherited();
///Fall
if (falling)
{
    vsp += grav;
    if (collide_y)
    {
        instance_destroy();
    }
}
else
{
    if (place_meeting(x, y-1, objEntity))
    {
        hp--;
        var a = 0.5;
        xx = irandom_range(a, -a);
        yy = irandom_range(a, -a);
        if (hp <= 0)
        {
            falling = true;
            xx = 0;
            yy = 0;
        }
    }
    else
    {
        xx = 0;
        yy = 0;
        hp = max_hp;
    }
}



