///Create block particles
if (piece_sprite != noone)
repeat(4)
{
    //get a random x & y position within the block
    var px = irandom_range(bbox_left, bbox_right);
    var py = irandom_range(bbox_top, bbox_bottom);
    //create the piece
    var a = instance_create(px, py, objPieceTrail);
    a.image_alpha = random_range(1.5, 4);
    a.sprite_index = piece_sprite;
}


///Destroy any objects which are "stuck in" this block
var size = ds_list_size(stuck);
for (var i = 0; i < size; i++)
{
    with (stuck[|i])
    {
        instance_destroy();
    }
}




///Free list memory
if (ds_exists(stuck, ds_type_list))
{
    ds_list_destroy(stuck);
}
if (ds_exists(on_top, ds_type_list))
{
    ds_list_destroy(on_top);
}



