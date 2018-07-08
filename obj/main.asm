;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initMain
	.globl _myInterruptHandler
	.globl _drawWindow
	.globl _drawWindow2
	.globl _reset_cpc
	.globl _drawText2
	.globl _initKeys
	.globl _wait4UserKeypress
	.globl _wait4OneKey
	.globl _playGame
	.globl _initGame
	.globl _cpct_restoreState_mxor_u8
	.globl _cpct_setSeed_mxor
	.globl _cpct_getScreenPtr
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_px2byteM0
	.globl _cpct_scanKeyboard_if
	.globl _cpct_setStackLocation
	.globl _cpct_memset
	.globl _cpct_setInterruptHandler
	.globl _cpct_disableFirmware
	.globl _sp_palette0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_myInterruptHandler_i_1_117:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:50: cpctm_createTransparentMaskTable(g_tablatrans, 0x100, M0, 0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x100 
	 _g_tablatrans::
	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/main.c:61: void myInterruptHandler()
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:65: i++;
	ld	iy, #_myInterruptHandler_i_1_117
	inc	0 (iy)
;src/main.c:66: switch (i) {
	ld	a, 0 (iy)
	sub	a, #0x04
	jp	Z,_cpct_scanKeyboard_if
	ld	a, 0 (iy)
	sub	a, #0x05
	jr	Z,00103$
	ld	a, 0 (iy)
	sub	a, #0x06
	jr	Z,00103$
	ret
;src/main.c:67: case 4:
;src/main.c:68: cpct_scanKeyboard_if();
;src/main.c:69: break;
	jp  _cpct_scanKeyboard_if
;src/main.c:72: case 6:
00103$:
;src/main.c:73: i = 0;
	ld	hl,#_myInterruptHandler_i_1_117 + 0
	ld	(hl), #0x00
;src/main.c:74: }
	ret
_sp_palette0:
	.db #0x54	; 84	'T'
	.db #0x4d	; 77	'M'
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0x4c	; 76	'L'
	.db #0x4e	; 78	'N'
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x56	; 86	'V'
	.db #0x5e	; 94
	.db #0x53	; 83	'S'
	.db #0x5f	; 95
	.db #0x55	; 85	'U'
	.db #0x58	; 88	'X'
	.db #0x44	; 68	'D'
	.db #0x4b	; 75	'K'
;src/main.c:78: void initMain()
;	---------------------------------
; Function initMain
; ---------------------------------
_initMain::
;src/main.c:84: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:85: cpct_setPalette(sp_palette0, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_sp_palette0
	push	hl
	call	_cpct_setPalette
;src/main.c:86: cpct_setBorder(HW_WHITE);
	ld	hl, #0x0010
	push	hl
	call	_cpct_setPALColour
;src/main.c:88: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(3,3), 0x4000);   // Clear de Screen BGCOLOR=Black
	ld	hl, #0x0303
	push	hl
	call	_cpct_px2byteM0
	ld	b, l
	ld	hl, #0x4000
	push	hl
	push	bc
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:93: vmem = cpct_getScreenPtr (CPCT_VMEM_START, 12, 32);
	ld	hl, #0x200c
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:98: drawWindow2(10,60,60,60);
	ld	hl, #0x3c3c
	push	hl
	ld	l, #0x0a
	push	hl
	call	_drawWindow2
	pop	af
	pop	af
;src/main.c:101: drawText2("GEMQUEST IS READY!!", 20, 82,  COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
	ld	hl, #0x0001
	push	hl
	ld	l, #0x52
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	ld	hl, #___str_0
	push	hl
	call	_drawText2
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/main.c:102: drawText2("Press any key to continue", 15, 102,  COLORTXT_YELLOW, NORMALHEIGHT, OPAQUE);
	ld	hl, #0x0001
	push	hl
	ld	hl, #0x0166
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	ld	hl, #___str_1
	push	hl
	call	_drawText2
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/main.c:104: seed = wait4UserKeypress();
	call	_wait4UserKeypress
;src/main.c:106: if (!seed)
	ld	a, d
	or	a, e
	or	a, h
	or	a,l
	jr	NZ,00102$
;src/main.c:107: seed++;
	inc	l
	jr	NZ,00109$
	inc	h
	jr	NZ,00109$
	inc	e
	jr	NZ,00109$
	inc	d
00109$:
00102$:
;src/main.c:108: cpct_srand(seed);
	call	_cpct_setSeed_mxor
	call	_cpct_restoreState_mxor_u8
;src/main.c:114: initKeys();
	call	_initKeys
	ret
___str_0:
	.ascii "GEMQUEST IS READY!!"
	.db 0x00
___str_1:
	.ascii "Press any key to continue"
	.db 0x00
;src/main.c:118: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:120: cpct_setStackLocation(NEW_STACK_LOCATION);
	ld	hl, #0x0100
	call	_cpct_setStackLocation
;src/main.c:122: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:124: cpct_setInterruptHandler( myInterruptHandler );
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:126: initMain();
	call	_initMain
;src/main.c:127: initGame();
	call	_initGame
;src/main.c:128: playGame();
	call	_playGame
;src/main.c:131: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(3,3), 0x4000);   // Clear de Screen BGCOLOR=Black
	ld	hl, #0x0303
	push	hl
	call	_cpct_px2byteM0
	ld	b, l
	ld	hl, #0x4000
	push	hl
	push	bc
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/main.c:133: drawWindow();
	call	_drawWindow
;src/main.c:134: drawText2("PRESS ANY KEY TO END", 18, 98,  COLORTXT_YELLOW, NORMALHEIGHT, OPAQUE);
	ld	hl, #0x0001
	push	hl
	ld	hl, #0x0162
	push	hl
	ld	a, #0x12
	push	af
	inc	sp
	ld	hl, #___str_2
	push	hl
	call	_drawText2
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/main.c:135: wait4OneKey();
	call	_wait4OneKey
;src/main.c:136: reset_cpc();
	call	_reset_cpc
	ret
___str_2:
	.ascii "PRESS ANY KEY TO END"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
