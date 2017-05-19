///Draw
draw_set_colour(c_black);
draw_set_alpha(alpha);
var x1 = __view_get( e__VW.XView, 0 );
var y1 = __view_get( e__VW.YView, 0 );
var x2 = __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 );
var y2 = __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 );
draw_rectangle(x1, y1, x2, y2, false);
draw_set_alpha(1);
draw_set_colour(c_white);


