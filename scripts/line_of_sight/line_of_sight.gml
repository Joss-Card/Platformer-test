///line_of_sight(x1, y1, x2, y2, [precision])
/*
 * Checks for solid blocks between (x1, y1) and (x2, y2)
 * x1, y1, x2, y2 - positions
 * 
 * returns true if there are no blocks between the points,
 *         false otherwise.
 *
 * If you want a speed boost, increase the precision variable
 *
 */
var s, x1, y1, x2, y2, xx, yy, dir, dis, i, result, precision;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
precision = 2;
if (argument_count > 4)
{
    precision = argument[4];
}
dir = point_direction(x1, y1, x2, y2);
dis = point_distance(x1, y1, x2, y2);
result = true;
var mask = mask_index;
mask_index = sprPixel;
for (i = precision; i < dis; i+=precision)
{
    xx = x1+lengthdir_x(i, dir);
    yy = y1+lengthdir_y(i, dir);
    if (place_meeting(xx, yy, objSolid))
    {
        result = false;
        break;
    }
}
mask_index = mask;
return result;
