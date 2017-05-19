///Set up
image = backLayer1;
x_follow = 0.9; //the rate at which the layer follows the view (0-1)
y_follow = 0.9;
x_speed = -0.2; //the movement speed of the layer outside of view movement
y_speed = 0;

previous_xview = __view_get( e__VW.XView, 0 );
previous_yview = __view_get( e__VW.YView, 0 );


