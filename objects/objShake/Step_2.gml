///Shake screen
delay--;
if (delay <= 0)
{
    //reset the delay timer
    delay = delay_max;
    previous_xview = __view_get( e__VW.XView, 0 );
    previous_yview = __view_get( e__VW.YView, 0 );
    //Set a new screen position
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(intensity, angle) ));
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(intensity, angle) ));
    angle += irandom_range(90, 270);
    //Reduce the counter
    amount--;
    if (amount <= 0)
    {
        instance_destroy();
    }
}



