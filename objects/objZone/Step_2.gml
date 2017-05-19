///Affect entities within the zone
ds_list_destroy(entity_list);
entity_list = collision_multiple(x, y, objEntity);
var size = ds_list_size(entity_list);
for (var i = 0; i < size; i++)
{
    with (entity_list[|i])
    {
        move_factor = other.move_factor;
        acc_factor = other.acc_factor;
        frict_factor = other.frict_factor;
        jump_factor = other.jump_factor;
        grav_factor = other.grav_factor;
    }
}



