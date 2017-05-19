action_inherited();
///Movement
if (collide_y)
{
    vsp = 0;
    acc = 0;
}

if (vsp == 0)
{
    var list = collision_multiple(x, y-1, objPlayer);
    var size = ds_list_size(list);
    for (var i = 0; i < size; i++)
    {
        with (list[|i])
        {
            if (keyboard_check_pressed(key_up))
            {
                other.acc = -other.a;
            }
            else
            if (keyboard_check_pressed(key_down))
            {
                other.acc = other.a;
            }
        }
    }
    ds_list_destroy(list);
}

///Accelerate
vsp = clamp(vsp+acc, -spd, spd);






