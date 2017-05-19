///Follow target
if (target != noone)
{
    ///If the camera target exists, smoothly follow it
    if (instance_exists(target))
    {
        var k = 0.25;
        __view_set( e__VW.XView, 0, smooth_approach(__view_get( e__VW.XView, 0 ), target.x-__view_get( e__VW.WView, 0 )/2, k ));
        __view_set( e__VW.YView, 0, smooth_approach(__view_get( e__VW.YView, 0 ), target.y-__view_get( e__VW.HView, 0 )/2, k ));
    }
    else
    {
        target = noone;
    }
}

///Limit view to within the room
__view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ), 0, room_width-__view_get( e__VW.WView, 0 ) ));
__view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ), 0, room_height-__view_get( e__VW.HView, 0 ) ));



