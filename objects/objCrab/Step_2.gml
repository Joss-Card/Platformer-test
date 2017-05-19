action_inherited();
///Movement
if (ground)
{
    var xx = 0;
    var ahsp = abs(hsp);
    var turn = false;
    ///Turn around at ledges
    if (ahsp > 0)
    {
        xx = (ahsp/hsp)*10;
    }
    if (!check_collision(xx, 1))
    {
        turn = true;
    }
    if (collide_x)
    {
        turn = true;
    }
    ///Turn
    if (turn)
    {
        facing *= -1;
        hsp = 0;
    }
    ///Movement depending on direction
    move_x = facing;
}


