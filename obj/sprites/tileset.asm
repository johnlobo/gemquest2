;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module tileset
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_tileset_20
	.globl _g_tileset_19
	.globl _g_tileset_18
	.globl _g_tileset_17
	.globl _g_tileset_16
	.globl _g_tileset_15
	.globl _g_tileset_14
	.globl _g_tileset_13
	.globl _g_tileset_12
	.globl _g_tileset_11
	.globl _g_tileset_10
	.globl _g_tileset_09
	.globl _g_tileset_08
	.globl _g_tileset_07
	.globl _g_tileset_06
	.globl _g_tileset_05
	.globl _g_tileset_04
	.globl _g_tileset_03
	.globl _g_tileset_02
	.globl _g_tileset_01
	.globl _g_tileset_00
	.globl _g_tileset
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
_g_tileset:
	.dw _g_tileset_00
	.dw _g_tileset_01
	.dw _g_tileset_02
	.dw _g_tileset_03
	.dw _g_tileset_04
	.dw _g_tileset_05
	.dw _g_tileset_06
	.dw _g_tileset_07
	.dw _g_tileset_08
	.dw _g_tileset_09
	.dw _g_tileset_10
	.dw _g_tileset_11
	.dw _g_tileset_12
	.dw _g_tileset_13
	.dw _g_tileset_14
	.dw _g_tileset_15
	.dw _g_tileset_16
	.dw _g_tileset_17
	.dw _g_tileset_18
	.dw _g_tileset_19
	.dw _g_tileset_20
_g_tileset_00:
	.db #0x00	; 0
	.db #0xe9	; 233
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0x83	; 131
	.db #0xa9	; 169
	.db #0x02	; 2
	.db #0x41	; 65	'A'
	.db #0x56	; 86	'V'
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0xa8	; 168
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x54	; 84	'T'
	.db #0xc3	; 195
	.db #0x00	; 0
_g_tileset_01:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
_g_tileset_02:
	.db #0xf0	; 240
	.db #0xe4	; 228
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf0	; 240
	.db #0xe4	; 228
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xe4	; 228
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xe4	; 228
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_g_tileset_03:
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_g_tileset_04:
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf0	; 240
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xd8	; 216
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xd8	; 216
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
_g_tileset_05:
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x64	; 100	'd'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x30	; 48	'0'
	.db #0xcc	; 204
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x30	; 48	'0'
	.db #0x64	; 100	'd'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_g_tileset_06:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0xf0	; 240
_g_tileset_07:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0xa0	; 160
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
_g_tileset_08:
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
_g_tileset_09:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0xa9	; 169
	.db #0xf0	; 240
	.db #0xa9	; 169
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
_g_tileset_10:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa1	; 161
	.db #0x56	; 86	'V'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa1	; 161
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
_g_tileset_11:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
_g_tileset_12:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x52	; 82	'R'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
_g_tileset_13:
	.db #0xf0	; 240
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xa1	; 161
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
_g_tileset_14:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
_g_tileset_15:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa9	; 169
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x56	; 86	'V'
	.db #0xa9	; 169
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
_g_tileset_16:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa1	; 161
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xa1	; 161
	.db #0x56	; 86	'V'
	.db #0x56	; 86	'V'
	.db #0xfc	; 252
	.db #0xa9	; 169
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
_g_tileset_17:
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0xf8	; 248
_g_tileset_18:
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x22	; 34
	.db #0x05	; 5
	.db #0x0b	; 11
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x27	; 39
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x1b	; 27
	.db #0x27	; 39
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x27	; 39
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x87	; 135
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x43	; 67	'C'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x01	; 1
_g_tileset_19:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x16	; 22
	.db #0xc3	; 195
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0xbc	; 188
	.db #0xc3	; 195
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0xa9	; 169
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
_g_tileset_20:
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.area _INITIALIZER
	.area _CABS (ABS)
