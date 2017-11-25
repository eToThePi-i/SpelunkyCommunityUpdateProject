//
// scrRoomGenYeti()
//
// Room generation for the Yeti Cave that appears randomly in Area 3: Ice.
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
roomPathAbove = -1;
if (scrGetRoomY(y) != 0) roomPathAbove = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)];

if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY) // start room
{
    if (roomPath == 2) n = rand(3,4);
    else n = rand(1,2);
    switch(n)
    {
        case 1: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
        // hole
        case 3: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000002021111120"; break; }
        case 4: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000002021111120"; break; }
    }
}
else if (scrGetRoomX(x) == global.endRoomX and scrGetRoomY(y) == global.endRoomY) // end room
{
    if (roomPathAbove == 2) n = rand(1,4);
    else n = rand(3,6);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000006000060000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000010021110001001111000110111129012000000111111111021111111201111111111"; break; }
        case 4: { strTemp = "00000000000111200100011110010021111011000000002109011111111102111111121111111111"; break; }
        // no drop
        case 5: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 6: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
    }
}
else if (roomPath == 0 and rand(1,4) < 4) // side room
{
    if (oGame.idol or scrGetRoomY(y) == 3)
        n = rand(1,2);
    else
    {
        n = 1;
        if (n == 10) oGame.idol = true;
        // else n = rand(1,9);
    }

    switch(n)
    {
        // upper plats
        case 1: { strTemp = "00000000000010111100000000000000011010000050000000000000000000000000001111111111"; break; }
        // high walls
        case 2: { strTemp = "000000000011cccccc11120000002112002200211200000021120022002111ssssss111111111111"; break; }
        // idols
        // case 10: { strTemp = "22000000220000B0000000000000000000000000000000000000000000000000I000001111A01111"; break; }
    }
}
else if (roomPath == 0 or roomPath == 1) // main room
{
    if (not instance_exists(oYetiKing))
    {
        n = rand(1,10)
        if (y > 384) n = 10;
        else if (y > 256 and rand(1,2) == 1) n = 10;
        else if (y > 128 and rand(1,3) == 1) n = 10;
    }
    else n = rand(1,9);

    switch(n)
    {
        // basic rooms
        case 1: { strTemp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000000050000000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "60000600000000000000000600000000000000000000000000000222220000111111001111111111"; break; }
        case 5: { strTemp = "11111111112222222222000000000000000000000050000000000000000000000000001111111111"; break; }
        case 6: { strTemp = "11111111112111111112022222222000000000000050000000000000000000000000001111111111"; break; }
        // low ceiling
        case 7: { strTemp = "11111111112111111112211111111221111111120111111110022222222000000000001111111111"; break; }
        // thin ice
        case 8: { strTemp = "6000060000000000000000000000000000000000000000000000000000000000000000cccccccccc"; break; }
        case 9: { strTemp = "6000060000000000000000000000000000000000000000000001cccccc1021ssssss121111111111"; break; }
        // yeti king
        case 10: { strTemp = "iiiiiiiiiijiiiiiiiij0jjjjjjjj0000000000000000000000000Y0000000yy00yy001111111111"; break; }
    }
}
else if (roomPath == 3) // main room
{
    switch(rand(1,9))
    {
    
        // basic rooms
        case 1: { strTemp = "00000000000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "00000000000000000000000600000000000000000000000000000111110000111111001111111111"; break; }
        // upper plats
        case 5: { strTemp = "00000000000111111110001111110000000000005000050000000000000000000000001111111111"; break; }
        case 6: { strTemp = "00000000000000000000000000000000000000000021111200021111112021111111121111111111"; break; }
        case 7: { strTemp = "10000000011112002111111200211100000000000022222000111111111111111111111111111111"; break; }
        // thin ice
        case 8: { strTemp = "000000000000000000000000000000000000000000000000000000000000ssssssssss1111111111"; break; }
        case 9: { strTemp = "100000000111110011111111cc111111200002110000000000000000000011100001111111cc1111"; break; }
    }
}
else if (roomPath == 8) // snake pit
{
    strTemp = "111000011111s0000s11111200211111s0000s11111200211111s0000s11111200211111s0000s11";
}
else if (roomPath == 9) // snake pit bottom
{
    strTemp = "111000011111s0000s1111100001111100~0001111~0110~11111~RR~11111111111111111111111";    
}
else // drop
{
    if (roomPath == 7) n = rand(4,12);
    else if (roomPathAbove != 2) n = rand(1,12);
    else n = rand(1,8);
    switch(n)
    {
        case 1: { strTemp = "00000000006000060000000000000000000000006000060000000000000000000000000000000000"; break; }
        case 2: { strTemp = "00000000006000060000000000000000000000000000050000000000000000000000001202111111"; break; }
        case 3: { strTemp = "00000000006000060000000000000000000000050000000000000000000000000000001111112021"; break; }
        case 4: { strTemp = "00000000006000060000000000000000000000000000000000000000000002200002201112002111"; break; }
        case 5: { strTemp = "00000000000000220000000000000000200002000112002110011100111012000000211111001111"; break; }
        case 6: { strTemp = "00000000000060000000000000000000000000000000000000001112220002100000001110111111"; break; }
        case 7: { strTemp = "00000000000060000000000000000000000000000000000000002221110000000001201111110111"; break; }
        case 8: { strTemp = "00000000000060000000000000000000000000000000000000002022020000100001001111001111"; break; }
        case 9: { strTemp = "11111111112222222222000000000000000000000000000000000000000000000000001120000211"; break; }
        case 10: { strTemp = "11111111112222111111000002211100000002110000000000200000000000000000211120000211"; break; }
        case 11: { strTemp = "11111111111111112222111220000011200000000000000000000000000012000000001120000211"; break; }
        case 12: { strTemp = "11111111112111111112021111112000211112000002112000000022000002200002201111001111"; break; }
    }
}

strTemp = scrGenerateObstacles(strTemp);

scrGenerateTiles(strTemp);