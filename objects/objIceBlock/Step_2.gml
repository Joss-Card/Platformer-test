action_inherited();
///Reduce friction of entities above the block
ds_list_destroy(on_top);
on_top = collision_multiple(x, y-1, objEntity); //get list of entities above block
var size = ds_list_size(on_top);
for (var i = 0; i < size; i++)
{
    with (on_top[|i])
    {
        frict_factor = other.frict_factor;
        acc_factor = other.acc_factor;
    }
}




