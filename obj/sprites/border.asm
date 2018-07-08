;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module border
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_border_7
	.globl _g_border_6
	.globl _g_border_5
	.globl _g_border_4
	.globl _g_border_3
	.globl _g_border_2
	.globl _g_border_1
	.globl _g_border_0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
	.area _CODE
_g_border_0:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x0f	; 15
	.db #0x2f	; 47
	.db #0x0f	; 15
	.db #0x2f	; 47
	.db #0x0a	; 10
_g_border_1:
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x1f	; 31
_g_border_2:
	.db #0x2f	; 47
	.db #0x0a	; 10
	.db #0x2f	; 47
	.db #0x0f	; 15
	.db #0x2f	; 47
	.db #0x0f	; 15
	.db #0x15	; 21
	.db #0x3f	; 63
_g_border_3:
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x2a	; 42
_g_border_4:
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
_g_border_5:
	.db #0x2f	; 47
	.db #0x0a	; 10
	.db #0x2f	; 47
	.db #0x0a	; 10
	.db #0x2f	; 47
	.db #0x0a	; 10
	.db #0x2f	; 47
	.db #0x0a	; 10
_g_border_6:
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x1f	; 31
_g_border_7:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.area _INITIALIZER
	.area _CABS (ABS)
