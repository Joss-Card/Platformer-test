///Draw controls
draw_self();
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
var text = "";
text += "Movement - W,A,S,D#";
text += "Jump - SPACE#";
text += "Shoot - ARROW KEYS#";
text += "Melee - Ctrl#";
text += "Test Mode - T";
draw_text(x, y, string_hash_to_newline(text));


