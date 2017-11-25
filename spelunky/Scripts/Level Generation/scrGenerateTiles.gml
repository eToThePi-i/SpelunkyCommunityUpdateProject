strTemp = argument0;

// Generate the tiles
for (j = 0; j < 8; j += 1)
{
    for (i = 1; i < 11; i += 1)
    {
        tile = string_char_at(strTemp, i+j*10);
        xpos = x + (i-1)*16;
        ypos = y + j*16;
        
        if (tile == "0")
        {
            continue;
        }
        else if (tile == "#")
        {
            if (rand(1,2) == 1) instance_create(xpos+8, ypos+8, oChest);
            else instance_create(xpos+8, ypos+8, oCrate);
        }
        else if (tile == "*")
        {
            instance_create(xpos, ypos, oTombLord);
        }
        else if (tile == "+")
        {
            obj = instance_create(xpos, ypos, oSolid);
            obj.sprite_index = sIceBlock;
            obj.shopWall = true;
        }
        else if (tile == ",")
        {
            instance_create(xpos, ypos, oWaterSwim);
            if (rand(1,2)==1) instance_create(xpos, ypos, oLush);
        }
        else if (tile == ".")
        {
                if (not collision_point(xpos, ypos, oSolid, 0, 0))
                {
                    var obj; // TODO: I'm not certain this is necessary, but this may have C-like scoping
                    if (global.levelType == 0)
                    {
                        if (rand(1,10) == 1) obj = instance_create(xpos, ypos, oBlock);
                        else
                        {
                            obj = instance_create(xpos, ypos, oBrick);
                        }
                    }
                    else if (global.levelType == 1) obj = instance_create(xpos, ypos, oLush);
                    else if (global.levelType == 2) obj = instance_create(xpos, ypos, oDark);
                    else if (global.levelType == 3) obj = instance_create(xpos, ypos, oTemple);
                    obj.shopWall = true;
                }
        }
        else if (tile == "1")
        {
            if(not collision_point(xpos, ypos, oSolid, 0, 0))
            {
                if (global.levelType == 0)
                {
                    if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                    else instance_create(xpos, ypos, oBrick);
                }
                else if (global.levelType == 1) instance_create(xpos, ypos, oLush);
                else if (global.levelType == 2)
                {
                    if(global.yetiLair)
                    {
                        if (rand(1,6) == 1) instance_create(xpos, ypos, oDark);
                        else instance_create(xpos, ypos, oIce);
                    }
                    else
                    {
                        if (rand(1,10) == 1) instance_create(xpos, ypos, oIce);
                        else instance_create(xpos, ypos, oDark);
                    }
                }
                else if (global.levelType == 3)
                {
                    if (rand(1,100) == 1) instance_create(xpos, ypos, oLush);
                    else if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                    else instance_create(xpos, ypos, oTemple);
                }
                else if (global.levelType == 4)
                {
                    if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                    else instance_create(xpos, ypos, oTemple);
                }
            }
        }
        else if (tile == "2")
        {
            if (not collision_point(xpos, ypos, oSolid, 0, 0) and rand(1,2) == 1)
            {
                if (global.levelType == 0)
                {
                    if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                    else
                    {
                        instance_create(xpos, ypos, oBrick);
                    }
                }
                else if (global.levelType == 1) instance_create(xpos, ypos, oLush);
                else if (global.levelType == 2)
                {
                    if(global.yetiLair)
                    {
                        if (rand(1,6) == 1) instance_create(xpos, ypos, oDark);
                        else instance_create(xpos, ypos, oIce);
                    }
                    else
                    {
                        if (rand(1,10) == 1) instance_create(xpos, ypos, oIce);
                        else instance_create(xpos, ypos, oDark);
                    }
                }
                else if (global.levelType == 3)
                {
                    if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                    else instance_create(xpos, ypos, oTemple);
                }
                else if (global.levelType == 4)
                {
                    if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                    else instance_create(xpos, ypos, oTemple);
                }
            }
        }
        else if (tile == "3")
        {
            if (global.levelType == 1)
            {
                if (rand(1,2) == 1) instance_create(xpos, ypos, oWaterSwim);
                else instance_create(xpos, ypos, oLush);
            }
            else if (global.levelType == 3)
            {
                if (rand(1,2) == 1) instance_create(xpos, ypos, oLava);
                else instance_create(xpos, ypos, oTemple);
            }
        }
        else if (tile == "4")
        {
            if (rand(1,4) == 1) instance_create(xpos, ypos, oPushBlock);
        }
        else if (tile == "7")
        {
            if (rand(1,3) == 1) instance_create(xpos, ypos, oSpikes);
        }
        else if (tile == "9")
        {
            var block; // TODO: I'm not certain this is necessary, but this may have C-like scoping
            if (global.levelType == 0) block = instance_create(xpos, ypos+16, oBrick);
            else if (global.levelType == 1) block = instance_create(xpos, ypos+16, oLush);
            else if (global.levelType == 2) block = instance_create(xpos, ypos+16, oDark);
            else if (global.levelType == 3 or global.levelType == 4) block = instance_create(xpos, ypos+16, oTemple); // TODO: It's possible this line will need to be fixed, as the original code had a different order.
            if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY) instance_create(xpos, ypos, oEntrance);
            else
            {
                instance_create(xpos, ypos, oExit);
                global.exitX = xpos;
                global.exitY = ypos;
                block.invincible = true;
            }
        }
        else if (tile == ";")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.cost = 0;
            obj.forSale = false;
            instance_create(xpos+16+8, ypos+12, oGoldIdol);
        }
        else if (tile == "=")
        {
            instance_create(xpos, ypos, oLadderTop);
        }
        else if (tile == "?")
        {
            scrShopItemsGen();
        }
        else if (tile == "A")
        {
            if (global.levelType == 0 or global.levelType == 2)
            {
                instance_create(xpos, ypos, oAltarLeft);
                instance_create(xpos+16, ypos, oAltarRight);
            }
            else if (global.levelType == 2)
            {
                instance_create(xpos, ypos, oAlienShip);
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
            }
        }
        else if (tile == "B")
        {
            if (global.levelType == 0)
            {
                instance_create(xpos+16, ypos+16, oGiantTikiHead);
                tile_add(bgTiki, 0, 0, 32, 64, xpos, ypos+32, 10001);
                tile_add(bgTikiArms, 16*rand(0,2), 0, 16, 16, xpos+32, ypos+32, 10001);
                tile_add(bgTikiArms, 16*rand(0,2), 16, 16, 16, xpos-16, ypos+32, 10001);
            }
            else if (global.levelType == 1)
            {
                obj = instance_create(xpos, ypos, oTrapBlock);
                obj.deathTimer = 40-abs(obj.x-(oGoldIdol.x-8));
                if (obj.deathTimer < 0) obj.deathTimer = 0;
            }
            else if (global.levelType == 2)
            {
                if (global.yetiLair) instance_create(xpos+16, ypos+12, oGiantTikiHead);
                else
                {
                    tile = instance_create(xpos, ypos, oAlienShip);
                    with tile { sprite_index = sAlienFloor; }
                    tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
                }
            }
            else if (global.levelType == 3)
            {
                instance_create(xpos, ypos, oTrapBlock);
            }
        }
        else if (tile == "C")
        {
            if (global.levelType == 2)
            {
                tile = instance_create(xpos, ypos, oAlienShip);
                with tile { sprite_index = sAlienFront; }
                tile = instance_create(xpos, ypos+16, oAlienShip);
                with tile { sprite_index = sAlienFront; }
                tile = instance_create(xpos, ypos+32, oAlienShip);
                with tile { sprite_index = sAlienFront2; }
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos+16, 160);
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos+32, 160);
            }
            else if (global.levelType == 3)
            {
                instance_create(xpos, ypos, oCeilingTrap);
            }
        }
        else if (tile == "D")
        {
            if (global.levelType == 2)
            {
                tile = instance_create(xpos, ypos, oAlienShip);
                with tile { sprite_index = sAlienFront3; }
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
            }
            else if (global.levelType == 3)
            {
                instance_create(xpos, ypos, oDoor);
                instance_create(xpos, ypos, oTempleFake);
                instance_create(xpos, ypos+16, oTempleFake);
            }
        }
        else if (tile == "!")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.forSale = true;
            obj.status = 5;
        }
        else if (tile == "E")
        {
            if (rand(1,3) == 1) tile_add(bgAlienShip, 32, 0, 32, 64, xpos, ypos, 9005);
            else tile_add(bgAlienShip, 0, 0, 32, 64, xpos, ypos, 9005);
        }
        else if (tile == "G")
        {
            
            tile_add(bgAlienShip2, 0, 0, 32, 48, xpos, ypos, 9005);
        }
        else if (tile == "H")
        {
            instance_create(xpos, ypos, oLadderOrange);
        }
        else if (tile == "I")
        {
            if (global.levelType == 4) yoffset = 0;
            else if (global.yetiLair) yoffset = 8;
            else yoffset = 12;
            instance_create(xpos+16, ypos+yoffset, oGoldIdol);
        }
        else if (tile == "J")
        {
            instance_create(xpos, ypos, oWaterSwim);
            instance_create(xpos, ypos, oJaws);
        }
        else if (tile == "K")
        {
            obj = instance_create(xpos, ypos, oShopkeeper);
            obj.style = shopType;
        }
        else if (tile == "L")
        {
            if (global.levelType == 1) instance_create(xpos, ypos, oVine);
            else instance_create(xpos, ypos, oLadderOrange);
        }
        else if (tile == "M")
        {
            if (not collision_point(xpos, ypos, oSolid, 0, 0))
            {
                instance_create(xpos, ypos, oMoai);
                instance_create(xpos+16, ypos, oMoai2);
                instance_create(xpos+32, ypos, oMoai3);
                instance_create(xpos+16, ypos+16, oMoaiInside);
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos+16, ypos+16, 150);
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos+16, ypos+32, 150);
                instance_create(xpos+16, ypos+32, oThinIce);
                obj = instance_create(xpos+16, ypos+48, oExit);
                obj.type = "Moai Exit";
                obj = instance_create(xpos+16+8, ypos+48+8, oCrown);
                obj.cost = 0;
                obj.forSale = false;
                global.moaiX = xpos+16;
                global.moaiY = ypos+16;
            }
        }
        else if (tile == "P")
        {
            instance_create(xpos, ypos, oPushBlock);
        }
        else if (tile == "Q")
        {
            if (shopType == "Craps") tile_add(bgDiceSign, 0, 0, 48, 32, xpos, ypos, 9004);
        }
        else if (tile == "R")
        {
            if (global.levelType == 0 or global.levelType == 2) instance_create(xpos+8, ypos+8, oRubyBig);
            else if (global.levelType == 3)
            {
                block = instance_create(xpos, ypos, oTemple);
                with block { treasure = "Big Ruby"; }
            }
        }
        else if (tile == "S")
        {
            instance_create(xpos+16, ypos+12, oCrystalSkull);
        }
        else if (tile == "T")
        {
            instance_create(xpos, ypos, oTree);
            n = 0;
            tx = xpos;
            ty = ypos-16;
            b1 = false;
            b2 = false;
            for (m = 0; m < 5; m += 1)
            {
                if (rand(0,m) > 2) break;
                else
                {
                if (not collision_point(tx, ty-16, oSolid, 0, 0) and
                    not collision_point(tx-16, ty-16, oSolid, 0, 0) and
                    not collision_point(tx+16, ty-16, oSolid, 0, 0))                    
                {
                    instance_create(tx, ty, oTree);
                    if (m < 4)
                    {
                        if (rand(1,5) < 4 and not b1)
                        {
                            instance_create(tx+16, ty, oTreeBranch);
                            b1 = true;
                        }
                        else if (b1) b1 = false;
                        if (rand(1,5) < 4 and not b2)
                        {
                            instance_create(tx-16, ty, oTreeBranch);
                            b2 = true;
                        }
                        else if (b2) b2 = false;
                    }
                }
                else break;
                }
                ty -= 16;
            }
            instance_create(tx-16, ty+16, oLeaves);
            instance_create(tx+16, ty+16, oLeaves);
        }
        else if (tile == "W")
        {
            if (global.murderer or global.thiefLevel > 0)
            {
                if (global.isDamsel) tile_add(bgWanted, 32, 0, 32, 32, xpos, ypos, 9004);
                else if (global.isTunnelMan) tile_add(bgWanted, 64, 0, 32, 32, xpos, ypos, 9004);
                else tile_add(bgWanted, 0, 0, 32, 32, xpos, ypos, 9004);
            }
        }
        else if (tile == "X")
        {
            if (global.levelType == 2) instance_create(xpos, ypos, oAlienBoss);
            else if (global.levelType == 3)
            {
                for (l = 0; l < 6; l += 1)
                {
                    for (k = 0; k < 5; k += 1)
                    {
                        obj = instance_create(xpos+k*16, ypos+l*16, oXocBlock);
                        if (k == 2 and l == 1) obj.treasure = "Diamond";
                        if (k == 1 and l == 2) obj.treasure = "Sapphire";
                        if (k == 3 and l == 2) obj.treasure = "Sapphire";
                        if (k == 0 and l == 3) obj.treasure = "Emerald";
                        if (k == 4 and l == 3) obj.treasure = "Emerald";
                        if (k == 2 and l == 4) obj.treasure = "Ruby";
                        tile_add(bgLadyXoc, k*16, l*16, 16, 16, xpos+k*16, ypos+l*16, 99);
                    }
                }
            }
        }
        else if (tile == "Y")
        {
            instance_create(xpos, ypos, oYetiKing);
        }
        else if (tile == "_")
        {
            if (not collision_point(xpos, ypos, oSolid, 0, 0))
            {
                obj = instance_create(xpos, ypos, oDark);
                obj.invincible = true;
            }
        }
        else if (tile == "a")
        {
            obj = instance_create(xpos+8, ypos+8, oAnkh);
        }
        else if (tile == "b")
        {
            if (global.levelType == 3) obj = instance_create(xpos, ypos, oTemple); // TODO: check the properties of oTemple, to see if this can be replaced with simple sprite substitution
            else
            {
                obj = instance_create(xpos, ypos, oBrickSmooth);
                if (global.levelType == 1) obj.sprite_index = sLushSmooth;
                else (global.levelType == 2) obj.sprite_index = sDarkSmooth;
            }
            obj.shopWall = true;
        }
        else if (tile == ":")
        {
            if (rand(1,2) == 1)
            {
                if (rand(1,10) == 1) instance_create(xpos, ypos, oIce);
                else instance_create(xpos, ypos, oDark);
            }
            else
            {
                tile = instance_create(xpos, ypos, oAlienShip);
                with tile { sprite_index = sAlienFloor; }
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
            }
        }
        else if (tile == "c")
        {
            instance_create(xpos, ypos, oThinIce);
        }
        else if (tile == "d")
        {
            instance_create(xpos, ypos, oLush);
        }
        else if (tile == "u")
        {
            instance_create(xpos+8, ypos+8, oDice);
        }
        else if (tile == "e")
        {
            instance_create(xpos, ypos, oBarrierEmitter);
        }
        else if (tile == "f")
        {
            instance_create(xpos, ypos, oDarkFall);
        }
        else if (tile == "$")
        {
            if (global.levelType == 2)
            {
                instance_create(xpos, ypos, oDark);
                obj = instance_create(xpos+8, ypos+8, oJetpack);
                obj.cost = 0;
                obj.forSale = false;
            }
            else if (global.levelType == 3)
            {
                if (rand(1,120) == 1) instance_create(xpos+8, ypos+12, oRubyBig);
                else if (rand(1,80) == 1) instance_create(xpos+8, ypos+12, oSapphireBig);
                else if (rand(1,60) == 1) instance_create(xpos+8, ypos+12, oEmeraldBig);
                else instance_create(xpos+8, ypos+8, oGoldBars);
            }
            else if (global.levelType == 4)
            {
                if (rand(1,15) == 1) instance_create(xpos+8, ypos+8, oChest);
                else if (rand(1,6) == 1) instance_create(xpos+8, ypos+8, oGoldBars);
                else if (rand(1,6) == 1) instance_create(xpos+8, ypos+12, oEmeraldBig);
                else if (rand(1,8) == 1) instance_create(xpos+8, ypos+12, oSapphireBig);
                else if (rand(1,10) == 1) instance_create(xpos+8, ypos+12, oRubyBig);
                else if (rand(1,10) == 1) instance_create(xpos+8, ypos+8, oCrate);
                else if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
                else instance_create(xpos, ypos, oTemple);
            }
        }
        else if (tile == "i")
        {
            instance_create(xpos, ypos, oIce);
        }
        else if (tile == "j")
        {
            if(rand(1,2) == 1) instance_create(xpos, ypos, oIce);
        }
        else if (tile == "k")
        {
            obj = instance_create(xpos, ypos, oSign);
            if (shopType == "General") obj.sprite_index = sSignGeneral;
            else if (shopType == "Bomb") obj.sprite_index = sSignBomb;
            else if (shopType == "Weapon") obj.sprite_index = sSignWeapon;
            else if (shopType == "Clothing") obj.sprite_index = sSignClothing;
            else if (shopType == "Rare") obj.sprite_index = sSignRare;
            else if (shopType == "Craps") obj.sprite_index = sSignCraps;
            else if (shopType == "Kissing") obj.sprite_index = sSignKissing; // TODO: Black market does not have this line.
        }
        else if (tile == "l")
        {
            if (oGame.damsel) instance_create(xpos, ypos, oLampRed);
            else instance_create(xpos, ypos, oLamp);
        }
        else if (tile == "m")
        {
            instance_create(xpos, ypos, oBrick);
            obj = instance_create(xpos+8, ypos+8, oMattock);
            obj.cost = 0;
            obj.forSale = false;
        }
        else if (tile == "p")
        {
            if (rand(1,2)) instance_create(xpos, ypos, oFakeBones);
            else instance_create(xpos+8, ypos+10, oJar);
        }
        else if (tile == "q")
        {
            n = rand(1,6);
            scrGenerateItem(xpos+8, ypos+8, 1);
            obj.inDiceHouse = true;
        }
        else if (tile == "r")
        {
            if (rand(1,2) == 1) instance_create(xpos, ypos, oTemple);
            else instance_create(xpos, ypos, oLush);
        }
        else if (tile == "s")
        {
            if (global.levelType == 0)
            {
                if (rand(1,10) == 1) instance_create(xpos, ypos, oSnake);
                else if (rand(1,2) == 1) instance_create(xpos, ypos, oBrick);
            }
            else
            {
                instance_create(xpos, ypos, oSpikes);
            }
        }
        else if (tile == "t")
        {
            instance_create(xpos, ypos, oTemple);
        }
        else if (tile == "v")
        {
            instance_create(xpos, ypos, oWaterSwim);
            instance_create(xpos, ypos, oLush);
        }
        else if (tile == "w")
        {
            if (global.levelType == 1) instance_create(xpos, ypos, oWaterSwim);
            else if (global.levelType == 3) instance_create(xpos, ypos, oLava);
        }
        else if (tile == "x")
        {
            instance_create(xpos, ypos, oSacAltarLeft);
            instance_create(xpos+16, ypos, oSacAltarRight);
            tile_add(bgKaliBody, 0, 0, 64, 64, xpos-16, ypos-48, 10001);
            instance_create(xpos+16, ypos-80+16, oKaliHead);
        }
        else if (tile == "y")
        {
            instance_create(xpos, ypos, oYeti);
        }
        else if (tile == "~")
        {
            instance_create(xpos, ypos, oSnake);
        }
    }
}