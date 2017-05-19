action_inherited();
///Create stuck arrow
if (hit != noone)
{
    if (object_is_ancestor(hit.object_index, objBlock))
    {
        with (instance_create(x, y, objArrowStuck))
        {
            image_angle = other.image_angle;
            image_xscale = other.image_xscale;
            ds_list_add(other.hit.stuck, id);
        }
    }
}


