//
// scrGenerateObstacles()
//
// Generates mostly 5x3 tile chunks that are randomized within rooms. Created for the Spelunky Community Update Project.
//

strTemp = argument0;

for (i = 1; i < 81; i += 1)
{
    strObs1 = "00000";
    strObs2 = "00000";
    strObs3 = "00000";
    strObs4 = "00000";
    tile = string_char_at(strTemp, i);
    
    if (tile == "8") // entrance/exit
    {
        if (global.levelType == 0 or global.levelType == 2)
        {
            n = 0;
            if (global.levelType == 0) n = rand(1,8);
            else if(global.levelType == 2)
            {
                if (global.yetiLair) n = rand(1,7);
                else n = rand(1,6);
            }
            switch(n)
            {
                case 1: { strObs1 = "00900"; strObs2 = "01110"; strObs3 = "11111"; break; }
                case 2: { strObs1 = "00900"; strObs2 = "02120"; strObs3 = "02120"; break; }
                case 3: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "92222"; break; }
                case 4: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "22229"; break; }
                case 5: { strObs1 = "00000"; strObs2 = "11001"; strObs3 = "19001"; break; }
                case 6: { strObs1 = "00000"; strObs2 = "10011"; strObs3 = "10091"; break; }
                case 7: { strObs1 = "00000"; strObs2 = "12021"; strObs3 = "12921"; break; }
                case 8: { strObs1 = "11111"; strObs2 = "10001"; strObs3 = "40094"; break; }
            }
        }
        else if (global.levelType == 1) { strObs1 = "00900"; strObs2 = "01110"; strObs3 = "11111"; }
        else { strObs1 = "00900"; strObs2 = "21112"; strObs3 = "21112"; }
    }
    else if (tile == "5") // ground
    {
        if (global.levelType == 0 or global.levelType == 2)
        {
            n = 0;
            if (global.levelType == 0 or global.yetiLair) n = rand(2,17);
            else if (global.levelType == 2) n = rand(1,15);
            switch(n)
            {
                case 1: { strObs1 = "00000"; strObs2 = "11111"; strObs3 = "00000"; break; }
                case 2: { strObs1 = "11111"; strObs2 = "00000"; strObs3 = "00000"; break; }
                case 3: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "11111"; break; }
                case 4: { strObs1 = "00000"; strObs2 = "20200"; strObs3 = "17177"; break; }
                case 5: { strObs1 = "00000"; strObs2 = "02020"; strObs3 = "71717"; break; }
                case 6: { strObs1 = "00000"; strObs2 = "00202"; strObs3 = "77171"; break; }
                case 7: { strObs1 = "00000"; strObs2 = "22200"; strObs3 = "11100"; break; }
                case 8: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "01110"; break; }
                case 9: { strObs1 = "00000"; strObs2 = "00222"; strObs3 = "00111"; break; }
                case 10: { strObs1 = "11100"; strObs2 = "22200"; strObs3 = "00000"; break; }
                case 11: { strObs1 = "01110"; strObs2 = "02220"; strObs3 = "00000"; break; }
                case 12: { strObs1 = "00111"; strObs2 = "00222"; strObs3 = "00000"; break; }
                case 13: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "21112"; break; }
                case 14: { strObs1 = "00000"; strObs2 = "20100"; strObs3 = "77117"; break; }
                case 15: { strObs1 = "00000"; strObs2 = "00102"; strObs3 = "71177"; break; }
                case 16: { strObs1 = "00000"; strObs2 = "11110"; strObs3 = "00000"; break; }
                case 17: { strObs1 = "00000"; strObs2 = "01111"; strObs3 = "00000"; break; }
            }
            if (global.levelType == 2 and not global.yetiLair) strObs3 = string_replace_all(strObs3,'7','0');
        }
        else if (global.levelType == 1)
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
        else
        {
            switch(rand(1,8))
            {
                case 1: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "21112"; break; }
                case 2: { strObs1 = "00000"; strObs2 = "02020"; strObs3 = "21212"; break; }
                case 3: { strObs1 = "11100"; strObs2 = "11110"; strObs3 = "11111"; break; }
                case 4: { strObs1 = "00111"; strObs2 = "01111"; strObs3 = "11111"; break; }
                case 5: { strObs1 = "21112"; strObs2 = "22222"; strObs3 = "00000"; break; }
                case 6: { strObs1 = "00022"; strObs2 = "00011"; strObs3 = "00011"; break; }
                case 7: { strObs1 = "22000"; strObs2 = "11000"; strObs3 = "11000"; break; }
                case 8: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "00000"; break; }
            }
        }
    }
    else if (tile == "6") // air
    {
        if (global.levelType == 0 or global.yetiLair or global.levelType == 3)
        {
            switch(rand(1,10))
            {
                case 1: { strObs1 = "11111"; strObs2 = "00000"; strObs3 = "00000"; break; }
                case 2: { strObs1 = "22222"; strObs2 = "00000"; strObs3 = "00000"; break; }
                case 3:
                {
                    if (global.levelType == 3) strObs1 = "22200";
                    else strObs1 = "11100";
                    strObs2 = "22200"; strObs3 = "00000"; break; }
                case 4:
                {
                    if (global.levelType == 3) strObs1 = "02220";
                    else strObs1 = "01110";
                    strObs2 = "02220"; strObs3 = "00000"; break; }
                case 5:
                {
                    if (global.levelType == 3)  strObs1 = "00222";
                    else strObs1 = "00111";
                    strObs2 = "00222"; strObs3 = "00000"; break; }
                case 6: { strObs1 = "00000"; strObs2 = "01110"; strObs3 = "00000"; break; }
                case 7: { strObs1 = "00000"; strObs2 = "01110"; strObs3 = "02220"; break; }
                case 8: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "01110"; break; }
                case 9: { strObs1 = "00000";
                    if (global.levelType == 0) { strObs2 = "00220"; strObs3 = "01111"; }
                    else
                    {
                        if (global.levelType == 3) strObs2 = "20100";
                        else strObs2 = "00222";
                        strObs3 = "00111";
                    }
                    break;
                }
                case 10: { strObs1 = "00000";
                    if (global.levelType == 3) strObs2 = "00102";
                    else strObs2 = "22200";
                    strObs3 = "11100"; break; }
            }
        }
        else if (global.levelType == 1)
        {
            n = rand(1,4);
            switch(n)
            {
                case 1: { strObs1 = "11112"; strObs2 = "22220"; strObs3 = "00000"; break; }
                case 2: { strObs1 = "21111"; strObs2 = "02222"; strObs3 = "00000"; break; }
                case 3: { strObs1 = "22222"; strObs2 = "00000"; strObs3 = "00000"; break; }
                case 4: { strObs1 = "11111"; strObs2 = "21112";
                    if (global.blackMarket) strObs3 = "02120";
                    else strObs3 = "00000";
                    break;
                }
            }
        }
        else if (global.levelType == 2)
        {
            switch(rand(1,4))
            {
                case 1: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "11111"; break; }
                case 2: { strObs1 = "00000"; strObs2 = "11111"; strObs3 = "22222"; break; }
                case 3: { strObs1 = "11111"; strObs2 = "22222"; strObs3 = "00000"; break; }
                case 4: { strObs1 = "0jij0"; strObs2 = "0jij0"; strObs3 = "0jij0"; break; }
            }
        }
        else
        {
            switch(rand(1,8))
            {
                case 1: { strObs1 = "0$$$0"; strObs2 = "21112"; strObs3 = "02220"; break; }
                case 2: { strObs1 = "0000$"; strObs2 = "0$$$1"; strObs3 = "21111"; break; }
                case 3: { strObs1 = "$0000"; strObs2 = "1$$$0"; strObs3 = "11112"; break; }
                case 4: { strObs1 = "1$$00"; strObs2 = "11112"; strObs3 = "12200"; break; }
                case 5: { strObs1 = "0$$$1"; strObs2 = "21111"; strObs3 = "00221"; break; }
                case 6: { strObs1 = "21112"; strObs2 = "$$$$$"; strObs3 = "11111"; break; }
            }
        }
    }
    else if (tile == "V") // vines
    {
        switch(rand(1,3))
        {
            case 1: { strObs1 = "L0L0L"; strObs2 = "L0L0L"; strObs3 = "L000L"; strObs4 = "L0000"; break; }
            case 2: { strObs1 = "L0L0L"; strObs2 = "L0L0L"; strObs3 = "L000L"; strObs4 = "0000L"; break; }
            case 3: { strObs1 = "0L0L0"; strObs2 = "0L0L0"; strObs3 = "0L0L0"; strObs4 = "000L0"; break; }
        }
    }
    else if (tile == "F") // falling/icy plats
    {
        switch(rand(1,12))
        {
            case 1: { strObs1 = "0ff"; strObs2 = "000"; strObs3 = "000"; break; }
            case 2: { strObs1 = "000"; strObs2 = "0ff"; strObs3 = "000"; break; }
            case 3: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0ff"; break; }
            case 4: { strObs1 = "00f"; strObs2 = "000"; strObs3 = "000"; break; }
            case 5: { strObs1 = "000"; strObs2 = "0f0"; strObs3 = "000"; break; }
            case 6: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0f0"; break; }
            case 7: { strObs1 = "0ji"; strObs2 = "000"; strObs3 = "000"; break; }
            case 8: { strObs1 = "000"; strObs2 = "0ji"; strObs3 = "000"; break; }
            case 9: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0ji"; break; }
            case 10: { strObs1 = "00i"; strObs2 = "000"; strObs3 = "000"; break; }
            case 11: { strObs1 = "000"; strObs2 = "0i0"; strObs3 = "000"; break; }
            case 12: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0i0"; break; }
        }
    }
    else if (tile == "r") // air
    {
        switch(rand(1,10))
        {
            case 1: { strObs1 = "1111"; strObs2 = "0000"; strObs3 = "0000"; break; }
            case 2: { strObs1 = "2222"; strObs2 = "0000"; strObs3 = "0000"; break; }
            case 3: { strObs1 = "2220"; strObs2 = "2220"; strObs3 = "0000"; break; }
            case 4: { strObs1 = "0222"; strObs2 = "0222"; strObs3 = "0000"; break; }
            case 5: { strObs1 = "2222"; strObs2 = "0000"; strObs3 = "2222"; break; }
            case 6: { strObs1 = "0000"; strObs2 = "1111"; strObs3 = "0000"; break; }
            case 7: { strObs1 = "0000"; strObs2 = "1111"; strObs3 = "2222"; break; }
            case 8: { strObs1 = "0000"; strObs2 = "2222"; strObs3 = "1111"; break; }
            case 9: { strObs1 = "0000"; strObs2 = "0220"; strObs3 = "2112"; break; }
            case 10: { strObs1 = "0000"; strObs2 = "2002"; strObs3 = "1221"; break; }
        }
    }
    else
    {
        continue;
    }
    
    strTemp = string_replace_at(strTemp, strObs1, i);
    strTemp = string_replace_at(strTemp, strObs2, i+10);
    strTemp = string_replace_at(strTemp, strObs3, i+20);
    if (tile == "V") strTemp = string_replace_at(strTemp, strObs4,i+30);
}

return strTemp;