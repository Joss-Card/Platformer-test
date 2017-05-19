///screen_shake(amount, intensity, delay)
/*
 * amount    - the number of "shakes"
 * intensity - the movement in pixels of the view
 * delay     - the delay (in steps) between each shake
 */
var a = argument0;
var i = argument1;
var d = argument2;
with (instance_create(0, 0, objShake))
{
    amount = a;
    intensity = i;
    delay_max = d;
}


