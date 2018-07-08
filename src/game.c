//-----------------------------LICENSE NOTICE------------------------------------
//  This file is part of CPCtelera: An Amstrad CPC Game Engine
//  Copyright (C) 2015 ronaldo / Fremos / Cheesetea / ByteRealms (@FranGallegoBR)
//
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

#include <stdio.h>
#include <cpctelera.h>
#include "defines.h"
#include "keyboard/keyboard.h"
#include "text/text.h"
#include "entities/THero.h"
#include "entities/TNPC.h"
#include "entities/TCombat.h"
//#include "entities/TBoard.h"
//#include "entities/TPlayer.h"
//#include "entities/TAi.h"

//TBoard board;
//TCombat combat;
TKeys keys;
THero hero;
TNPC npc;

void initGame(){
   
    // Clear Screen
    cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);    // Clear de Screen BGCOLOR=Black
    

}


void playGame(){
    playCombat(&hero, &npc);
}