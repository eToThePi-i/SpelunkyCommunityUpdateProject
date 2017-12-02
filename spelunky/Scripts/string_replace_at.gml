//
// string_replace_at(str, newstr, index)
//
// Replaces part of str with newstr at the given index. Created for the Spelunky Community Update Project.
//
str = string_delete(argument0, argument2, string_length(argument1));
return string_insert(argument1, str, argument2);