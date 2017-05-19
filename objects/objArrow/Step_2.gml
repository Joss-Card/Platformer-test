action_inherited();
///Create trail
if (!wrapped)
{
    with (instance_create(x, y, objArrowTrail))
    {
        x1 = other.xprevious;
        y1 = other.yprevious;
    }
}
else
{
    with (instance_create(x, y, objArrowTrail))
    {
        x1 = other.x-other.hsp;
        y1 = other.y-other.vsp;
    }
    with (instance_create(xprevious, yprevious, objArrowTrail))
    {
        x1 = other.xprevious+other.hsp;
        y1 = other.yprevious+other.vsp;
    }
}


///Set image_angle to the direction of travel
var dir = point_direction(0, 0, hsp, vsp);
image_angle = dir;//angle_approach(image_angle, dir, 1);


