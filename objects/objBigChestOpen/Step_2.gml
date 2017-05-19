action_inherited();
///Timers
var a, xx, yy;
death_timer--;
if (death_timer <= 0)
{
    instance_destroy();
}
proc_timer--;
if (proc_timer <= 0)
{
    proc_timer = proc;
    var obj = set_chance(75, objGoldSmall, objGemSmall);
    xx = x+random_range(-5, 5);
    yy = y;
    a = instance_create(xx, yy, obj);
    a.depth = depth+choose(1, -1);
    with (a)
    {
        var s = set_chance(90, random_range(1.5, 5), random_range(6, 8));
        set_speed(s, random_range(80, 100));
    }
}
if (percent_chance(35))
{
    xx = x+random_range(-6, 6);
    yy = y+random_range(-3, 3);
    var a = create_effect(xx, yy, sprSparkle, random_range(0.15, 0.25));
    a.direction = random_range(75, 105);
    a.speed = set_chance(70, random(2), random(4));
}


