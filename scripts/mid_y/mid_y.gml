///mid_y()
///Get the mid-point of an object's bounding box
///argument is optional.
///If no argument given, use the calling object.
var i = id;
if (argument_count > 0)
{
    i = argument[0];
}
return (i.bbox_top+i.bbox_bottom)/2;
