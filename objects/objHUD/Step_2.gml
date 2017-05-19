///Set variables
var old_gold = gold;
var old_hp = hp;
if (gold_flash > 0)
{
    gold_flash--;
}
if (hp_flash > 0)
{
    hp_flash--;
}

///Update values to display on the HUD
if (target != noone)
{
    if (instance_exists(target))
    {
        hp = target.hp;
        max_hp = target.max_hp;
        gold = target.gold;
    }
    else
    {
        hp = 0; //The target is dead!
        target = noone;
    }
}

///If hp value has decreased, flash the health bar!
if (old_hp != hp)
{
    hp_flash += 4;
}

///If the gold value has increased,
///increase the scale depending on the increase amount
if (old_gold < gold)
{
    gold_scale = min(2, gold_scale+min(0.25, (gold-old_gold)/20));
    gold_flash += 2;
}

///Slowly reduce gold scale back to 1
var k = 0.1;
gold_scale = smooth_approach(gold_scale, gold_scale_target, k);

///Update fps
fps_timer--;
if (fps_timer < 0)
{
    fps_round = round(fps_real);
    fps_timer = 2;
}


