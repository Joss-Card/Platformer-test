action_inherited();
///Set Sprite
if (vsp < -1)
{
    image_index = 0;
}
else
if (vsp > 1)
{
    image_index = 2;
}
else
{
    image_index = 1;
}


///Destroy after time
expiry--;
if (expiry < 0)
{
    if (round(hsp) == 0)
    if (on_ground())
    {
        instance_destroy();
    }
}


