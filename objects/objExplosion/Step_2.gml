///Explode!
var xx, yy, dis, dir;
timer--;
if (timer < 0)
{
    ///Destroy blocks
    var blocks = collision_circle_multiple(x, y, radius, objBlock, false, true);
    var size = ds_list_size(blocks);
    for (var i = 0; i < size; i++)
    {
        var obj = blocks[|i]; //get the current block from the list
        destroy_block(obj); //destroy the block if it's destructable
    }
    ds_list_destroy(blocks);
    
    ///Hit entities
    var entities = collision_circle_multiple(x, y, radius, objEntity, false, true);
    var size = ds_list_size(entities);
    for (var i = 0; i < size; i++)
    {
        var obj = entities[|i]; //get the current entity from the list
        dis = point_distance(x, y, mid_x(obj), mid_y(obj));
        dir = point_direction(x, y, mid_x(obj), mid_y(obj));
        var factor = min(1, (radius/dis));
        ///Knockback
        var k = max(min_knockback, max_knockback*factor);
        with (obj)
        {
            add_speed(k, dir);
            vsp -= 1;
        }
        ///Damage
        if (obj.can_damage)
        {
            var d = max(min_damage, max_damage*factor);
            obj.take_damage += d;
        }
    }
    ds_list_destroy(entities);
    
    ///Create particles
    repeat(40)
    {
        dis = set_chance(70, irandom(radius), irandom(radius*1.5));
        dir = irandom(360);
        xx = x+lengthdir_x(dis, dir);
        yy = y+lengthdir_y(dis, dir);
        var spr = set_chance(80, sprDust, sprSparkle);
        var a = create_effect(xx, yy, spr, random_range(0.1, 0.4));
        a.depth = -220;
        a.image_alpha = random_range(0.5, 1);
    }
    
    ///Destroy the object
    instance_destroy();
}



