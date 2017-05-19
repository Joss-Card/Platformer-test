///Set variables
__background_set( e__BG.Index, 0, background1 );


///Create objects
instance_create(0, 0, objTransition);
var h = instance_create(0, 0, objHUD);
var c = instance_create(0, 0, objCamera);
if (instance_exists(objPlayerSpawnPoint))
{
    var p1 = instance_create(objPlayerSpawnPoint.x, objPlayerSpawnPoint.y, objPlayer1);
    h.target = p1;
    c.target = p1;
}





