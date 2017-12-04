//
// debug-log()
//
// Logs information into the debug log for later reference. Created for the Spelunky Community Update Project.
//
file = file_text_open_append("debug\debug.txt");
file_text_write_string(file, argument0);
file_text_writeln(file);
file_text_close(file);