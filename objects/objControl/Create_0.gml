///Randomize!
randomize();




///Set variables
global.test_mode = 0;
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);

///Set enums
enum state
{
    normal,
    wall_slide,
    climbing,
    ledge_grab,
    water,
}




///Config

///Blur colours pixels? Turn on for HD, off for pixel art
texture_set_interpolation(false);

///Multiplayer stuff
global.players = 0; //how many players playing?
global.keyboard_player = 0; //which player can use the keyboard?

///Gamepad setup
var deadzone = 0.22; //analogue stick deadzones
gamepad_set_axis_deadzone(0, deadzone);
gamepad_set_axis_deadzone(1, deadzone);
gamepad_set_axis_deadzone(2, deadzone);
gamepad_set_axis_deadzone(3, deadzone);
var threshold = 0.5; //trigger thresholds
gamepad_set_button_threshold(0, threshold);
gamepad_set_button_threshold(1, threshold);
gamepad_set_button_threshold(2, threshold);
gamepad_set_button_threshold(3, threshold);



///Goto next room
room_goto_next();


