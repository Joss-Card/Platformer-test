///Store old states
///ground, cling_left & cling_right
///will all be calculated during inherited code
var old_ground = ground;
var old_cling = (cling_left || cling_right);




action_inherited();
///Check if states have changed
if (!old_ground && ground)
if (abs(previous_vsp) > 1)
{
    ///Hit the ground
    image_index = 0;
    yscale = 1-bounce;
    xscale = 1+bounce;
    repeat(4)
    {
        var xx = x+irandom_range(-5, 5);
        var yy = y-irandom(3);
        var a = create_effect(xx, yy, sprDust, random_range(0.2, 0.4));
        a.image_alpha = random_range(.5, 1);
    }
}



///Keyboard & controller input
if (global.keyboard_player == player_number) //check if this player can be controller using the keyboard
{
    var kLeft               = keyboard_check(key_left);
    var kRight              = keyboard_check(key_right);
    var kUp                 = keyboard_check(key_up);
    var kDown               = keyboard_check(key_down);
    var kJump               = keyboard_check_pressed(key_jump) || gamepad_button_check_pressed(player_number, pad_jump);
    var kJumpRelease        = keyboard_check_released(key_jump) || gamepad_button_check_released(player_number, pad_jump);
    var kAimLeft            = keyboard_check(key_aim_left);
    var kAimRight           = keyboard_check(key_aim_right);
    var kAimUp              = keyboard_check(key_aim_up);
    var kAimDown            = keyboard_check(key_aim_down);
    var kAimLeftPress       = keyboard_check_pressed(key_aim_left);
    var kAimRightPress      = keyboard_check_pressed(key_aim_right);
    var kAimUpPress         = keyboard_check_pressed(key_aim_up);
    var kAimDownPress       = keyboard_check_pressed(key_aim_down);
    var kAimLeftRelease     = keyboard_check_released(key_aim_left);
    var kAimRightRelease    = keyboard_check_released(key_aim_right);
    var kAimUpRelease       = keyboard_check_released(key_aim_up);
    var kAimDownRelease     = keyboard_check_released(key_aim_down);
    var kAttack             = keyboard_check(key_attack) || gamepad_button_check(player_number, pad_attack);
    var kAttackPress        = keyboard_check_pressed(key_attack) || gamepad_button_check_pressed(player_number, pad_attack);
    var kAttackRelease      = keyboard_check_released(key_attack) || gamepad_button_check_released(player_number, pad_attack);
}
else
{
    var kLeft               = false;
    var kRight              = false;
    var kUp                 = false;
    var kDown               = false;
    var kJump               = gamepad_button_check_pressed(player_number, pad_jump);
    var kJumpRelease        = gamepad_button_check_released(player_number, pad_jump);
    var kAimLeft            = false;
    var kAimRight           = false;
    var kAimUp              = false;
    var kAimDown            = false;
    var kAimLeftPress       = false;
    var kAimRightPress      = false;
    var kAimUpPress         = false;
    var kAimDownPress       = false;
    var kAimLeftRelease     = false;
    var kAimRightRelease    = false;
    var kAimUpRelease       = false;
    var kAimDownRelease     = false;
    var kAttack             = gamepad_button_check(player_number, pad_attack);
    var kAttackPress        = gamepad_button_check_pressed(player_number, pad_attack);
    var kAttackRelease      = gamepad_button_check_released(player_number, pad_attack);
}

//Movement using controller
if (!kLeft && !kRight && !kUp && !kDown)
{
    if (pad_move_axish == noone || pad_move_axisv == noone) //move using buttons
    {
        kLeft = keyboard_check(key_left);
        kRight = keyboard_check(key_right);
        kUp = keyboard_check(key_up);
        kDown = keyboard_check(key_down);
    }
    else //move using stick
    {
        var axish = gamepad_axis_value(player_number, pad_move_axish);
        var axisv = gamepad_axis_value(player_number, pad_move_axisv);
        var a = 0.4; //stick threshold for kUp & kDown
        kUp = (axisv < -a);
        kDown = (axisv > a);
        var a = 0.5; //stick threshold for kLeft & kRight
        if (abs(axisv) < 0.6)//only check left & right if the stick is below 0.6 vertically
        {
            kRight = (axish > a);
            kLeft = (axish < -a);
        }
    }
}

