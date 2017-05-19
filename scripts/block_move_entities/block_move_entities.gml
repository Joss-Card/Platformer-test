///block_move_entities()
/*
 * Loops through the block's on_top list & stuck list
 * moving each entity along with the block
 */
var xadd = x-xprevious; //how far the block has moved this step
var yadd = y-yprevious;
var entity_collide = false; //collided with entity?

//Loop through the block's on_top list & attempt to
//move each entity. If the entity cannot be moved because
//there's another block in the way, the entity will be crushed!
//(unless this is a semi-solid platform)
var size = ds_list_size(on_top);
for (var i = 0; i < size; i++)
{
    var inst = on_top[|i]; //get the current instance
    if (inst != noone) //ignore it if the instance is noone
    {
        with (inst)
        {
            //Attempt to move the entity in
            //both the x & y direction 
            if (!place_meeting(x+xadd, y+yadd, objSolid))
            {
                x += xadd;
                y += yadd;
            }
            else
            //If the entity cannot be moved
            //in both directions, try just moving
            //it in the x direction
            if (!place_meeting(x+xadd, y, objSolid))
            {
                x += xadd;
                ledge_grab = false;
            }
            else
            //If the entity can't be moved in
            //the x direction, try the y direction
            if (!place_meeting(x, y+yadd, objSolid))
            {
                y += yadd;
                ledge_grab = false;
            }
            else
            //If the entity can't be moved in
            //either direction, then it must
            //be crushed!
            //Unless this is a semi-solid platform
            //If this block cannot crush entities,
            //then move it back to its previous position.
            if (!other.semi_solid)
            if (place_meeting(x, y, objSolid))
            {
                //If can crush, destroy the entity
                if (other.can_crush)
                {
                    //Create a "universal" hit effect
                    create_effect(mid_x(), mid_y(), sprHitEffect, 0.5);
                    instance_destroy();
                }
                else
                //If can't crush, set entity_collide
                //to true
                {
                    entity_collide = true;
                    ledge_grab = false;
                }
            }
        }
    }
}

//Move back to previous position if collided with entity
if (entity_collide)
{
    x = xprevious;
    y = yprevious;
}
else
//Move all of the stuck objects with the block
//only move them if not entity_collide
{
    var size = ds_list_size(stuck);
    for (var i = 0; i < size; i++)
    {
        var inst = stuck[|i];
        var move_inst = true;
        //Loop through the on_top list to make sure the
        //instance is not a part of both lists.
        //If the instance is in the on_top list then
        //it will already have been moved.
        var j = ds_list_find_index(on_top, inst);
        if (j != -1)
        {
            //Don't move the instance if it's
            //part of the on_top list
            move_inst = false; 
        }
        if (move_inst)
        {
            with (inst)
            {
                x += xadd;
                y += yadd;
            }
        }
    }
}


