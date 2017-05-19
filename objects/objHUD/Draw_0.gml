///Draw HUD
var xx = __view_get( e__VW.XView, 0 )+2;
var yy = __view_get( e__VW.YView, 0 )+2;
///Draw health bar
if (hp_flash > 0)
{
    d3d_set_fog(true, c_white, 1, 0);
}
draw_sprite_healthbar(xx, yy, 5, sprHeartIcon, hp, max_hp);
if (hp_flash > 0)
{
    d3d_set_fog(0, 0, 0, 0);
}
///Draw gold
yy += 16+((9*((max_hp-1)/2 div 5)+1));
draw_set_font(font0);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var str = string(gold)+"g";
if (gold_flash > 0)
{
    draw_set_colour(c_white);
}
else
{
    draw_set_colour(c_black);
}
draw_text_transformed(xx+0, yy, string_hash_to_newline(str), gold_scale, gold_scale, 0);
draw_text_transformed(xx+2, yy, string_hash_to_newline(str), gold_scale, gold_scale, 0);
draw_text_transformed(xx+1, yy-1, string_hash_to_newline(str), gold_scale, gold_scale, 0);
draw_text_transformed(xx+1, yy+1, string_hash_to_newline(str), gold_scale, gold_scale, 0);
if (gold_flash > 0)
{
    draw_set_colour(c_white);
}
else
{
    draw_set_colour(c_yellow);
}
draw_text_transformed(xx+1, yy, string_hash_to_newline(str), gold_scale, gold_scale, 0);
draw_set_colour(c_white);
///Draw test stuff
if (global.test_mode)
{
    yy += 14;
    draw_text_outlined(xx+1, yy, string(fps_round), c_test, c_black);
    yy += 14;
    draw_text_outlined(xx+1, yy, "Entities: "+string(instance_number(objEntity)), c_test, c_black);
}




