action_inherited();
///Set variables
///Velocity & limits
hsp = 0;
hsp_max = 10;
vsp = 0;
vsp_max = 10;
move_speed = 3;
move_factor = 1;
///Gravity
grav = 0.25;
grav_slide = 0.12;
grav_factor = 1;
///Friction
air_frict = 0.04;
ground_frict = 0.4;
frict_factor = 1;
///Acceleration
air_acc = 0.2;
ground_acc = 0.4;
acc_factor = 1;
///Jumping!
jump_height = 5;
djump_height = 3;
jump_factor = 1;
jumps_max = 1;
jumps = 0;

///Movement
move_x = 0;
move_y = 0;
move_jump = false;
can_move = true;

///Clinging
wall_jump = false; //can the entity wall-jump?
cling_left = false;
cling_right = false;
stick_time = 12; //number of steps needed to hold the left/right key before unsticking from the wall
stuck_time = 0;
slide_speed = 2;

///Climbing
climb_up = false;
climb_down = false;
climb_up_speed = 1;
climb_down_speed = 1;
ladder_stick = 10; //number of steps needed to hold the left/right key before unsticking from the ladder
ladder_stuck = 0;

///Ledge grab
can_grab = false; //can the entity grab ledges?
ledge_grab_block = noone; //the block which we're grabbed on to
ledge_grab_x = 0; //the x & y position relative to the grabbed block
ledge_grab_y = 0;
ledge_stick = 10; //number of steps needed to hold the left/right key before unsticking from the ledge
ledge_stuck = 0;

///Damage stuff
hp = 1;
can_damage = true;
take_damage = 0; //Damage which will be taken next step
damager = noone; //The instance which last damaged this entity
fall_damage = 5; //Maximum fall damage
fall_damage_min_speed = 5;
fall_damage_max_speed = 10;
invincible = 0;
invincible_when_hit = false;

///Misc
ground = on_ground();
facing = 1;
white = 0; // < flash white when damaged timer
state = state.normal;


                   



