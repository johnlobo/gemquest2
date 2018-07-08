//-----------------------------LICENSE NOTICE------------------------------------
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//------------------------------------------------------------------------------

#include <cpctelera.h>
#include <stdio.h>
#include "../defines.h"
#include "TCombat.h"
#include "THero.h"
#include "TNPC.h"
#include "../keyboard/keyboard.h"
#include "../util/util.h"

u8 pauseGame;


//void initCombat(u8 x, u8 y, u8 width, u8 height, TPlayer *hero, TPlayer *enemy){
//    initBoard(x, y, width, height);
//    initPlayer(&player1);
//    player1.life = hero->life;
//    initPlayer(&enemy);
//    enemy.life = ai->life;
//}
//
void playCombat(THero *hero, TNPC *npc){
    /*
    u32 cycle;
    u8 turn;
    
    initCombat()
    cycle = 0;
    printScoreBoard();
    printPlayer(&player1);  //Prints the player for the first time to keep the loop erase-print
    turn = PLAYER1_TURN;
    while (1){
        
        cycle++; //increments cycle counter
        
        delay(20);
        //Abort Game
        if (cpct_isKeyPressed(keys.abort)) {
            break;
        }
        // Pause Game
        if (cpct_isKeyPressed(keys.pause)) {
            pauseGame = 1;
            waitKeyUp(keys.pause);
        }
        while (pauseGame) {
            if (cpct_isKeyPressed(keys.pause)) {
                pauseGame = 0;
                waitKeyUp(keys.pause);
            }
        }
        
        if (((cycle % 4) == 0) && (board.activeCell.active)){  // Only animate active cells every 5 cycles
            printActiveCellAnimation();  //erase previous active cell animation step
            board.activeCell.animstep++;
            board.activeCell.animstep = board.activeCell.animstep % 3;
            printActiveCellAnimation();  //print current  active cell animation step
        }
        
        // Players block exceuted every 3 frames
        if ((turn == PLAYER1_TURN) && ((cycle % 1) == 0)){
            updatePlayer(&player1);
            if (player1.updated){
                // Draw actors
                //cpct_waitVSYNC();
                deletePlayer(&player1);
                printPlayer(&player1);
                player1.updated = 0;
            }
        } else if ((turn == AI_TURN) && ((cycle % 2) == 0)){
            updateAI();
            if (enemy.updated){
                // Draw actors
                //cpct_waitVSYNC();
                deletePlayer(&enemy);
                printPlayer(&enemy);
                enemy.updated = 0;
            }
        }
        
    }
    */
}
