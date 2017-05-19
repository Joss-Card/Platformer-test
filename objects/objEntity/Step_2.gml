///Movement

//Implement factors
ground_acc *= acc_factor;
air_acc *= acc_factor;
ground_frict *= frict_factor;
air_frict *= frict_factor;
move_speed *= move_factor;
grav *= grav_factor;
grav_slide *= grav_factor;
jump_height *= jump_factor;
djump_height *= jump_factor;

//Check if on the ground
ground = check_collision(0, 1);

//State machine for each possible state that the entity can be in
switch (state)
{
    case state.normal:
        //Set acceleration & friction
        if (ground)
        {
            acc = ground_acc;
            frict = ground_frict;
        }
        else
        {
            acc = air_acc;
            frict = air_frict;
        }
        //Gravity
        if (!ground)
        {
            vsp += grav;
        }
        //Horizontal Movement
        if (move_x < 0)
        {
            if (hsp >= -move_speed)
            {
                hsp = approach(hsp, move_speed*move_x, acc);
            }
            else
            {
                hsp = approach(hsp, move_speed*move_x, frict);
            }
        }
        else
        if (move_x > 0)
        {
            if (hsp <= move_speed)
            {
                hsp = approach(hsp, move_speed*move_x, acc);
            }
            else
            {
                hsp = approach(hsp, move_speed*move_x, frict);
            }
        }
        //Vertical movement
        if (move_y < 0)
        {
            if (vsp >= -move_speed)
            {
                vsp = approach(vsp, move_speed*move_y, acc);
            }
            else
            {
                vsp = approach(vsp, move_speed*move_y, frict);
            }
        }
        else
        if (move_y > 0)
        {
            if (vsp <= move_speed)
            {
                vsp = approach(vsp, move_speed*move_y, acc);
            }
            else
            {
                vsp = approach(vsp, move_speed*move_y, frict);
            }
        }
        //Check for walls
        if (wall_jump && !ground)
        {
            cling_left = place_meeting(x-1, y, objSolid);
            cling_right = place_meeting(x+1, y, objSolid);
            if (cling_left || cling_right)
            {
                state = state.wall_slide;
                break;
            }
        }
        else
        {
            cling_left = false;
            cling_right = false;
        }
        //Friction
        if (move_x == 0)
        {
            hsp = approach(hsp, 0, frict);
        }
        if (move_y == 0 && grav == 0)
        {
            vsp = approach(vsp, 0, frict);
        }
        //Jumping
        if (ground) jumps = 1;
        if (move_jump)
        {
            if (ground)
            {
                //Ground jump
                vsp = -jump_height*move_jump;
                ground = false;
                jumps = 1;
            }
            else
            {
                //Air jump (double jump)
                //check how many times we can jump
                if (jumps++ < jumps_max || in_water)
                {
                    vsp = -djump_height*move_jump;
                }
            }
            move_jump = 0;
        }
        //Start climbing
        if (climb_up && place_meeting(x, y-1, objLadder) && !place_meeting(x, y-1, objSolid)) ||
           (climb_down && place_meeting(x, y+1, objLadder) && !place_meeting(x, y+1, objSolid))
        {
            state = state.climbing;
        }
        break;
    case state.wall_slide:
        //Face the correct direction
        if (cling_left) facing = 1; else facing = -1;
        //Check if the wall is still there!
        if (ground ||
           (cling_left && !place_meeting(x-1, y, objSolid)) ||
           (cling_right && !place_meeting(x+1, y, objSolid)))
        {
            cling_left = false;
            cling_right = false;
            state = state.normal;
            break;
        }
        //Gravity
        if (!ground)
        {
            if (vsp >= 0)
            {
                vsp = approach(vsp, slide_speed, grav_slide);
            }
            else
            {
                vsp += grav;
            }
        }
        //Unsticking from the wall
        if (!ground)
        {
            if ((move_x > 0 && cling_left) || (move_x < 0 && cling_right))
            {
                if (stuck_time++ >= stick_time)
                {
                    state = state.normal;
                    break;
                }
            }
            else
            {
                stuck_time = 0;
            }
        }
        //Wall jumping
        if (move_jump)
        {
            var jump_up_wall = -jump_height*move_jump;
            var jump_off_wall = jump_height*0.45;
            if (cling_left)
            {
                //Jump off left wall
                if (move_x < 0)
                {
                    vsp = jump_up_wall;
                    hsp = jump_off_wall;
                }
                else
                {
                    vsp = -jump_height;
                    hsp = move_speed;
                }
            }
            else
            if (cling_right)
            {
                //Jump off right wall
                if (move_x > 0)
                {
                    vsp = jump_up_wall;
                    hsp = -jump_off_wall;
                }
                else
                {
                    vsp = -jump_height;
                    hsp = -move_speed;
                }
            }
            jumps = 1;
            move_jump = 0;
            state = state.normal;
            break;
        }
        break;
    case state.climbing:
        //Set acceleration & friction
        acc = 0;
        frict = 1;
        //Release from climbing
        if (move_x != 0 && !climb_up && !climb_down)
        {
            if (++ladder_stuck >= ladder_stick || ground)
            {
                state = state.normal;
                break;
            }
        }
        else
        {
            ladder_stuck = 0;
        }
        //Friction
        if (move_x == 0)
        {
            hsp = approach(hsp, 0, frict);
        }
        if (move_y == 0)
        {
            vsp = approach(vsp, 0, frict);
        }
        //Jump off
        if (move_jump)
        {
            vsp = -djump_height;
            move_jump = false;
            state = state.normal;
            jumps = 1;
            break;
        }
        //Climbing movement
        var climb = false;
        if (climb_up)
        {
            var a = climb_up_speed;
            if (!place_meeting(x, y-a, objLadder))
            {
                state = state.normal;
            }
            if (!place_meeting(x, y-a, objSolid))
            {
                y -= a;
                climb = true;
            }
        }
        else
        if (climb_down)
        {
            var a = climb_down_speed;
            if (!place_meeting(x, y+a, objLadder) ||
                 place_meeting(x, y+a, objSolid))
            {
                state = state.normal;
            }
            if (!place_meeting(x, y+a, objSolid))
            {
                y += a;
                climb = true;
            }
        }
        //Move towards the centre of the ladder
        var ladder = instance_place(x, y, objLadder);
        if (ladder != noone)
        {
            x = approach(x, ladder.x, 0.5);
        }
        else
        {
            state = state.normal;
            break;
        }
        break;
    case state.ledge_grab:
        //Unsticking from the ledge by moving horizontally
        if (move_x < 0)
        {
            if (facing == 1)
            {
                if (++ledge_stuck > ledge_stick)
                {
                    state = state.normal;
                    break;
                }
            }
            else
            {
                move_x = 0;
            }
        }
        else
        if (move_x > 0)
        {
            if (facing == -1)
            {
                if (++ledge_stuck > ledge_stick)
                {
                    state = state.normal;
                    break;
                }
            }
            else
            {
                move_x = 0;
            }
        }
        else //if not moving horizontally, reset ledge stuck timer
        {
            ledge_stuck = 0;
        }
        //Jump off
        if (move_jump)
        {
            vsp = -djump_height;
            move_jump = false;
            state = state.normal;
            break;
        }
        //Unsticking by hitting down
        if (fallthrough)
        {
            state = state.normal;
        }
        //Check if the block we're grabbing still exists, if not... release!
        if (!instance_exists(ledge_grab_block))
        {
            state = state.normal;
            break;
        }
        else
        //Check for collisions with other blocks which would stop us from grabbing this block
        if (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_bottom+1, objSolid, true, true))
        {
            state = state.normal;
            x = xprevious;
            y = yprevious;
        }
        else
        //Stick to & face the block we're grabbed on to
        {
            if (ledge_grab_block.x < x) facing = -1 else facing = 1;
            x = ledge_grab_block.x+ledge_grab_x;
            y = ledge_grab_block.y+ledge_grab_y;
        }
        break;
}

