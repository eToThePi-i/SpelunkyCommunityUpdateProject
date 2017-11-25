//
// scrRoomGenMarket()
//
// Room generation for the Black Market, which is accessible from Area 2: Lush.
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
    if (roomPathAbove == 2) n = rand(1,2);
    else n = rand(3,4);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000006000060000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 4: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
    }
}
else if (roomPath == 1)
{
    switch(rand(1,8))
    {
        // basic rooms
        case 1: { strTemp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "60000600000000000000000000000000000000000000000000000111110000111111001111111111"; break; }
        // spikes
        case 5: { strTemp = "1111111111V0000V000000000000000000000000000000000010000000011ssssssss11111111111"; break; }
        // upper plats
        case 6: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        // water
        case 7: { strTemp = "000000000000000000000000000000013wwww310013wwww310113wwww31111133331111111111111"; break; }
        case 8: { strTemp = "0060000000000000000000000000000000000000013wwww310113wwww31111133331111111111111"; break; }
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
else if (roomPath == 4 and x == 496) // shop
{
    strTemp = "0000000011.....b0alK......bbbb..........1111111111111111111111111111111111111111";
    shopType = "Ankh";
}
else if (roomPath == 4) // shop
{
    strTemp = "........................22......2l00l2..0.000000.00k000000k0000????K00bbbbbbbbbb";
    
    shopType = "";
    
    n = rand(1,5);
    m = n;
    
    while (shopType == "")
    {
        if (n == 1) { if (not oGame.genSupplyShop) { shopType = "General"; oGame.genSupplyShop = true; } }
        else if (n == 2) { if (not oGame.genBombShop) { shopType = "Bomb"; oGame.genBombShop = true; } }
        else if (n == 3) { if (not oGame.genWeaponShop) { shopType = "Weapon"; oGame.genWeaponShop = true; } }
        else if (n == 4) { if (not oGame.genRareShop) { shopType = "Rare"; oGame.genRareShop = true; } }
        else if (n == 5) { if (not oGame.genClothingShop) { shopType = "Clothing"; oGame.genClothingShop = true; } }
        n += 1;
        if (n > 5) n = 1;
        if (n == m)
        {
            shopType = "General";
            break;
        }
    }
}
else if (roomPath == 5) // casino
{
    strTemp = "111111111111111111111111221111112000lK1101W0Q00b..0k00000+0.00000uu+q.bbbbbbbbbb";
    shopType = "Craps";
}
else // drop
{
    if (roomPathAbove != 2) n = rand(1,6);
    else n = rand(1,5);
    switch(n)
    {
        case 1: { strTemp = "00H000000000=111100000H222200000H000000000H000000000H000002200000002111111202111"; break; }
        case 2: { strTemp = "0000000H000001111=000002222H000000000H000000000H002200000H00112T0000001111202111"; break; }
        case 3: { strTemp = "00000000H060000011=000000000H000000000H0H0000000H0=1122000H0H0000000H011100001=1"; break; }
        case 4: { strTemp = "0000000H000001111=000002222H000000000H000000000H00000000000020000222221000111111"; break; }
        case 5: { strTemp = "00H000000000=111100000H222200000H000000000H0000000000000000022222000021111110001"; break; }
        //
        case 6: { strTemp = "11111111111111111111120000002120000000020000000000022000022021120021121111001111"; break; }
    }
}

// Add obstacles

for (i = 1; i < 81; i += 1)
{
    j = i;
  
    strObs1 = "00000";
    strObs2 = "00000";
    strObs3 = "00000";
    strObs4 = "00000";
    tile = string_char_at(strTemp, i);
    
    if (tile == "8")
    {
        strObs1 = "00900"; strObs2 = "01110"; strObs3 = "11111";
    }
    else if (tile == "5") // ground
    {
        if (rand(1,8) == 1) n = rand(100,102);
        else n = rand(1,2);
        switch(n)
        {
            case 1: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "22222"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "22222"; strObs3 = "11111"; break; }
            case 100: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "0T022"; break; }
            case 101: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "20T02"; break; }
            case 102: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "220T0"; break; }
        }
    }
    else if (tile == "6") // air
    {
        n = rand(1,4);
        switch(n)
        {
            case 1: { strObs1 = "11112"; strObs2 = "22220"; strObs3 = "00000"; break; }
            case 2: { strObs1 = "21111"; strObs2 = "02222"; strObs3 = "00000"; break; }
            case 3: { strObs1 = "22222"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 4: { strObs1 = "11111"; strObs2 = "21112"; strObs3 = "02120"; break; }
        }
    }
    else if (tile == "V") // vines
    {
        n = rand(1,3);
        switch(n)
        {
            case 1: { strObs1 = "L0L0L"; strObs2 = "L0L0L"; strObs3 = "L000L"; strObs4 = "L0000"; break; }
            case 2: { strObs1 = "L0L0L"; strObs2 = "L0L0L"; strObs3 = "L000L"; strObs4 = "0000L"; break; }
            case 3: { strObs1 = "0L0L0"; strObs2 = "0L0L0"; strObs3 = "0L0L0"; strObs4 = "000L0"; break; }
        }
    }
    
    if (tile == "5" or tile == "6" or tile == "8" or tile == "V")
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
    if (tile == "V")
    {
        j += 10;
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs4, strTemp, j);
    }
}

scrGenerateTiles(strTemp);