action_inherited();
///Destroy weapons
if (melee_weapon != noone)
{
    with (melee_weapon) instance_destroy();
}
if (ranged_weapon != noone)
{
    with (ranged_weapon) instance_destroy();
}



///Call level death event
with (objLevel) event_user(0);
with (objMultiplayerLevel) event_user(0);