//Check for grabbing a ledge
if (state == state.normal || state == state.wall_slide)
if (can_grab && vsp > 0 && !fallthrough && move_x != 0)
{
    //Set our grab points
    var gx = x+move_x*8;
    var gy = bbox_top+4;
    //Find the block in front of us (if any)
    var xx = x+hsp+move_x;
    var yy = y-2;
    var block = instance_place(xx, yy, objSolid);
    if (block != noone)
    {
        var grab_block = true;
        with (block)
        {
            //Make sure the block is within the confines of the room
            if (bbox_right < 0 || bbox_left > room_width ||
                bbox_bottom < 0 || bbox_top > room_height)
            {
                grab_block = false;
            }
            else
            //Make sure there's not a block above this one
            if (place_meeting(x, y-1, objSolid))
            {
                grab_block = false;
            }
        }
        if (grab_block)
        {
            //Set the block's grab points
            var target_gx = block.bbox_left;
            if (move_x < 0) target_gx = block.bbox_right;
            target_gy = block.bbox_top;
            //Check if the grab points are in the correct positions
            if (gy > target_gy-3 && gy < target_gy+3 && !place_meeting(x, y, objSemiSolid))
            {
                state = state.ledge_grab;
                //Set x & y positions
                var w = round((bbox_right-bbox_left)/2)+2;
                x = block.bbox_left-w;
                if (move_x < 0) x = block.bbox_right+w;
                y = block.bbox_top+(bbox_bottom-bbox_top)-2;
                //Stop moving!
                vsp = 0;
                hsp = 0;
                move_x = 0;
                move_y = 0;
                //No more clinging to that wall for you
                cling_left = false;
                cling_right = false;
                //Set ledge grab position relative to the block
                ledge_grab_x = x-block.x;
                ledge_grab_y = y-block.y;
                ledge_grab_block = block;
            }
        }
    }
}

