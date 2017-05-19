///Set variables
width = 4;
height = 4;
life = 5; //number of steps which the hitbox lasts for
parent = noone; //the object which created it < can't collide with this!
stick_to = noone; //stick to an object?
x_offset = 0; //offset for sticking to object < takes stick_to.facing in to consideration
y_offset = 0;
collided = ds_list_create(); //a list of entities already collided with
damage = 0;
knockback = 0;
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;


