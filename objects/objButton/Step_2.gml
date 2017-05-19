///Check for being pressed
if (press)
{
    //Check if the mouse button has been released
    if (mouse_check_button_released(mb_left))
    {
        press = false;
        if (mouse_over())
        {
            //Set off "Pressed" event to do differet
            //things depending on the button being pressed
            event_user(0);
        }
    }
}
else
{
    if (mouse_over())
    {
        //Button is being hovered over
        hover = true;
        
        //Is button being pressed?
        if (mouse_check_button_pressed(mb_left))
        {
            press = true;
        }
    }
    else
    {
        hover = false;
    }
}


