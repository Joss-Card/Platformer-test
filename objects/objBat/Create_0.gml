action_inherited();
///Set variables
facing = choose(1, -1);
hp = 1;
///Animation speed
image_speed = 0.1;
sprite_index = sprBatSleep;
///Velocity & limits
move_speed = 1;
///Gravity
grav = 0;
///Friction
air_frict = 0.08;
ground_frict = 0.08;
///Acceleration
air_acc = 0.05;
ground_acc = 0.05;
///Misc
x_bounce = 0.6;
y_bounce = 0.6;
damage = 1;
knockback = 3;
sleeping = true;
target = noone; //who is the bat chasing?
sight_distance = 100; //how far can the bat see?
block = noone;
alarm[0] = 1;



