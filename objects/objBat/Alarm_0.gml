///Get block above
///This is so that the bat dies if the block it's attached to is destroyed
block = instance_place(x, y-1, objSolid);
if (block == noone)
{
    instance_destroy();
}
else
{
    with (block)
    {
        ds_list_add(stuck, other.id);
    }
}
//This is done in alarm 0 to ensure that all of the blocks
//have initialised their stuck lists.



