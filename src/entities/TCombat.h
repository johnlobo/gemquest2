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

#ifndef _TCOMBAT_H_
#define _TCOMBAT_H_

#include <cpctelera.h>
//#include "TBoard.h"
//#include "TPlayer.h"
#include "entities/THero.h"
#include "entities/TNPC.h"



typedef struct {
  u8 x,y,px,py;    
  //TBoard board;
  //TPlayer player;
  //TPlayer enemy;
} TCombat;

extern TCombat combat;

void playCombat(THero *hero, TNPC *npc);

#endif