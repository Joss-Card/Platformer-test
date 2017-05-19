///create_effect(x, y, sprite, animation_speed)
/*
 * Create an effect (essentially a particle)
 * with a given position, sprite & animation speed
 */
var a = instance_create(argument0, argument1, objEffect);
a.sprite_index = argument2;
a.image_speed = argument3;
return a;
