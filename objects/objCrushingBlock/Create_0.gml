action_inherited();
///Set up
x1 = x+4;
y1 = bbox_bottom;
x2 = bbox_right-4;
y2 = bbox_bottom;
var p = 4;
repeat(128)
{
    y2 += p;
    if (collision_rectangle(x1, y1, x2, y2, objSolid, true, true) != noone)
    {
        break;
    }
}
state = 0; //0=idle, 1=charging, 2=falling, 3=reloading
charge_timer = 0;
attack_timer = 0;
image_speed = 0;
image_index = 0;
can_crush = true;
target = objPlayer;




