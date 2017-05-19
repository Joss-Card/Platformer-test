///Hooke's law   a = -(k/m)x - dv
var X = y-ystart; //distance from start point
var acc = -(parent.constant*X)-(parent.dampening*vspeed);
vspeed += acc;

/*var base_acc = 0.25;
var acc = 0;
if (y > ystart) acc = -base_acc;
if (y < ystart) acc = base_acc;
vspeed += acc;
var X = abs(y-ystart);
if (X < 0.5 && abs(vspeed) < 1)
{
    vspeed = 0;
    y = ystart;
}



/* */
/*  */
