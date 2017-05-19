action_inherited();
///Fade & destroy over time
image_alpha -= fade;
if (image_alpha < 0)
{
    instance_destroy();
}


