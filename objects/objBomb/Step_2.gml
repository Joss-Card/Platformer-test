action_inherited();
///Timer
timer--;
if (timer < 0)
{
    instance_destroy();
}
proc_timer--;
if (proc_timer <= 0)
{
    proc = max(proc*0.6, 10);
    proc_timer = proc;
    white = 5; 
}



