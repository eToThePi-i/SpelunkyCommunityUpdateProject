//
// reverse_string()
//
// Reverses the character order in a string. Created for the Spelunky Community Update Project.
//
str = "";
for (i = string_length(argument0); i >= 1; i -= 1) str += string_char_at(argument0,i);
return str;