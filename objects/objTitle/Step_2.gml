///Smooth_approach towards target
y = smooth_approach(y, target_y, 0.07);
__view_set( e__VW.YView, 0, smooth_approach(__view_get( e__VW.YView, 0 ), 0, 0.1 ));



