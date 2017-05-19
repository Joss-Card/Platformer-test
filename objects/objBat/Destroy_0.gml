///Create dead enemy
event_user(0); //remove from block's stuck list
var a = instance_create(x, y, objDead);
a.sprite_index = sprBatDead;
var f = 1;
a.hsp += hsp*f;
a.vsp += vsp*f;
a.facing = facing;