///Un-implement factors
ground_acc /= acc_factor;
air_acc /= acc_factor;
ground_frict /= frict_factor;
air_frict /= frict_factor;
move_speed /= move_factor;
grav /= grav_factor;
grav_slide /= grav_factor;
jump_height /= jump_factor;
djump_height /= jump_factor;

///Reset factors to 1
acc_factor = 1;
frict_factor = 1;
grav_factor = 1;
move_factor = 1;
jump_factor = 1;



///Fall damage!
if (fall_damage > 0)
{
    ///If we're colliding horizontally or vertically...
    if (collide_x || collide_y)
    {
        ///Get absolute values. This removes negatives.
        var ahsp = abs(previous_hsp);
        var avsp = abs(previous_vsp);
        ///If we're moving at higher than min fall damage speed...
        if ((collide_x && ahsp > fall_damage_min_speed) ||
            (collide_y && avsp > fall_damage_min_speed))
        {
            ///Check which (horizontal/vertical) speed
            ///is currently higher
            var sp = avsp;
            if (ahsp > avsp)
            {
                sp = ahsp;
            }
            if (sp > fall_damage_min_speed)
            {
                //Minimum damage
                var min_damage = 1;
                //Damage based on speed
                var spd_damage = round((sp/fall_damage_max_speed)*fall_damage);
                //Take damage
                take_damage += max(min_damage, spd_damage);
            }
        }
    }
}



///Take damage
///Reduce flash white timer
if (white > 0)
{
    white--;
}
///Reduce invincible timer
if (invincible > 0)
{
    invincible--;
}
///Check for taking damage
if (can_damage)
{
    if (take_damage > 0)
    {
        //Stop grabbing that ledge, bitch!
        ledge_grab = false;
        //If we're invincible, set the damage to 0
        if (invincible > 0)
        {
            take_damage = 0;
        }
        else
        //If we become invincible when hit,
        //set invincible variable to 1 second
        if (invincible_when_hit)
        {
            invincible = room_speed*1.5;
        }
        //Create a "universal" hit effect
        create_effect(mid_x(), mid_y(), sprHitEffect, 0.5);
        //Reduce hp
        hp -= take_damage;
        take_damage = 0;
        //Destroy if we're out of hp
        if (hp <= 0)
        {
            instance_destroy();
        }
        //Flash white for 8 steps
        white = 8;
    }
}   


///Wrap around room
wrap(8);



action_inherited();
