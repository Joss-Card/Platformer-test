///Draw rectangle over view
draw_set_colour(c_black);
draw_set_alpha(alpha);
draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ), false);
draw_set_alpha(1);
draw_set_colour(c_white);



