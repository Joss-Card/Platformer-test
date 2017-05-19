///Set up
target = noone; //the object or instance that we want to hit
parent = noone;
hsp = 0;
hsp_max = 50;
vsp = 0;
vsp_max = 50;
cs = 0; //< for inter-pixel movement
grav = 0; //gravity
grav_dir = 270; //direction of gravity (default: down)
grav_add = 0; //how much gravity is added to each step
grav_max = 5; //maximum gravity
frict = 0; //friction in both directions
damage = 1;
knockback = 1;
wrapped = false; //true if the object wrapped around the screen this step
collided = ds_list_create(); //list of collided objects, so as not to collide again
pierce = 0; //how many objects to pierce through before destroying
hit = noone; //the instance we hit upon destruction
bounce = 0; //number of times to bounce off walls
bounce_x = 0; //amount of bounce
bounce_y = 0;
fallthrough = true;




