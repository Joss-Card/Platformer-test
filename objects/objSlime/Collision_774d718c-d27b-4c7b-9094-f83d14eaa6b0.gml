///Damage target entity
if (other.id == target)
{
    other.take_damage += damage;
    var dir = point_direction(mid_x(), mid_y(), mid_x(other), mid_y(other));
    with (other)
    {
        add_speed(other.knockback, dir);
        vsp -= 1;
    }
    add_speed(-knockback, dir);
}


