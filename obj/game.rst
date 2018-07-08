                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module game
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _playGame
                             12 	.globl _initGame
                             13 	.globl _playCombat
                             14 	.globl _cpct_px2byteM0
                             15 	.globl _cpct_memset
                             16 	.globl _npc
                             17 	.globl _hero
                             18 	.globl _keys
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   2FE7                      26 _keys::
   2FE7                      27 	.ds 18
   2FF9                      28 _hero::
   2FF9                      29 	.ds 4
   2FFD                      30 _npc::
   2FFD                      31 	.ds 4
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/game.c:37: void initGame(){
                             57 ;	---------------------------------
                             58 ; Function initGame
                             59 ; ---------------------------------
   1C78                      60 _initGame::
                             61 ;src/game.c:40: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);    // Clear de Screen BGCOLOR=Black
   1C78 21 00 00      [10]   62 	ld	hl, #0x0000
   1C7B E5            [11]   63 	push	hl
   1C7C CD A3 2D      [17]   64 	call	_cpct_px2byteM0
   1C7F 45            [ 4]   65 	ld	b, l
   1C80 21 00 40      [10]   66 	ld	hl, #0x4000
   1C83 E5            [11]   67 	push	hl
   1C84 C5            [11]   68 	push	bc
   1C85 33            [ 6]   69 	inc	sp
   1C86 26 C0         [ 7]   70 	ld	h, #0xc0
   1C88 E5            [11]   71 	push	hl
   1C89 CD BF 2D      [17]   72 	call	_cpct_memset
   1C8C C9            [10]   73 	ret
                             74 ;src/game.c:46: void playGame(){
                             75 ;	---------------------------------
                             76 ; Function playGame
                             77 ; ---------------------------------
   1C8D                      78 _playGame::
                             79 ;src/game.c:47: playCombat(&hero, &npc);
   1C8D 21 FD 2F      [10]   80 	ld	hl, #_npc
   1C90 E5            [11]   81 	push	hl
   1C91 21 F9 2F      [10]   82 	ld	hl, #_hero
   1C94 E5            [11]   83 	push	hl
   1C95 CD A7 1D      [17]   84 	call	_playCombat
   1C98 F1            [10]   85 	pop	af
   1C99 F1            [10]   86 	pop	af
   1C9A C9            [10]   87 	ret
                             88 	.area _CODE
                             89 	.area _INITIALIZER
                             90 	.area _CABS (ABS)
