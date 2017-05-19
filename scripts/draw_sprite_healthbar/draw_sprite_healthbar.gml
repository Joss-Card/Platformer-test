///draw_sprite_healthbar(x, y, width, sprite, hp, max_hp)
/*
 * Draw a healthbar represented as a series of sprites
 *
 * x - starting x position of the healthbar
 * y - starting y position of the healthbar
 * width - width (in sprites) of each row
 * sprite - the sprite to draw
 * hp - current health to draw
 * max_hp - maximum health
 */
var xx = argument0;
var yy = argument1;
var width = argument2;
var sprite = argument3;
var hp = argument4;
var max_hp = argument5;
var w = sprite_get_width(sprite);
var h = sprite_get_height(sprite);
var column = 0;
var row = 0;
var this_hp = 0; //the current bit of hp to draw
var per_sprite = sprite_get_number(sprite)-1; //the images per sprite (e.g. half-hearts)

///Loop through and draw all the health sprites
for (var i = 0; i < max_hp; i += per_sprite)
{
    var t = i-hp;
    if (t < 0)
    {
        var image = max(0, t+per_sprite);
    }
    else
    {
        var image = per_sprite;
    }
    draw_sprite(sprite, image, xx+column*w, yy+row*h);
    //Increase column and row if we've
    //reached max width
    column++;
    if (column >= width)
    {
        column = 0;
        row++;
    }
}
