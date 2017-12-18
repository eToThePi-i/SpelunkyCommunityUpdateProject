//
// scrLevelGen()
//
// Sets the "room path" that Spelunky uses to determine the no-bombs/no-rope (in theory)
// route to the exit.
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

for (y = 0; y < 5; y += 1)
{
    for (x = 0; x < 4; x += 1)
    {
        global.roomPath[x,y] = 0;
    }
}

global.sacrificePit = false;
global.snakePit = false;
global.alienCraft = false;
global.yetiLair = false;
global.blackMarket = false;

if (global.levelType == 1 and not global.madeBlackMarket and global.genBlackMarket)
{
    global.blackMarket = true;
    global.madeBlackMarket = true;
    global.startRoomX = 0;
    global.startRoomY = 0;
    global.endRoomX = 3;
    global.endRoomY = 3;
    global.roomPath[0, 0] = 2;
    global.roomPath[0, 1] = 2;
    global.roomPath[0, 2] = 2;
    global.roomPath[0, 3] = 3;
    global.roomPath[1, 0] = 4;
    global.roomPath[1, 1] = 4;
    global.roomPath[1, 2] = 4;
    global.roomPath[1, 3] = 1;
    global.roomPath[2, 0] = 4;
    global.roomPath[2, 1] = 4;
    global.roomPath[2, 2] = 5;
    global.roomPath[2, 3] = 1;
    global.roomPath[3, 0] = 2;
    global.roomPath[3, 1] = 2;
    global.roomPath[3, 2] = 4;
    global.roomPath[3, 3] = 3;
    return 0;
}

global.startRoomX = rand(0,3);
global.startRoomY = 0;
roomX = global.startRoomX;
roomY = 0;
global.roomPath[roomX, roomY] = 1;

for (roomY = 0; roomY < 4; roomY += 1)
{
    switch (roomX)
    {
        case 0: case 3:
        {
            n = rand(1,27);
            if (n <= 9) dropX = roomX;
            else if (n <= 15) dropX = abs(1 - roomX);
            else if (n <= 19) dropX = abs(2 - roomX);
            else dropX = 3 - roomX;
            break;
        }
        case 1: case 2:
        {
            n = rand(1,15);
            if (n <= 6) dropX = (roomX - 1) * 3;
            else if (n <= 9) dropX = roomX;
            else if (n <= 11) dropX = 3 - roomX;
            else dropX = (roomX - 2) * -3;
        }
    }
    if (roomX != dropX)
    {
        if (roomX > dropX)
        {
            for (x = roomX - 1; x > dropX; x -= 1) global.roomPath[x,roomY] = 1;
        }
        else
        {
            for (x = roomX + 1; x < dropX; x += 1) global.roomPath[x,roomY] = 1;
        }
    }
    roomX = dropX;
    if (roomY < 3)
    {
        global.roomPath[roomX, roomY] = 2;
        global.roomPath[roomX, roomY+1] = 3;
    }
    else
    {
        global.endRoomX = roomX;
        global.endRoomY = roomY;
    }
}

// City of Gold
if (global.cityOfGold) global.roomPath[rand(0,3), 2] = 6;

if (global.levelType == 0)
{
    len = 0;
    for (x = 0; x < 4; x += 1)
    {
        if (global.roomPath[x,1] == 0 and global.roomPath[x,2] == 0 and (global.roomPath[x,0] or global.roomPath[x,3]))
        {
            snakePitX[len] = x;
            len += 1;
        }
    }
    if (len > 0)
    {
        n = rand(1,global.probSnakePit);
        if (n <= len - 1)
        {
            n = snakePitX[n];
            if (global.roomPath[n,0] == 0)
            {
                global.roomPath[n,0] = 7;
                global.roomPath[n,1] = 8;
            }
            else global.roomPath[n,1] = 8;
            
            if (global.roomPath[n,3] == 0) 
            {
                global.roomPath[n,2] = 8;
                global.roomPath[n,3] = 9;
            }
            else global.roomPath[n,2] = 9;
            
            global.snakePit = true;
        }
    }
}
else if (global.lake)
{
    global.roomPath[0,3] = 8;
    global.roomPath[1,3] = 8;
    global.roomPath[2,3] = 8;
    global.roomPath[3,3] = 8;
    global.roomPath[0,4] = 7;
    global.roomPath[1,4] = 7;
    global.roomPath[2,4] = 7;
    global.roomPath[3,4] = 7;
    
    n = rand(0,2);
    if (n == global.endRoomX) n = 3;
    
    global.roomPath[n,4] = 9;
}
else if (global.levelType == 2)
{
    if (not global.madeMoai and rand(1,13 - global.currLevel) == 1) // Moai
    {
        global.madeMoai = true;
        global.roomPath[rand(0,3), rand(1,2)] = 6;
    }
    else
    {
        alien = rand(1, global.probAlien);
        yeti = rand(1, global.probYetiLair);
        if (n == 1 and m == 1)
        {
            if (rand(1,2) == 1) alien -= 1;
            else yeti -= 1;
        }
        if (alien == 1)
        {
            k = rand(0,2);
            j = rand(1,2);
            global.roomPath[k,j] = 7;
            for (i = k + 1; i < 3; i += 1) global.roomPath[i,j] = 8;
            global.roomPath[3,j] = 9
            global.alienCraft = true;
        }
        else if (yeti == 1) global.yetiLair = true;
    }
}
else if (global.levelType == 3 and rand(1,global.probSacPit) <= 3)
{
    len = 0;
    for (x = 0; x < 4; x += 1)
    {
        if(global.roomPath[x,1] == 0 and global.roomPath[x,2] == 0 and global.roomPath[x,3] == 0 and global.roomPath[x,4] == 0)
        {
            sacPossX[len] = x;
            len += 1;
        }
    }
    if (len > 0)
    {
        n = sacPossX[rand(0, len-1)];
        global.roomPath[n, 0] = 7;
        global.roomPath[n, 1] = 8;
        global.roomPath[n, 2] = 8;
        global.roomPath[n, 3] = 9;
        
        global.sacrificePit = true;
        oGame.idol = true;
        oGame.damsel = true;
    }
}

// shop
if (rand(1,global.currLevel) <= 2 and global.currLevel > 1 and not global.madeBlackMarket)
{
    len = 0;
    for (y = 0; y < 4; y += 1)
    {
        for (x = 0; x < 4; x += 1)
        {
            if (global.roomPath[x,y] != 0)
            {
                shop = false;
                if (x != 3)
                {
                    if (global.roomPath[x+1,y] == 1 or global.roomPath[x+1,y] == 2)
                    {
                        shopDirection[len] = 4;
                        shop = true;
                    }    
                }
                if (not shop and x != 0)
                {
                    if (global.roomPath[x-1,y] == 1 or global.roomPath[x-1,y] == 2)
                    {
                        shopDirection[len] = 5;
                        shop = true;
                    }
                }
                if (shop)
                {
                    shopX[len] = x;
                    shopY[len] = y;
                    len += 1;
                }
            }
        }
    }
    if (len > 0) {
        n = rand(0, len-1);
        global.roomPath[shopX[n],shopY[n]] = 4;
        global.shopFacing = shopDirection[n];
        global.shop = true;
    }
}