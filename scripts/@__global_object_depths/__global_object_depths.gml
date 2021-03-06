// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // objObject
global.__objectDepths[1] = -200; // objLevel
global.__objectDepths[2] = 0; // objCamera
global.__objectDepths[3] = -200; // objMultiplayerLevel
global.__objectDepths[4] = 0; // objTransition
global.__objectDepths[5] = 0; // objParallaxLayer
global.__objectDepths[6] = -10000; // objGameOver
global.__objectDepths[7] = 0; // objPlayerSpawnPoint
global.__objectDepths[8] = -300; // objHUD
global.__objectDepths[9] = 0; // objPlayer
global.__objectDepths[10] = 0; // objControl
global.__objectDepths[11] = 0; // objEnemy
global.__objectDepths[12] = 0; // objCrab
global.__objectDepths[13] = 0; // objBat
global.__objectDepths[14] = 0; // objPlayer1
global.__objectDepths[15] = 0; // objEntity
global.__objectDepths[16] = 0; // objPot
global.__objectDepths[17] = 0; // objItem
global.__objectDepths[18] = 0; // objBomb
global.__objectDepths[19] = 0; // objBox
global.__objectDepths[20] = 0; // objChest
global.__objectDepths[21] = 0; // objBigChest
global.__objectDepths[22] = 0; // objPickup
global.__objectDepths[23] = 0; // objSlime
global.__objectDepths[24] = 0; // objHealthPotion
global.__objectDepths[25] = 0; // objGold
global.__objectDepths[26] = 0; // objGoldSmall
global.__objectDepths[27] = 0; // objExtraHeart
global.__objectDepths[28] = 0; // objGem
global.__objectDepths[29] = 0; // objGemSmall
global.__objectDepths[30] = 0; // objPiece
global.__objectDepths[31] = 0; // objGoldLarge
global.__objectDepths[32] = 0; // objSlimePiece
global.__objectDepths[33] = 0; // objPieceTrail
global.__objectDepths[34] = 0; // objWeapon
global.__objectDepths[35] = 0; // objDead
global.__objectDepths[36] = 0; // objWhip
global.__objectDepths[37] = 0; // objBow
global.__objectDepths[38] = 0; // objBigChestOpen
global.__objectDepths[39] = -220; // objHitBox
global.__objectDepths[40] = 0; // objArrowStuck
global.__objectDepths[41] = 0; // objAxe
global.__objectDepths[42] = -10; // objEffect
global.__objectDepths[43] = 0; // objShake
global.__objectDepths[44] = 0; // objExplosion
global.__objectDepths[45] = 0; // objTitle
global.__objectDepths[46] = 0; // objControls
global.__objectDepths[47] = 0; // objPlayButton
global.__objectDepths[48] = 0; // objButton
global.__objectDepths[49] = 0; // obj2PlayerButton
global.__objectDepths[50] = 0; // objMultiButton
global.__objectDepths[51] = 0; // objBackButton
global.__objectDepths[52] = 0; // obj3PlayerButton
global.__objectDepths[53] = 0; // objArrowTrail
global.__objectDepths[54] = 0; // objBlock
global.__objectDepths[55] = 0; // objSolid
global.__objectDepths[56] = 0; // objDirtSlopeLeft
global.__objectDepths[57] = 0; // obj4PlayerButton
global.__objectDepths[58] = 0; // objIceBlock
global.__objectDepths[59] = 0; // objMudBlock
global.__objectDepths[60] = 0; // objBricksBlock
global.__objectDepths[61] = 0; // objLift
global.__objectDepths[62] = 0; // objStoneBlock
global.__objectDepths[63] = 0; // objDirtSlopeRight
global.__objectDepths[64] = 0; // objBigBlock
global.__objectDepths[65] = 0; // objCircularPlatform
global.__objectDepths[66] = 0; // objDirtBlock
global.__objectDepths[67] = 0; // objPushBlock
global.__objectDepths[68] = 0; // objSemiSolid
global.__objectDepths[69] = 0; // objCrushingBlock
global.__objectDepths[70] = 0; // objFallingBlock
global.__objectDepths[71] = 0; // objMovingPlatform
global.__objectDepths[72] = 0; // objSpringRight
global.__objectDepths[73] = 0; // objSpringLeft
global.__objectDepths[74] = 0; // objSpringUp
global.__objectDepths[75] = 0; // objPlatform
global.__objectDepths[76] = -100; // objSlowmoZone
global.__objectDepths[77] = 0; // objZone
global.__objectDepths[78] = -100; // objFastZone
global.__objectDepths[79] = 0; // objLiquid
global.__objectDepths[80] = -100; // objWater
global.__objectDepths[81] = 0; // objSpikes
global.__objectDepths[82] = 20; // objLadder
global.__objectDepths[83] = 0; // objPlatformReverse
global.__objectDepths[84] = 20; // objLadderTop
global.__objectDepths[85] = -100; // objLiquidPoint
global.__objectDepths[86] = -100; // objSuperJumpZone
global.__objectDepths[87] = 0; // objLiquidDrop
global.__objectDepths[88] = 0; // objProjectile
global.__objectDepths[89] = 0; // objArrow


