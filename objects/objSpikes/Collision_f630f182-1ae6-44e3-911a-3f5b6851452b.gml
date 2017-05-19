///Damage the entity!
if (other.can_damage)
if (other.vsp > 0)
{
    yy = other.bbox_bottom-other.y;
    if (other.yprevious+yy < mid_y())
    {
        other.take_damage += 10;
        other.vsp = -2.5;
    }
}



