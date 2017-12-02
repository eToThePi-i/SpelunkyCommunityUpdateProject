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

for (i = 0; i < 4; i += 1)
{
    for (j = 0; j < 5; j += 1)
    {
        global.roomPath[i,j] = 0;
    }
}

global.startRoomX = rand(0,3);
global.startRoomY = 0;
roomX = global.startRoomX;
roomY = 0;
global.roomPath[roomX, roomY] = 1;
noStartX = -1;
n = rand(0,3);

global.endRoomX = 0;
global.endRoomY = 0;
direction = 0;

global.sacrificePit = false;
global.snakePit = false;
global.alienCraft = false;
global.yetiLair = false;

// Black Market
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

while (roomY < 4)
{
    down = false;
    if (direction == 0)
    {
        if (roomX == 0) direction = 1;
        else if (roomX == 3) direction = -1;
    }
    if (direction != 0)
    {
        if (rand(1,3) == 1) down = true;
    }
    else
    {
        n = rand(1,5);
        if (n == 3) down = true;
        else if (n < 3) direction = -1;
        else direction = 1;
    }
    if (not down)
    {
        if (direction == 1)
        {
            roomX += 1;
            if (roomX == 3) down = true;
        }
        else if (direction == -1)
        {
            roomX -= 1;
            if (roomX == 0) down = true;
        }
    }
    if (down)
    {
        roomY += 1;
        direction = 0;
        if (roomY < 4)
        {
            global.roomPath[roomX, roomY-1] = 2;
            global.roomPath[roomX, roomY] = 3;
        }
        else
        {
            global.endRoomX = roomX;
            global.endRoomY = roomY-1;
        }
    }
    
    if (not down) global.roomPath[roomX, roomY] = 1;
}

// City of Gold
if (global.cityOfGold) global.roomPath[rand(0,3), 2] = 6;

if (global.levelType == 0)
{
    len = 0;
    for (i = 0; i < 4; i += 1)
    {
        if (global.roomPath[i,1] == 0 and global.roomPath[i,2] == 0 and (global.roomPath[i,0] or global.roomPath[i,3]))
        {
            snakePitX[len] = i;
            len += 1;
        }
    }
    if (len > 0)
    {
        n = rand(1,global.probSnakePit);
        if (n <= len)
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
        if (alien == 1) // alien craft
        {
            k = rand(0,2);
            j = rand(1,2);
            global.roomPath[k,j] = 7;
            for (i = k + 1; i < 3; i += 1) global.roomPath[i,j] = 8;
            global.roomPath[3,j] = 9
            global.alienCraft = true;
        }
        else if (yeti == 1) // yeti
        {
            global.yetiLair = true;
        }
    }
}
else if (global.levelType == 3 and rand(1,global.probSacPit) <= 3)
{
    len = 0;
    for (i = 0; i < 4; i += 1)
    {
        if(global.roomPath[i,1] == 0 and global.roomPath[i,2] == 0 and global.roomPath[i,3] == 0 and global.roomPath[i,4] == 0)
        {
            sacPossX[len] = i;
            len += 1;
        }
    }
    if (len > 0)
    {
        n = sacPossX[rand(0, len)];
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
    for (k = 0; k < 4; k += 1)
    {
        for (j = 0; j < 4; j += 1)
        {
            global.roomPoss[j,k] = 0;
            if (global.roomPath[j,k] == 0)
            {
                if (j < 3)
                {
                    if (global.roomPath[j+1,k] == 1 or global.roomPath[j+1,k] == 2)
                    {
                        shopX[len] = j;
                        shopY[len] = k;
                        shopPath[j,k] = 4;
                        len += 1;
                    }
                }
                if (j > 0)
                {
                    if (global.roomPath[j-1,k] == 1 or global.roomPath[j-1,k] == 2)
                    {
                        shopX[len] = j;
                        shopY[len] = k;
                        shopPath[j,k] = 5;
                        len += 1;
                    }
                }
            }
        }
    }
    if (len > 0) {
        n = rand(0,len);
        global.roomPath[shopX[n],shopY[n]] = shopPath[shopX[n],shopY[n]];
        global.shop = true;
    }
}