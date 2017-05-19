///block_get_entities(x1, y1, x2, y2)
/*
 * Returns a list of all entities on top of this block
 * 
 * x1 - the left offset (should be the block's horizontal movement)
 * y1 - the top offset (should be the block's vertical movement)
 * x2 - the right offset
 * y2 - the bottom offset
 *
 * The offsets should be the block's potentital movement for this step.
 * So if the block is going to move 5 steps horizontally & 2 steps vertically,
 * the script should be used like this: "block_get_entities(5, 2, 5, 2)"
 */
var x1 = bbox_left+argument0;
var y1 = bbox_top+min(-1, argument1);
var x2 = bbox_right+argument2;
var y2 = bbox_bottom+max(1, argument3);
if (semi_solid)
{
    //Stop semi-solid blocks from pushing
    //entities horizontally
    x1 = bbox_left;
    x2 = bbox_right;
}
var list = collision_rectangle_multiple(x1, y1, x2, y2, objEntity, false, true);
//Stop semi-solid blocks from pushing entities
//downwards. So they only affect entities above the block.
if (semi_solid)
{
    for (var i = 0; i < ds_list_size(list); i++)
    {
        var inst = list[|i];
        if (place_meeting(x, y+1, inst))
        {
            ds_list_replace(list, i, noone);
        }
    }
}

//Add all the ledge grabbing entities to list
with (objEntity)
{
    //Only check out the entities which are ledge grabbing
    if (state == state.ledge_grab)
    {
        //Check if the entity is grabbing THIS block
        if (ledge_grab_block == other.id)
        {
            if (ds_list_find_index(list, id) == -1) //don't add if already on the list!
            {
                ds_list_add(list, id);
            }
        }
    }
}

//Return the final list of entities on top or grabbing the block
return list;




