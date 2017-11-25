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

// Add obstacles

for (i = 1; i < 81; i += 1)
{
    j = i;
  
    strObs1 = "00000";
    strObs2 = "00000";
    strObs3 = "00000";
    tile = string_char_at(strTemp, i);
    
    if (tile == "8")
    {
        strObs1 = "00900"; strObs2 = "21112"; strObs3 = "21112";
    }
    else if (tile == "5") // ground
    {
        switch(rand(1,8))
        {
            case 1: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "21112"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "02020"; strObs3 = "21212"; break; }
            case 3: { strObs1 = "11100"; strObs2 = "11110"; strObs3 = "11111"; break; }
            case 4: { strObs1 = "00111"; strObs2 = "01111"; strObs3 = "11111"; break; }
            case 5: { strObs1 = "21112"; strObs2 = "22222"; strObs3 = "00000"; break; }
            case 6: { strObs1 = "00022"; strObs2 = "00011"; strObs3 = "00011"; break; }
            case 7: { strObs1 = "22000"; strObs2 = "11000"; strObs3 = "11000"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "00000"; break; }
        }
    }
    else if (tile == "6") // air
    {
        switch(rand(1,8))
        {
            case 1: { strObs1 = "0$$$0"; strObs2 = "21112"; strObs3 = "02220"; break; }
            case 2: { strObs1 = "0000$"; strObs2 = "0$$$1"; strObs3 = "21111"; break; }
            case 3: { strObs1 = "$0000"; strObs2 = "1$$$0"; strObs3 = "11112"; break; }
            case 4: { strObs1 = "1$$00"; strObs2 = "11112"; strObs3 = "12200"; break; }
            case 5: { strObs1 = "0$$$1"; strObs2 = "21111"; strObs3 = "00221"; break; }
            case 6: { strObs1 = "21112"; strObs2 = "$$$$$"; strObs3 = "11111"; break; }
        }
    }
    
    if (tile == "5" or tile == "6" or tile == "8")
    {
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs1, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs2, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs3, strTemp, j);
    }
}

scrGenerateTiles(strTemp);