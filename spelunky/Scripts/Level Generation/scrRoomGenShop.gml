//
// scrRoomGenShop()
//
// Room generation for shops. Created for the Spelunky Community Update Project.
//

strTemp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000";

roomPath = global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];

if (roomPath == 4) strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K????000bbbbbbbbbb";
else strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...000????K..bbbbbbbbbb";
if (oGame.damsel) n = rand(1,6);
else n = rand(1,7);
n = 6;
switch(n)
{
    case 1: { shopType = "General"; break; }
    case 2: { shopType = "Bomb"; break; }
    case 3: { shopType = "Weapon"; break; }
    case 4: { shopType = "Rare"; break; }
    case 5: { shopType = "Clothing"; break; }
    case 6:
    {
        shopType = "Craps";
        if (roomPath == 4) strTemp = "11111111111111111111111122111111Kl000211..bQ00W010.0+00000k0.q+uu00000bbbbbbbbbb";
        else strTemp = "111111111111111111111111221111112000lK1101W0Q00b..0k00000+0.00000uu+q.bbbbbbbbbb";
        break;
    }
    case 7:
    {
        shopType = "Kissing";
        if (roomPath == 4) strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K00!0000bbbbbbbbbb";
        else strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...0000!00K..bbbbbbbbbb";
        oGame.damsel = true;
        break;
    }
}

scrGenerateTiles(strTemp);