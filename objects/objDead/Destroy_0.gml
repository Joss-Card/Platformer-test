///Explode in to smoke
repeat((sprite_width)*.75)
{
    var xx = irandom_range(bbox_left, bbox_right);
    var yy = irandom_range(bbox_top, bbox_bottom);
    var a = create_effect(xx, yy, sprDust, random_range(0.1, 0.4));
    var dir = point_direction(x, y, a.x, a.y);
    a.speed = random(0.25);
    a.direction = dir+random_range(-30, 30);
    a.image_alpha = random_range(0.4, 1);
    a.depth = -220;
}



