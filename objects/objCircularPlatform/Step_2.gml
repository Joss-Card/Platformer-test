///Move in a circular motion
angle += spd;

///Calculate next position
var xnew = round(xstart+lengthdir_x(len, angle));
var ynew = round(ystart+lengthdir_y(len, angle));
var h = xnew-x;
var v = ynew-y;

///Get list of entities on top of the block
ds_list_destroy(on_top);
on_top = block_get_entities(h, v, h, v);

///Move
x = xnew;
y = ynew;

///Move entities on top
block_move_entities();

///Accelerate
spd = clamp(spd+acc, -max_spd, max_spd);


