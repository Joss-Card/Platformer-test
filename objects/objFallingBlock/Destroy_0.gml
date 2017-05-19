action_inherited();
///Create particle pieces
repeat(4)
{
    ///get a random x & y position within the block
    var px = irandom_range(bbox_left, bbox_right);
    var py = irandom_range(bbox_top, bbox_bottom);
    ///create the piece
    var a = instance_create(px, py, objPieceTrail);
    a.image_alpha = random_range(1.5, 4);
    a.sprite_index = sprGreyPiece;
}


