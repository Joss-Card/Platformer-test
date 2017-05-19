action_inherited();
///Set variables
move_speed = 4;
///Friction & gravity
air_frict = 0.16;
ground_frict = 0.5;
grav = 0.2;
grav_slide = 0.08;
slide_speed = 1;
///Acceleration
air_acc = 0.15;
ground_acc = 0.3;
///Jumping!
jump_height = 3.6;
djump_height = 3;
jumps_max = 2;
wall_jump = true;
can_grab = true;
///Weapons
melee_weapon = instance_create(0, 0, objAxe);
melee_weapon.parent = id;
ranged_weapon = instance_create(0, 0, objBow);
ranged_weapon.parent = id;
///Misc
max_hp = 6;
hp = max_hp;
gx = 0;
gy = 0;
target_gx = 0;
target_gy = 0;




///Set sprites
sprIdle = sprPlayerIdle;
sprRun = sprPlayerRun;
sprJump = sprPlayerJump;
sprSlide = sprPlayerSlide;
sprClimb = sprPlayerClimb;
sprGrab = sprPlayerLedgeGrab;

sprDrawUp = sprPlayerDrawUp;
sprDrawUpRight = sprPlayerDrawUpRight;
sprDrawRight = sprPlayerDrawRight;
sprDrawDownRight = sprPlayerDrawDownRight;
sprDrawDown = sprPlayerDrawDown;

sprFireUp = sprPlayerFireUp;
sprFireUpRight = sprPlayerFireUpRight;
sprFireRight = sprPlayerFireRight;
sprFireDownRight = sprPlayerFireDownRight;
sprFireDown = sprPlayerFireDown;

sprAxe = sprPlayerAxe;
sprWhip = sprPlayerWhip;


