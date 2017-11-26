//
// scrRoomGen2()
//
// Room generation for Area 2, the Lush Jungle.
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

if (roomPath == 0 and rand(1,3) <= 2) // side room
{
    if (not oGame.altar and rand(1,12) == 1) n = 10;
    else if (oGame.idol) n = rand(1,8);
    else n = rand(1,9);

    switch(n)
    {
        // upper plats
        case 1: { strTemp = "00000000000010111100000000000000011010000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "111111111111V0000211120000021100000002110000000211112000021111120021111111001111"; break; }
        case 3: { strTemp = "1111111111112V000011112000002111200000001120000000112000021111120021111111001111"; break; }
        case 4: { strTemp = "11120021111100000222120000021100000002220000000211112000022211177T71111111111111"; break; }
        case 5: { strTemp = "1112002111222000001111200000212220000000112000000022200002111117T771111111111111"; break; }
        case 6: { strTemp = "1112002111222000001111200000212220000000112000000022200002111117T771111111111111"; break; }
        // water rooms
        case 7: { strTemp = "000000000011wwwwww1111wwwwww11113wwww311113wwww311113wwww31111133331111111111111"; break; }
        case 8: { strTemp = "00000000000000rr0000000rttr00000rrrrrr0000V0000000000000000000000000000000000000"; break; }
        // idols
        case 9:
        {
            if (global.cemetary) strTemp = "ttttttttttttttttttttttp0S00pttttt0tt0tttP00000000Pttt0tt0tttttp0000ptt1111111111";
            else strTemp = "01000000100000I0000001BBBBBB10110000001111wwwwww1111wwwwww11113wwww3111111111111";
            oGame.idol = true;
            break;
        }
        // altars
        case 10: { strTemp = "220000002200000000000000000000000000000000000000000000x0000002211112201111111111"; oGame.altar = true; break; }
    }
}
else if (roomPath == 0 or roomPath == 1)
{
    switch(rand(1,10))
    {
        // basic rooms
        case 1: { strTemp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "60000600000000000000000000000000000000000000000000000111110000111111001111111111"; break; }
        case 5: { strTemp = "2222222222000000000000000000000000tt000000r0220r0000t0tt0t000rtrttrtr01111111111"; break; }
        case 6: {
            if (rand(1,2) == 1) strTemp = "0L000000001L111111110L222222200L000000000002002000011122111011200002111111111111";
            else strTemp = "00000000L011111111L102222222L000000000L00002002000011122111011200002111111111111";
            break;
        }
        // spikes
        case 7: { strTemp = "1111111111V0000V000000000000000000000000000000000010000000011ssssssss11111111111"; break; }
        // upper plats
        case 8: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        // water
        case 9: { strTemp = "000000000000000000000000000000013wwww310013wwww310113wwww31111133331111111111111"; break; }
        case 10: { strTemp = "0060000000000000000000000000000000000000013wwww310113wwww31111133331111111111111"; break; }
    }
}
else if (roomPath == 3)
{
    switch(rand(1,7))
    {
        // basic rooms
        case 1: { strTemp = "00000000000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        
        // upper plats
        case 4: { strTemp = "00000000000000000000000000000000000000000002222220001111111011111111111111111111"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000221000002211100002211111111111111"; break; }
        // water
        case 6: { strTemp = "000000000000000000000000000000013wwww310013wwww310113wwww31111133331111111111111"; break; }
        case 7: { strTemp = "0000000000006000000000000000000000000000013wwww310113wwww31111133331111111111111"; break; }
    }
}
else if (roomPath == 7) // Lake Bottom
{
    switch(rand(1,8))
    {
        case 1: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 2: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,,,,,,,,,"; break; }
        case 3: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,wwwwww,,wwwwwwwwwwwwwwwwwwww,,,,,,,,,,"; break; }
        case 4: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,v,wwwwwwwwwv,wwwwwww,v,wwwwww,,v,,,,,ww"; break; }
        case 5: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,v,wwwwww,vwwwwwwww,v,ww,,,,,,v,,"; break; }
        case 6: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,wwwwwww,vv,wwwwww,vv,wwwww,,vv,,ww,,,vvvv,,,"; break; }
        case 7: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,,,wwwww,vvvv,www,v,w,vv,ww,wwww,vv,,,,,,,,,,,"; break; }
        case 8: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,,,wwwww,vvvv,www,vv,w,v,w,vv,wwww,w,,,,,,,,,,"; break; }
    }
}
else if (roomPath == 8) // Lake Top
{
    if (global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)] == 2) n = rand(1,5);
    else n = rand(1,8);
    switch(n)
    {
        case 1: { strTemp = "000000000000000000000001111000w,,vvvv,,wwwww,,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 2: { strTemp = "000000000000000000001200000000vvwwwwwwww,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 3: { strTemp = "000000000000000000000000000021wwwwwwwwvvwwwwwwwww,wwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 4: { strTemp = "000000000000000000000000000000wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 5: { strTemp = "000000000000000000000001111000w,,vvvv,,wwww,vv,wwwwwwwvvwwwwwwww,,wwwwwwwwwwwwww"; break; }
        case 6: { strTemp = "000022000000021120000001111000w,,vvvv,,wwww,vv,wwwwwwwvvwwwwwwww,,wwwwwwwwwwwwww"; break; }
        case 7: { strTemp = "600006000000000000000000000000wwwvvvvwwwwwww,,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 8: { strTemp = "000022000000021120000221111220www,,,,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
    }
}
else if (roomPath == 9) // Mega Mouth
{
    strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwJwwwwwwwwwwwwwwwwwwwwwwwwww,,,,,,,,,,";
}
else // drop
{
    if (roomPathAbove != 2) n = rand(1,6);
    else n = rand(1,5);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000000000000000000002200000002111111202111"; break; }
        case 2: { strTemp = "000000000000000000000000000000000000000000000000002200000000112T0000001111202111"; break; }
        case 3: { strTemp = "00000000006000000000000000000000000000000000000000000000000000000000001000000001"; break; }
        case 4: { strTemp = "00000000000000000000000000000000000000000000000000000000000020000222221000111111"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000000000000000022222000021111110001"; break; }
        //
        case 6: { strTemp = "11111111111111111111120000002100000000000000000000022000022021120021121111001111"; break; }
    }
}

strTemp = scrGenerateObstacles(strTemp);

scrGenerateTiles(strTemp);