//Shooting using a controller
if (!kAimLeft && !kAimRight && !kAimUp && !kAimDown)
{
    var axish = gamepad_axis_value(player_number, pad_aim_axish);
    var axisv = gamepad_axis_value(player_number, pad_aim_axisv);
    var axis_aiming = (axish != 0 || axisv != 0); //is the stick being used?
    var dir = point_direction(0, 0, axish*10, axisv*10); //stick aiming direction
    var a = 15; //threshold angle for aiming diagonally or vertically/horizontally
    //Shoot by aiming with the stick and pressing a button
    if (!axis_aiming) //if not aiming using the stick, then shoot forwards
    {
        dir = 90-90*facing;
    }
    if (gamepad_button_check(player_number, pad_shoot))
    {
        if (dir <= 90-a || dir >= 270+a)
        {
            kAimRight = true;
        }
        if (dir >= a && dir <= 180-a)
        {
            kAimUp = true;
        }
        if (dir >= 90+a && dir <= 270-a)
        {
            kAimLeft = true;
        }
        if (dir >= 180+a && dir <= 360-a)
        {
            kAimDown = true;
        }
    }
    if (gamepad_button_check_pressed(player_number, pad_shoot))
    {
        if (dir <= 90-a || dir >= 270+a)
        {
            kAimRightPress = true;
        }
        if (dir >= a && dir <= 180-a)
        {
            kAimUpPress = true;
        }
        if (dir >= 90+a && dir <= 270-a)
        {
            kAimLeftPress = true;
        }
        if (dir >= 180+a && dir <= 360-a)
        {
            kAimDownPress = true;
        }
    }
    if (gamepad_button_check_released(player_number, pad_shoot))
    {
        if (dir <= 90-a || dir >= 270+a)
        {
            kAimRightRelease = true;
        }
        if (dir >= a && dir <= 180-a)
        {
            kAimUpRelease = true;
        }
        if (dir >= 90+a && dir <= 270-a)
        {
            kAimLeftRelease = true;
        }
        if (dir >= 180+a && dir <= 360-a)
        {
            kAimDownRelease = true;
        }
    }
}




///Control

///Check if weapons still exist
if (ranged_weapon != noone)
if (!instance_exists(ranged_weapon)) ranged_weapon = noone;
if (melee_weapon != noone)
if (!instance_exists(melee_weapon)) melee_weapon = noone;
///Movement Controls
if (can_move)
{
    //Set move_x depending on if we're pressing
    //the left or right keys
    if (kRight || kLeft)
    {
        if (kLeft && !kRight)
        {
            move_x = -1;
        }
        if (kRight && !kLeft)
        {
            move_x = 1;
        }
        if (move_x != 0 && state == state.normal)
        {
            facing = move_x;
        }
    }
    else
    //Otherwise, set move_x to 0
    {
        move_x = 0;
    }
    //Fall through platforms if we're pressing the down key
    fallthrough = kDown;
    
    //Check if we can/want to jump!
    if (kJump)
    {
        //Set move_jump, so that inherited code makes us jump
        move_jump = true;
        if (jumps < jumps_max || ground)
        {
            //Stretch the sprite a little
            yscale = 1+bounce;
            xscale = 1-bounce;
            if (ground)
            {
                //Create dust effects
                repeat(4)
                {
                    var xx = x+irandom_range(-5, 5);
                    var yy = y-irandom(3);
                    var a = create_effect(xx, yy, sprDust, random_range(0.2, 0.4));
                    a.image_alpha = random_range(.5, 1);
                }
            }
        }
    }
    //This is for variable jumping
    //if we release the jump key while in the air,
    //reduce our vertical speed so that we don't
    //jump as high
    if (kJumpRelease)
    {
        if (vsp < 0)
        {
            vsp *= 0.65;
        }
    }
    
    //Climbing controls
    climb_up = (kUp && !kDown);
    climb_down = (kDown && !kUp);
}
else
//If we cannot move, keep movement variables false
{
    move_x = 0;
    move_jump = false;
    climb_up = false;
    climb_down = false;
}
//Melee weapon controls
//Check if we can melee attack
//This depends of whether we have a melee weapon
//and whether our ranged weapon is being used.
var can_melee = false;
if (melee_weapon != noone && state != state.ledge_grab)
{
    if (ranged_weapon == noone)
    {
        can_melee = true;
    }
    else
    {
        if (!ranged_weapon.active)
        {
            can_melee = true;
        }
    }
}
//If, indeed, we CAN melee attack... do it!
if (can_melee)
with (melee_weapon)
{
    //Set various variables (press, hold, release)
    //and each weapon can do different things depending on
    //what these variables are set to.
    if (kAttackPress)
    {
        press = true;
    }
    if (kAttack)
    {
        hold = true;
    }
    if (kAttackRelease)
    {
        release = true;
    }
}

