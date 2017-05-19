///Movement & hitting water surface
vspeed += g;

if (cansplash)
if (instance_position(x, y, objLiquid))
{
    var p = instance_nearest(x, y, objLiquidPoint);
    p.vspeed = vspeed*.5;
    instance_destroy();
    with (instance_nearest(x, y, objLiquidPoint))
    {
        other.vspeed = vspeed*.5;
    }
}

if (y > room_height || instance_position(x, y, objSolid))
{
    instance_destroy();
}


