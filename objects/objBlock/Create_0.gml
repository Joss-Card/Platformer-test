with (other) {
///Setup
breakable = true;
stuck = ds_list_create();
on_top = ds_list_create();
image_speed = 0;
alarm[0] = 1;
piece_sprite = noone; //the sprite of the particle created
                     //when the block is destroyed
///Movement
vsp = 0;
vsp_max = 5;
hsp = 0;
hsp_max = 5;
cx = 0;
cy = 0;
fallthrough = false;
semi_solid = false;
collide_x = false;
collide_y = false;
entity = noone; //the id of the colliding entity
can_crush = false; //can we crush entities?



}
