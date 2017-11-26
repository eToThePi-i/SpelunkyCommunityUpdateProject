//
// scrRoomGen3()
//
// Room generation for Area 3, the Ice Caves.
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

if (roomPath == 0 and rand(1,2) == 1) // side room
{
    if (not oGame.altar and rand(1,12) == 1)
    {
        n = 10;
        oGame.altar = true;
    }
    else if (oGame.idol)
    {
        n = rand(1,8);
    }
    else
    {
        n = rand(1,9);
        if (n == 9) oGame.idol = true;
    }

    switch(n)
    {
        // empty
        case 1: { strTemp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000"; break; }
        // steps
        case 2: { strTemp = "10000000001000000000111000000022201100000000220100000000010000000001110000000222"; break; }
        case 3: { strTemp = "00000000010000000001000000011100001102220010220000001000000011100000002220000000"; break; }
        // treasure tower
        case 4: { strTemp = "000000000000021120000001111000000111100000f1111f000002222000f00000000f0000000000"; break; }
        case 5: { strTemp = "0000000000000000000000220022000011ff11000011001200202100120220210012020002002000"; break; }
        case 6: { strTemp = "0jiiiiiij00jij00jij0jjii0jiij0000000jij0jjiij0iij00jiij0jijj0jiij000000jjiiiiijj"; break; }
        case 7: { strTemp = "0jiiiiiij00jij00jij00jii0jiijj0jij0000000jij0jiijj0jij0jiij000000jiij00jjiiiiijj"; break; }
        case 8: { strTemp = "011iiii110000jjjj0000000ii00000000jj00000000ii00000000jj00000000ii00000002222000"; break; }
        // idol
        case 9: { strTemp = "00000000000000I000000000cc00000000000000000000000000000000000000ss00000000110000"; break; }
        // altars
        case 10: { strTemp = "000000000000000000000000000000000000000000000000000000x0000002211112201111111111"; break; }
    }
}
else if ((roomPath == 0 or roomPath == 1 or roomPath == 2) and (rand(1,10) < 10))
{
    switch(rand(1,9))
    {
        // basic rooms
        case 1: { strTemp = "00000000000000000000000000000000006000000000000000000000000000021111120000222220"; break; }
        case 2: { strTemp = "00000000000000000000000000000060000000000000000000000000000021111120000222220000"; break; }
        case 3: { strTemp = "11111200001111112000111111200000002120001120000000112021200000001120001111120000"; break; }
        case 4: { strTemp = "00002111110002111111000211111100021200000000000211000212021100021100000000211111"; break; }
        case 5: { strTemp = "000000000000000000jj00f2100iii00021000000002111iii000021111100000222220000000000"; break; }
        // falling platforms
        case 6: { strTemp = "00000000000000000000000000000000000000000000000000F00F00F00000000000000000000000"; break; }
        // icy
        case 7: { strTemp = "00000000000000000000000000000000000000000iiiiiiii00021ii120000022220000000000000"; break; }
        case 8: { strTemp = "000000000000000000000iiiiiiii00021ii12000002222000000000000000000000000000000000"; break; }
        case 9: { strTemp = "0011111100000222200000000000000000000000jjjjjjjjjjiiiiiiiiii00000000001111111111"; break; }
    }
}
else if (roomPath == 6) // Moai
{
    switch(rand(1,2))
    {
        case 1: { strTemp = "000000000000000M000000000000000000000000021110002002111___2000111111000000000000"; break; }
        case 2: { strTemp = "000000000000M000000000000000000000000000020001112002___1112000111111000000000000"; break; }
    }
}
else if (roomPath == 7) strTemp = "0000000000000DAAAAAA0iiiE0E0E00iG00000000C00000000000000000000BBBBBBBB0000000000";
else if (roomPath == 8) strTemp = "0000000000AAAAAAAAAAE0E0E0E0E0000000000000000000000000000000BBBBBBBBBB0000000000";
else if (roomPath == 9) strTemp = "0000022221AAAAAAAAA1E0E0Ee2211000000X01100000000$1000022ii11BBB:::::::0000222221";
else strTemp = "00000000000000000000000000000000005000000000000000000000000000021111120000222220";

strTemp = scrGenerateObstacles(strTemp);

scrGenerateTiles(strTemp);