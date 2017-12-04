//
// scrRoomGenShop()
//
// Room generation for shops. Created for the Spelunky Community Update Project.
//

roomPath = global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];

strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K????000 bbbbbbbbbb";
if (oGame.damsel) n = rand(1,6);
else n = rand(1,7);
switch(n)
{
    case 1: { shopType = "General"; break; }
    case 2: { shopType = "Bomb"; break; }
    case 3: { shopType = "Weapon"; break; }
    case 4: { shopType = "Rare"; break; }
    case 5: { shopType = "Clothing"; break; }
    case 6: { shopType = "Craps"; strTemp = "1111111111 1111111111 1111221111 11Kl000211 ..b0Q0W010 .0+00000k0 .q+uu00000 bbbbbbbbbb"; break; }
    case 7: { shopType = "Kissing"; strTemp = "1111111111 1111111111 1111221111 111l000211 ...000W010 ...00000k0 ..K00!0000 bbbbbbbbbb"; oGame.damsel = true; break; }
}

if (global.shopFacing == 5) strTemp = scrReflectLevel(strTemp);

scrGenerateTiles(strTemp);