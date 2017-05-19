///Draw the button
var i;
if (press)
{
    i = press_index;
    yy = y+1;
}
else
if (hover)
{
    i = hover_index;
    yy = y;
}
else
{
    i = idle_index;
    yy = y;
}

draw_sprite_ext(sprite_index, i, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_font(font0);
draw_set_valign(fa_middle);
draw_set_halign(fa_middle);
draw_text(x, yy, string_hash_to_newline(text));



