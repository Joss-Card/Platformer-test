///Stick to parent object
with (stick_to)
{
    other.x = x+(other.x_offset*facing);
    other.y = y+other.y_offset;
}



///Hit entities
///Get a list of entities in collision with the hitbox
x1 = x-width;
y1 = y-height;
x2 = x+width;
y2 = y+height;
var list = collision_rectangle_multiple(x1, y1, x2, y2, objEntity, false, true);
var size = ds_list_size(list);
///Loop through all the collided entities
for (var i = 0; i < size; i++)
{
    var obj = list[|i];
    ///Check if the object is not our parent
    ///and if we haven't already collided with it (in our collided list)
    if (obj != parent)
    if (ds_list_find_index(collided, obj) == -1)
    {
        if (obj.can_damage)
        {
            ///Do damage!
            obj.take_damage += damage;
            obj.damager = parent;
            ///Do knockback!
            var my_x = x-(x_offset*stick_to.facing);
            var my_y = y-y_offset;
            var dir = point_direction(my_x, my_y, mid_x(obj), mid_y(obj));
            with (obj)
            {
                add_speed(other.knockback, dir);
                vsp -= min(1, other.knockback);
            }
        }
        ///Add to list so that we don't collide with it again
        ds_list_add(collided, obj);
    }
}
ds_list_destroy(list);






///Destroy over time
life--;
if (life <= 0)
{
    instance_destroy();
}