//Ranged weapon controls
//Check if we can ranged attack
//This depends of whether we have a ranged weapon
//and whether our melee weapon is being used.
var can_ranged = false;
if (ranged_weapon != noone && state != state.ledge_grab)
{
    if (melee_weapon == noone)
    {
        can_ranged = true;
    }
    else
    {
        if (!melee_weapon.active)
        {
            can_ranged = true;
        }
    }
}

//Aiming Controls
if (can_ranged)
with (ranged_weapon)
{
    if (kAimLeftRelease || kAimRightRelease || kAimUpRelease || kAimDownRelease)
    {
        release = true;
    }
    else
    if (kAimUp || kAimDown || kAimLeft || kAimRight)
    {
        hold = true;
        if (kAimLeft)
        {
            other.facing = -1;
            if (kAimUp)
            {
                aim_direction = 135;
            }
            else
            if (kAimDown)
            {
                aim_direction = 225;
            }
            else
            {
                aim_direction = 180;
            }
        }
        else
        if (kAimRight)
        {
            other.facing = 1;
            if (kAimUp)
            {
                aim_direction = 45;
            }
            else
            if (kAimDown)
            {
                aim_direction = 315;
            }
            else
            {
                aim_direction = 0;
            }
        }
        else
        if (kAimUp)
        {
            aim_direction = 90;
        }
        else
        if (kAimDown)
        {
            aim_direction = 270;
        }
        if (kAimLeftPress || kAimRightPress || kAimUpPress || kAimDownPress)
        {
            press = true;
        }
    }
}

//Check if we can still grab ledges
//can_grab = (can_melee && can_ranged);




///Set Sprites
var set_sprites = true;

///If either of our weapons are active, then
///we don't want to set sprites because they
///will be set by the weapon objects.
if (melee_weapon != noone)
if (melee_weapon.active)
    set_sprites = false;
if (ranged_weapon != noone)
if (ranged_weapon.active)
    set_sprites = false;

///If weapons aren't active then we can set
///idle, running, jumping & sliding sprites
if (set_sprites)
{
    switch (state)
    {
        case state.ledge_grab:
            sprite_index = sprGrab;
            image_speed = 0;
            image_index = 0;
            break;
        case state.climbing:
            sprite_index = sprClimb;
            image_speed = 0;
            if (climb_up) image_index += 0.4;
            if (climb_down) image_index -= 0.4;
            break;
        case state.wall_slide:
            sprite_index = sprSlide;
            image_speed = 0.4;
            if (cling_left) facing = 1; else facing = -1;
            break;
        case state.normal:
            if (ground)
            {
                if (move_x != 0)
                {
                    sprite_index = sprRun;
                    image_speed = 0.15*abs(hsp);
                }
                else
                {
                    sprite_index = sprIdle;
                    image_speed = 0.25;
                }
            }
            else
            {
                sprite_index = sprJump;
                if (vsp > 0) image_index = 1; else image_index = 0;
            }
            break;
    }
}



