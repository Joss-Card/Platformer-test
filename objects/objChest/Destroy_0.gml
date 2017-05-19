action_inherited();
///Smash!!
var f = 0.8;
if (percent_chance(2))
{
    ///Create a bomb
    var a = instance_create(x, y, objBomb);
    a.timer /= 2;
    a.proc /= 2;
    a.proc_timer /= 2;
    a.hsp += hsp*f;
    a.vsp += vsp*f;
}
else
{
    ///Create gold
    repeat(irandom_range(4, 8))
    {
        var obj = choose(objGoldSmall, objGoldLarge, objGem, objGemSmall);
        var a = instance_create(x, y, obj);
        with (a)
        {
            set_speed(random_range(1, 3), random(360));
        }
        a.hsp += hsp*f;
        a.vsp += vsp*f;
    }
}
///Create particles
repeat(8)
{
    var xx = x+random_range(-12, 12);
    var yy = y+random_range(-12, 12);
    if (percent_chance(50))
    {
        var a = create_effect(xx, yy, sprSparkle, random_range(0.1, 0.2));
    }
    else
    {
        var a = create_effect(xx, yy, sprDust, random_range(0.2, 0.4));
    }
    a.depth = -10;
}


