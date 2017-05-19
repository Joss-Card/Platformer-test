///Check for press/hold/release
if (press)
{
    event_user(0);
    press = false;
}
if (hold)
{
    event_user(1);
    hold = false;
}
if (release)
{
    event_user(2);
    release = false;
}



