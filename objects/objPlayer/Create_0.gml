action_inherited();
///Explanation of object!

/*
    This should be the parent object for all players
    There's currently only one player object, but if
    you want multiple characters to choose from, they
    should all be children of this object.
    
    All COMMON player functions should be put in this
    object. For example, all players should be able to
    enter doors, that's why that code is in this object.
*/


/* */
///Set variables
fall_damage = 0;
gold = 0;
invincible_when_hit = true;
bounce = 0.5;
melee_weapon = noone;
ranged_weapon = noone;
aim_direction = 0;
player_number = 0;


/* */
///Set controls

//Keyboard
key_left = ord("A");
key_right = ord("D");
key_up = ord("W");
key_down = ord("S");
key_jump = vk_space;
key_aim_left = vk_left;
key_aim_right = vk_right;
key_aim_up = vk_up;
key_aim_down = vk_down;
key_attack = vk_control;

//Gamepad
pad_left = gp_padl;
pad_right = gp_padr;
pad_up = gp_padu;
pad_down = gp_padd;
pad_move_axish = gp_axislh;
pad_move_axisv = gp_axislv;
pad_jump = gp_face1;
pad_aim_axish = gp_axislh;
pad_aim_axisv = gp_axislv;
pad_shoot = gp_face2;
pad_attack = gp_face3;



/* */
/*  */
