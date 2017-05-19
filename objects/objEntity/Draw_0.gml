action_inherited();
///Draw entity
///Flash if we're currently invincible
if (invincible <= 0 || (floor(invincible/5) mod 3 != 0))
{
    ///Flash white if we've recently been hit
    if (white > 0)
    {
        d3d_set_fog(true, c_white, 0, 1);
    }
    ///Draw the entity's sprite
    draw_sprite_ext(sprite_index, -1, x, y, xscale*facing, yscale, image_angle, image_blend, image_alpha);
    if (white > 0)
    {
        d3d_set_fog(0, 0, 0, 0);
    }
}

///For test mode, draw a box showing the entity's bounding box
if (global.test_mode)
{
    draw_set_color(c_red);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    draw_set_color(c_white);
    draw_text(x, bbox_top-4, string_hash_to_newline(state));
}





