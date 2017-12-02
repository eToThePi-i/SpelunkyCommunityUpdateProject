//
// scrReflectLevel()
//
// Reflects a level across the x-axis. Created for the Spelunky Community Update Project.
//
strTemp = argument0;

for (i = 1; i <= string_length(strTemp); i += 10)
{
    temp = string_copy(strTemp, i, 10);
    strTemp = string_replace_at(strTemp, reverse_string(temp), i);
}

return strTemp;