action_inherited();
///Smash the pot!
///Create some pot pieces
repeat(5)
{
    var a = instance_create(x, y, objPiece);
    a.sprite_index = sprPotPiece;
    var f = 0.8;
    a.hsp += hsp*f;
    a.vsp += vsp*f;
}
///Create some dust particles
repeat(irandom_range(3, 5))
{
    var xx = x+random_range(-4, 4);
    var yy = y+random_range(-4, 4);
    create_effect(xx, yy, sprDust, random_range(0.2, 0.4));
}
///Chance to create some gold
if (percent_chance(50))
{
    var obj = choose(objGoldSmall, objGoldLarge, objGem, objGemSmall);
    var a = instance_create(x, y, obj);
    ///Set velocity to this velocity
    a.hsp = hsp;
    a.vsp = vsp;
}


