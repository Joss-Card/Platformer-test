///Set variables
__background_set( e__BG.Index, 0, background1 );


///Create objects
instance_create(0, 0, objTransition);
instance_create(0, 0, objCamera);
//Spawn players!
//get a list of all spawn points, in a random order
var list = instance_list_random(objPlayerSpawnPoint);
//loop through list, creating players at spawn points
var p = 0; //< number of players created
for (var i = 0; i < ds_list_size(list); i++)
{
    //Get the spawn point from the list
    var point = list[|i];
    //Create a player at this point, and set the player number
    with (instance_create(point.x, point.y, objPlayer1))
    {
        player_number = p;
    }
    //Check if we've created the correct amount of players
    if (++p >= global.players)
    {
        break;
    }
}
ds_list_destroy(list);




