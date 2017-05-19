///Remove from block's stuck list
with (block)
{
    var i = ds_list_find_index(stuck, other.id);
    if (i != -1)
    {
        ds_list_delete(stuck, i);
    }
}
block = noone;




