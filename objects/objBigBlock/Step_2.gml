action_inherited();
///Reverse
if (collide_x)
{
    //Stop movement & reverse acceleration
    //when we collide with another block
    //or a reversing object
    hsp = 0;
    acc *= -1;
}

///Accelerate
hsp = clamp(hsp+acc, -hsp_max, hsp_max);



