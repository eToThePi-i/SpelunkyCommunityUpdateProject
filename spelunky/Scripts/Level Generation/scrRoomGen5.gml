//
// scrRoomGen5()
//
// Room generation for the final boss level (which is only partially randomized).
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

/*
Note:

ROOMS are 10x8 tile areas.

strTemp = "0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000";

OBSTACLES are 5x3 tile chunks that are randomized within rooms.
           
strObs = "00000
          00000
          00000";
          
The string representing a room or obstacle must be laid out unbroken:
*/
strTemp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000";

roomPath = global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];
if (y < 480)
{
    switch(rand(1,6))
    {
        case 1: { strTemp = "60000000000000000000000000000000000000000000000000600000000000000000000000000000"; break; }
        case 2: { strTemp = "00000600000000000000000000000000000000000000000000600000000000000000000000000000"; break; }
        case 3: { strTemp = "60000000000000000000000000000000000000000000000000000006000000000000000000000000"; break; }
        case 4: { strTemp = "60000600000000000000000000000000000000000000000000000000000000000000000000000000"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000000600006000000000000000000000000"; break; }
        case 6: { strTemp = "00000000000000000000000000000000600000000000000000000000000000000000000000000000"; break; }
    }
}
else
{
    switch(rand(1,6))
    {
        case 1: { strTemp = "11111111111111111111111111111111111111111111111111111111111111111111111111111111"; break; }
        case 2: { strTemp = "11111111111222111111122211111111111111111111111111111111111111111111111111111111"; break; }
        case 3: { strTemp = "11111111111111111111111111111111122221111112222111111111111111111111111111111111"; break; }
        case 4: { strTemp = "11111111111111112221111111222111111111111111111111111111111111111111111111111111"; break; }
        case 5: { strTemp = "11111111111111111111111111111111111111111111111111122211111112221111111111111111"; break; }
        case 6: { strTemp = "11111111111111111111111111111111111111111111111111111111222111111122211111111111"; break; }
    }
}

strTemp = scrGenerateObstacles(strTemp);

scrGenerateTiles(strTemp);