///Draw liquid

//Draw water primitive
draw_set_colour(image_blend);
draw_set_alpha(0.3);
draw_primitive_begin(pr_trianglestrip);
for (var i = 0; i <= points; i++)
{
    var p = pointList[i];
    draw_vertex(p.x, p.y); //draw vertex at surface of water
    draw_vertex(p.x, end_y); //draw vertex at bottom of water
}
draw_primitive_end();
draw_set_alpha(1);
draw_set_colour(c_white);

//Draw white "foam" on moving water points
draw_set_colour(foam_colour);
for (var i = 0; i <= points; i++)
{
    var p = pointList[i];
    if (p.vspeed != 0)
    if (i != points) //forget about the last point in the list
    {
        var p2 = pointList[i+1];
        var r = (1-cos(p.vspeed/2))*4; //formula for calculating the radius/width based on speed
        if (r > 0.1)
        {
            var x1 = p.x; var y1 = p.y-1;
            var x2 = p2.x; var y2 = p2.y-1;
            draw_line_width(x1, y1, x2, y2, r*2);
            draw_circle(x1, y1, r, false);
            draw_circle(x2, y2, r, false);
        }
    }
}
draw_set_colour(c_white);




