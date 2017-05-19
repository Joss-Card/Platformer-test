///Bounce
if (active)
{
    with (other)
    {
        set_speed(other.bounce, other.angle);
    }
    image_speed = animation_speed;
    active = false;
}



