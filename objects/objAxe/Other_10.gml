///Press Event
if (!attacking)
{
    attacking = true;
    attack = 0;
    facing = parent.facing;
    parent.can_move = false;
    active = true; //Set to active so that other weapons cannot be
                   //used at the same time
}



