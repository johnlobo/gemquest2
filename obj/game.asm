;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _playGame
	.globl _initGame
	.globl _playCombat
	.globl _cpct_px2byteM0
	.globl _cpct_memset
	.globl _npc
	.globl _hero
	.globl _keys
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_keys::
	.ds 18
_hero::
	.ds 4
_npc::
	.ds 4
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
;src/game.c:37: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/game.c:40: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);    // Clear de Screen BGCOLOR=Black
	ld	hl, #0x0000
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
	ret
;src/game.c:46: void playGame(){
;	---------------------------------
; Function playGame
; ---------------------------------
_playGame::
;src/game.c:47: playCombat(&hero, &npc);
	ld	hl, #_npc
	push	hl
	ld	hl, #_hero
	push	hl
	call	_playCombat
	pop	af
	pop	af
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
