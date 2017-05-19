///Check if charging
if (sprite_index == sprCrushingBlock)
{
    sprite_index = sprCrushingBlockCharged;
}
else
if (sprite_index == sprCrushingBlockEnd)
{
    sprite_index = sprCrushingBlock;
    image_speed = 0;
    image_index = 0;
}


