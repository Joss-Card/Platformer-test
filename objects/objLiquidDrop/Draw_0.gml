///Draw droplet
if (!position_meeting(x, y, objLiquid))
{
    var w = 1;
    draw_set_alpha(0.4);
    draw_set_colour(image_blend);
    draw_line_width(xprevious, yprevious, x, y, w);
    draw_set_colour(c_white);
    draw_set_alpha(1);
}



