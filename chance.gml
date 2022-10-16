///chance(%success)
//Rolls a 100 sided die, returns true if the roll is less than the given percentage.
//chance(5) would return true for any value less than or equal to 5.
var _roll = irandom(99)+1;
//show_debug_message("Chance: "+string(argument[0])+"  Roll: "+string(_roll));
return(_roll<=argument[0]);
    
