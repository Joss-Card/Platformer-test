///Explanation of object!

/*
    This is a parent object for all equipped weapons.
    NOT for weapon pickups. For that you want to create
    a objPickup object.
    
    Each weapon has 3 events. Press, Hold & Release.
    These events happen when the attack button is being
    pressed, held or released.
    
    For this parent object, the events are empty... but
    for the children you can put whatever you like in there!
    
    See the example weapons: objBow & objWhip
*/


/* */
///Set variables
press = false;
hold = false;
release = false;
damage = 0; //Damage done by the weapon
pushback = 0; //Speed at which objects are pushed back by the weapon
parent = noone; //The object which is using the weapon
active = false; //Is the weapon currently being used?


/* */
/*  */
