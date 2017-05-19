///destroy_block(block)
///but only if it's destroyable!
/*
 * Destroy a block, create particles & pieces
 * destroy all objects which are connected to the block
 * like arrows & spikes for example.
 */
var block = argument0;

///Check if the given block is destructable
if (block.breakable)
{
    ///Destroy the block
    with (block) instance_destroy();
}
