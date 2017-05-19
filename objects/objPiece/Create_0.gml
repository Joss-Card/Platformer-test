action_inherited();
///Set variables
set_speed(random_range(1, 4), random(360));
///Gravity
grav = 0.18;
///Friction
air_frict = 0.01;
ground_frict = 0.1;
///Misc
weight = 0.25;
image_alpha = random_range(5, 6.5);
image_index = irandom(image_number);
fade = 0.02;
x_bounce = 0.3;
y_bounce = 0.3;
can_damage = false;
fall_damage = 0;
facing = choose(-1, 1);
fallthrough = choose(true, false); ///Some fall through platforms, some don't.




