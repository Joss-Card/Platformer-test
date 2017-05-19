action_inherited();
///State machine
switch (state)
{
    case 0:
        image_index = 0;
        //check for entities to crush
        if (collision_rectangle(x1, y1, x2, y2, target, true, true) != noone)
        {
            state = 1;
            charge_timer = 25;
            sprite_index = sprCrushingBlock;
        }
        break;
    case 1:
        //charge up then fall
        image_speed = 0.5;
        charge_timer--;
        if (charge_timer <= 0)
        {
            state = 2;
            attack_timer = 10;
        }
        break;
    case 2:
        //fall
        vsp += 0.5;
        if (collide_y)
        {
            vsp *= 0.5;
            if (abs(vsp) < 0.2)
            {
                attack_timer--;
                if (attack_timer <= 0)
                {
                    state = 3;
                    sprite_index = sprCrushingBlockEnd;
                    image_index = 0;
                }
            }
        }
        break;
    case 3:
        //return to start position
        var k = 40;
        vsp = (ystart-y)/k-0.25;
        if (y <= ystart)
        {
            state = 0;
            vsp = 0;
            y = ystart;
        }
        break;
}





