action_inherited();
///Change dust particles to bubble particles
var list = collision_multiple(x, y, objEffect);
for (var i = 0; i < ds_list_size(list); i++)
{
    with (list[|i])
    {
        if (sprite_index == sprDust)
        {
            if (percent_chance(50))
            {
                instance_destroy();
            }
            else
            {
                sprite_index = sprBubble;
                image_speed /= 1.5;
                vspeed -= random(0.2);
                image_alpha /= 2;
            }
        }
    }
}
ds_list_destroy(list);




