///collide_water(force)
//if (abs(vsp) >= 1)
with (objLiquidPoint)
{
    var dis = abs(x-other.x);
    if (dis < 16)
    {
        vspeed = other.vsp*((96-dis)/48)*(argument0/2);
        var spd = point_distance(other.x, other.y, other.x+other.hsp, other.y+other.vsp);
        var dir = point_direction(other.x, other.y, other.x+other.hsp, other.y+other.vsp);
        repeat (abs(other.vsp)*0.75)
        {
            var d = instance_create(x, y/*-(other.vsp)-random(other.vsp*2)*/, objLiquidDrop);
            d.image_blend = parent.image_blend;
            d.speed = max(0, random(spd));
            d.direction = choose(irandom(360), dir-15+random(30));
            d.vspeed = -abs(d.vspeed);
        }
    }
}

