///check_collision(x_offset, y_offset)
/*
 * Check if there's a collision at a given position
 * used the object's bounding box and the given x_offset & y_offset
 * 
 * x_offset - relative x position to check the collision
 * y_offset - relative y position to check the collision
 *
 * returns true if there's a collision, otherwise false.
 */
var xx = x+argument0;
var yy = y+argument1;

var solid_collision = (place_meeting(xx, yy, objSolid));

///If we're in collision with a solid block
///return true straight away
if (solid_collision)
{
    return true;
}
///If not... check for semi-solid (fallthrough) platforms
else
{
    ///Only check for platforms if the "fallthrough" flag is false
    ///and our vertical speed is >= 0
    if (!fallthrough && vsp >= 0)
    {
        var semi_collision = (place_meeting(xx, yy, objSemiSolid));
        if (semi_collision)
        {
            ///Only collide with the fallthrough platform
            ///if the area above us is not colliding with the platform
            var above_collision = (place_meeting(xx, yy-1, objSemiSolid));
            if (!above_collision)
            {
                return true;
            }
        }
    }
}
                       
return false;