global.__objectNames[0] = "objObject";
global.__objectNames[1] = "objLevel";
global.__objectNames[2] = "objCamera";
global.__objectNames[3] = "objMultiplayerLevel";
global.__objectNames[4] = "objTransition";
global.__objectNames[5] = "objParallaxLayer";
global.__objectNames[6] = "objGameOver";
global.__objectNames[7] = "objPlayerSpawnPoint";
global.__objectNames[8] = "objHUD";
global.__objectNames[9] = "objPlayer";
global.__objectNames[10] = "objControl";
global.__objectNames[11] = "objEnemy";
global.__objectNames[12] = "objCrab";
global.__objectNames[13] = "objBat";
global.__objectNames[14] = "objPlayer1";
global.__objectNames[15] = "objEntity";
global.__objectNames[16] = "objPot";
global.__objectNames[17] = "objItem";
global.__objectNames[18] = "objBomb";
global.__objectNames[19] = "objBox";
global.__objectNames[20] = "objChest";
global.__objectNames[21] = "objBigChest";
global.__objectNames[22] = "objPickup";
global.__objectNames[23] = "objSlime";
global.__objectNames[24] = "objHealthPotion";
global.__objectNames[25] = "objGold";
global.__objectNames[26] = "objGoldSmall";
global.__objectNames[27] = "objExtraHeart";
global.__objectNames[28] = "objGem";
global.__objectNames[29] = "objGemSmall";
global.__objectNames[30] = "objPiece";
global.__objectNames[31] = "objGoldLarge";
global.__objectNames[32] = "objSlimePiece";
global.__objectNames[33] = "objPieceTrail";
global.__objectNames[34] = "objWeapon";
global.__objectNames[35] = "objDead";
global.__objectNames[36] = "objWhip";
global.__objectNames[37] = "objBow";
global.__objectNames[38] = "objBigChestOpen";
global.__objectNames[39] = "objHitBox";
global.__objectNames[40] = "objArrowStuck";
global.__objectNames[41] = "objAxe";
global.__objectNames[42] = "objEffect";
global.__objectNames[43] = "objShake";
global.__objectNames[44] = "objExplosion";
global.__objectNames[45] = "objTitle";
global.__objectNames[46] = "objControls";
global.__objectNames[47] = "objPlayButton";
global.__objectNames[48] = "objButton";
global.__objectNames[49] = "obj2PlayerButton";
global.__objectNames[50] = "objMultiButton";
global.__objectNames[51] = "objBackButton";
global.__objectNames[52] = "obj3PlayerButton";
global.__objectNames[53] = "objArrowTrail";
global.__objectNames[54] = "objBlock";
global.__objectNames[55] = "objSolid";
global.__objectNames[56] = "objDirtSlopeLeft";
global.__objectNames[57] = "obj4PlayerButton";
global.__objectNames[58] = "objIceBlock";
global.__objectNames[59] = "objMudBlock";
global.__objectNames[60] = "objBricksBlock";
global.__objectNames[61] = "objLift";
global.__objectNames[62] = "objStoneBlock";
global.__objectNames[63] = "objDirtSlopeRight";
global.__objectNames[64] = "objBigBlock";
global.__objectNames[65] = "objCircularPlatform";
global.__objectNames[66] = "objDirtBlock";
global.__objectNames[67] = "objPushBlock";
global.__objectNames[68] = "objSemiSolid";
global.__objectNames[69] = "objCrushingBlock";
global.__objectNames[70] = "objFallingBlock";
global.__objectNames[71] = "objMovingPlatform";
global.__objectNames[72] = "objSpringRight";
global.__objectNames[73] = "objSpringLeft";
global.__objectNames[74] = "objSpringUp";
global.__objectNames[75] = "objPlatform";
global.__objectNames[76] = "objSlowmoZone";
global.__objectNames[77] = "objZone";
global.__objectNames[78] = "objFastZone";
global.__objectNames[79] = "objLiquid";
global.__objectNames[80] = "objWater";
global.__objectNames[81] = "objSpikes";
global.__objectNames[82] = "objLadder";
global.__objectNames[83] = "objPlatformReverse";
global.__objectNames[84] = "objLadderTop";
global.__objectNames[85] = "objLiquidPoint";
global.__objectNames[86] = "objSuperJumpZone";
global.__objectNames[87] = "objLiquidDrop";
global.__objectNames[88] = "objProjectile";
global.__objectNames[89] = "objArrow";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for