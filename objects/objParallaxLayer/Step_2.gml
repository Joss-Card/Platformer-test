///Move with view
var x_diff = __view_get( e__VW.XView, 0 )-previous_xview;
var y_diff = __view_get( e__VW.YView, 0 )-previous_yview;
x += x_diff*x_follow+x_speed;
y += y_diff*y_follow+y_speed;
previous_xview = __view_get( e__VW.XView, 0 );
previous_yview = __view_get( e__VW.YView, 0 );



