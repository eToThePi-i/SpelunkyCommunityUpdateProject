//
// scrRoomGenExit()
//
// Room generation for the exit room. Created for the Spelunky Community Update Project.
//

strTemp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000";

roomPath = global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];

roomPathAbove = -1;
if (scrGetRoomY(y) != 0) roomPathAbove = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)];

if (global.levelType == 3) strTemp = "00000000000000000000000000000000000000000008000000000000000000000000000000000000";
else if (global.lake) strTemp = "000000000000000900000221111220wwvvvvvvwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww";
else
{
    if (roomPathAbove == 2)
    {
        if (global.levelType == 0) n = rand(2,4);
        else if (global.levelType == 1)
        {
            if (global.blackMarket) n = rand(1,2)
            else n = rand(0,1) * 2;
        }
        else if (global.levelType == 2)
        {
            if(global.yetiLair) n = rand(1,4);
            else n = 2;
        }
    }
    else
    {
        if (global.levelType == 0) n = rand(3,6);
        else n = rand(5,6);
    }
    switch(n)
    {
        case 0: { strTemp = "00000000000011111100000000000000000000000008000000000000000000000000001111111111"; break; }
        case 1: { strTemp = "00000000006000060000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000010021110001001111000110111129012000000111111111021111111201111111111"; break; }
        case 4: { strTemp = "00000000000111200100011110010021111011000000002109011111111102111111121111111111"; break; }
        // no drop
        case 5: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 6: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
    }
}

strTemp = scrGenerateObstacles(strTemp);

scrGenerateTiles(strTemp);