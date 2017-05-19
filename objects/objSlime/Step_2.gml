action_inherited();
///Jump around!
jump_timer--;
///If the timer is nearly up... increase animation speed
///So that it looks like the slime is getting ready to jump!
if (jump_timer < room_speed*.6)
{
    image_speed = 0.6;
}
///If the timer is up... jump!
if (jump_timer < 0)
{
    //Reset the jump timer & image speed
    jump_timer = random_range(120, 180);
    image_speed = 0.3;
    ///Check if we're on the ground... can't jump otherwise!
    if (ground || in_water)
    {
        ///Find the closest target
        target = instance_nearest(x, y, objPlayer);
        var dir = choose(1, -1); //default direction is either left or right
        if (target != noone) //if we found a target...
        {
            ///Set jump direction in the direction of the target
            dir = ((target.x > x)*2)-1;
        }
        ///Jump in the given direction!
        hsp += random_range(2, 3)*dir;
        vsp -= random_range(3, 4);
    }
}



