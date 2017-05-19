action_inherited();
///Smash the box!
repeat(8)
{
    var a = instance_create(x, y, objPiece);
    a.sprite_index = sprBoxPiece;
    var f = 0.8;
    a.hsp += hsp*f;
    a.vsp += vsp*f;
}
repeat(irandom_range(3, 5))
{
    var xx = x+random_range(-8, 8);
    var yy = y+random_range(-8, 8);
    create_effect(xx, yy, sprDust, random_range(0.2, 0.4));
}


