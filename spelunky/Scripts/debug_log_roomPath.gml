//
// debug-log_roomPath()
//
// Logs the roomPath into the debug log for later reference. Created for the Spelunky Community Update Project.
//
file = file_text_open_append("debug\debug.txt");
file_text_write_string(file, "roomPath (" + argument0 + "):");
file_text_writeln(file);
for (j = 0; j < 5; j += 1)
{
    for (i = 0; i < 4; i += 1)
    {
        file_text_write_string(file, string(global.roomPath[i,j]));
    }
    file_text_writeln(file);
}
file_text_close(file);