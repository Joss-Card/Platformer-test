///Wake up when taking damage - this must be before the inherited code
///because take_damage will always be 0 after the inherited code
if (take_damage > 0)
{
    if (damager != noone)
    {
        sleeping = false;
        target = damager;
        event_user(0); //remove from block's stuck list
    }
}



action_inherited();
///Movement & sprite setting
if (sleeping)
{
    ///Set sprite & animation speed for sleeping bat
    sprite_index = sprBatSleep;
    image_speed = 0;
    ///Keep speed at 0
    hsp = 0;
    vsp = 0;
}
else
{
    ///Set sprite & animation speed for flying bat
    sprite_index = sprBat;
    image_speed = 0.6;
    ///If our target still exists, move towards it
    ///and face towards it.
    if (target != noone)
    {
        if (instance_exists(target))
        {
            ///Move towards target
            var dir = point_direction(x, y, mid_x(target), mid_y(target));
            move_x = lengthdir_x(1, dir);
            move_y = lengthdir_y(1, dir);
            ///Set facing direction
            ///depending on whether the target is left/right of us
            facing = ((target.x > x)*2)-1;
        }
        else
        {
            target = noone;
        }
    }
}


///Wake up when player nearby!
if (sleeping)
{
    if (instance_exists(objPlayer))
    {
        var obj = instance_nearest(x, y, objPlayer);
        var mx = mid_x(obj);
        var my = mid_y(obj);
        ///Check if the target is close enough
        if (point_distance(x, y, mx, my) < sight_distance)
        {
            ///Check if we have line of sight on the target.
            ///If we do... attack!
            if (line_of_sight(x, y, mx, my, 4))
            {
                sleeping = false;
                target = obj;
                event_user(0); //remove from block's stuck list
            }
        }
    }
}



