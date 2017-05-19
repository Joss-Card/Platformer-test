///Set factors
acc_factor = 1;
grav_factor = 1;
frict_factor = 1;
move_factor = 1;
jump_factor = 1;
entity_list = ds_list_create();

hsp_max = 3;
vsp_up = -3;
vsp_down = 2;



///Set up liquidiness
quality = 1;
spread = 0.0125; //How much the bounciness of the water spreads outwards
dampening = 0.05; //The "friction" of the water points. The lower the number, the longer it takes for waves to settle
constant = 0.015; //How fast the water points move

image_blend = merge_colour(c_blue, c_aqua, 0.75);
foam_colour = merge_colour(c_white, image_blend, 0.25)

//create physics points
points = quality*image_xscale*2;
for (i = 0; i <= points; i++)
{
    var p = instance_create(x+i*(8/quality), y, objLiquidPoint);
    p.max_y = y+8*image_yscale;
    p.parent = id;
    pointList[i] = p;
}

end_y = bbox_bottom*image_yscale;


///Create water drawer if it doesn't already exist
/*if (!instance_exists(objWaterDrawer))
{
    instance_create(0, 0, objWaterDrawer);
}



/* */
/*  */
