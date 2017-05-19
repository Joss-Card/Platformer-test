///Death effect
var e = create_effect(x, y, sprSlimeDead, 0.5);
var f = 0.25;
e.hspeed = hsp*f;
e.vspeed = vsp*f;
repeat(irandom_range(6, 8))
{
    var a = instance_create(x, y, objSlimePiece);
    var f = 0.8;
    a.hsp += hsp*f;
    a.vsp += vsp*f;
}



