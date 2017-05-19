///create_parallax_layer(image, x_follow, y_follow, x_speed, y_speed, x_offset, y_offset, depth, colour, alpha);
/*
 * image - the background image to use
 * x/y_follow - the rate at which the layer follows the view (0-1)
 * x/y_speed - the movement speed of the layer, irregardless of view movement
 * x/y_offset - the offset position of the layer
 * depth - the depth of the layer
 * colour - the image_blend of the layer
 * alpha - the opacity of the layer (0-1)
 */
var a = instance_create(argument5, argument6, objParallaxLayer);
a.image = argument0;
a.x_follow = argument1;
a.y_follow = argument2;
a.x_speed = argument3;
a.y_speed = argument4;
a.depth = argument7;
a.image_blend = argument8;
a.image_alpha = argument9;
return a;
