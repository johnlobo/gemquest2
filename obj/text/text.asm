;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module text
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _itoa
	.globl _cpct_getScreenPtr
	.globl _cpct_waitVSYNC
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSprite
	.globl _swapColors
	.globl _numbers
	.globl _font
	.globl _strLength
	.globl _strCopy
	.globl _drawNumber
	.globl _drawText
	.globl _drawText2
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
;src/text/text.c:54: char *itoa(int value, char *result, int base)
;	---------------------------------
; Function itoa
; ---------------------------------
_itoa::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
;src/text/text.c:58: char *ptr = result, *ptr1 = result, tmp_char;
	ld	e,6 (ix)
	ld	d,7 (ix)
	ld	-6 (ix), e
	ld	-5 (ix), d
;src/text/text.c:61: if (base < 2 || base > 36)
	ld	a, 8 (ix)
	sub	a, #0x02
	ld	a, 9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00101$
	ld	a, #0x24
	cp	a, 8 (ix)
	ld	a, #0x00
	sbc	a, 9 (ix)
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P, 00115$
00101$:
;src/text/text.c:63: *result = '\0';
	xor	a, a
	ld	(de), a
;src/text/text.c:64: return result;
	ex	de,hl
	jp	00112$
;src/text/text.c:67: do
00115$:
	ld	-2 (ix), e
	ld	-1 (ix), d
00104$:
;src/text/text.c:69: tmp_value = value;
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
;src/text/text.c:70: value /= base;
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	4 (ix), l
	ld	5 (ix), h
;src/text/text.c:71: *ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
	ld	c, -4 (ix)
	ld	e, 4 (ix)
	ld	h, 8 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00141$:
	add	hl, hl
	jr	NC,00142$
	add	hl, de
00142$:
	djnz	00141$
	ld	a, c
	sub	a, l
	add	a, #0x23
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	hl, #___str_0
	add	hl, bc
	ld	c, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), c
	inc	-2 (ix)
	jr	NZ,00143$
	inc	-1 (ix)
00143$:
;src/text/text.c:73: while ( value );
	ld	a, 5 (ix)
	or	a,4 (ix)
	jr	NZ,00104$
;src/text/text.c:76: if (tmp_value < 0) *ptr++ = '-';
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	bit	7, -3 (ix)
	jr	Z,00108$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), #0x2d
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	inc	bc
00108$:
;src/text/text.c:77: *ptr-- = '\0';
	xor	a, a
	ld	(bc), a
	dec	bc
;src/text/text.c:78: while(ptr1 < ptr)
	ld	e,-6 (ix)
	ld	d,-5 (ix)
00109$:
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC,00111$
;src/text/text.c:80: tmp_char = *ptr;
	ld	a, (bc)
	ld	-7 (ix), a
;src/text/text.c:81: *ptr-- = *ptr1;
	ld	a, (de)
	ld	(bc), a
	dec	bc
;src/text/text.c:82: *ptr1++ = tmp_char;
	ld	a, -7 (ix)
	ld	(de), a
	inc	de
	jr	00109$
00111$:
;src/text/text.c:84: return result;
	ld	l,6 (ix)
	ld	h,7 (ix)
00112$:
	ld	sp, ix
	pop	ix
	ret
_font:
	.dw _g_fonts_small_00
	.dw _g_fonts_small_01
	.dw _g_fonts_small_02
	.dw _g_fonts_small_03
	.dw _g_fonts_small_04
	.dw _g_fonts_small_05
	.dw _g_fonts_small_06
	.dw _g_fonts_small_07
	.dw _g_fonts_small_08
	.dw _g_fonts_small_09
	.dw _g_fonts_small_10
	.dw _g_fonts_small_11
	.dw _g_fonts_small_12
	.dw _g_fonts_small_13
	.dw _g_fonts_small_14
	.dw _g_fonts_small_15
	.dw _g_fonts_small_16
	.dw _g_fonts_small_17
	.dw _g_fonts_small_18
	.dw _g_fonts_small_19
	.dw _g_fonts_small_20
	.dw _g_fonts_small_21
	.dw _g_fonts_small_22
	.dw _g_fonts_small_23
	.dw _g_fonts_small_24
	.dw _g_fonts_small_25
	.dw _g_fonts_small_26
	.dw _g_fonts_small_27
	.dw _g_fonts_small_28
_numbers:
	.dw _g_numbers_small_00
	.dw _g_numbers_small_01
	.dw _g_numbers_small_02
	.dw _g_numbers_small_03
	.dw _g_numbers_small_04
	.dw _g_numbers_small_05
	.dw _g_numbers_small_06
	.dw _g_numbers_small_07
	.dw _g_numbers_small_08
	.dw _g_numbers_small_09
	.dw _g_numbers_small_10
	.dw _g_numbers_small_11
	.dw _g_numbers_small_12
	.dw _g_numbers_small_13
	.dw _g_numbers_small_14
_swapColors:
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x3e	; 62
	.db #0x3c	; 60
	.db #0x28	; 40
	.db #0x14	; 20
	.db #0x7a	; 122	'z'
	.db #0xf0	; 240
	.db #0xa0	; 160
	.db #0x50	; 80	'P'
	.db #0x3b	; 59
	.db #0x33	; 51	'3'
	.db #0x22	; 34
	.db #0x11	; 17
	.db #0x3a	; 58
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x7b	; 123
	.db #0xf3	; 243
	.db #0xa2	; 162
	.db #0x51	; 81	'Q'
___str_0:
	.ascii "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmno"
	.ascii "pqrstuvwxyz"
	.db 0x00
;src/text/text.c:97: u8 strLength(u8 str[]) {
;	---------------------------------
; Function strLength
; ---------------------------------
_strLength::
;src/text/text.c:101: while (str[result] != '\0') {
	ld	c, #0x00
00101$:
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z,00103$
;src/text/text.c:102: result++;
	inc	c
	jr	00101$
00103$:
;src/text/text.c:104: return result;
	ld	l, c
	ret
;src/text/text.c:118: void strCopy(u8 *str1, u8 *str2){
;	---------------------------------
; Function strCopy
; ---------------------------------
_strCopy::
;src/text/text.c:120: while (str1[i] != '\0'){
	ld	c, #0x00
00101$:
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, b
	or	a, a
	ret	Z
;src/text/text.c:121: str2[i] = str1[i];
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	add	a, c
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	ld	a, b
	ld	(de), a
;src/text/text.c:122: i++;
	inc	c
	jr	00101$
;src/text/text.c:135: void drawNumber(i32 aNumber, u8 length, u8 xPos, u8 yPos, u8 delay) {
;	---------------------------------
; Function drawNumber
; ---------------------------------
_drawNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
;src/text/text.c:145: itoa(aNumber, str, 10);
	ld	sp, hl
	inc	hl
	inc	hl
	ld	c,l
	ld	b,h
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	push	de
	pop	iy
	push	bc
	ld	de, #0x000a
	push	de
	push	hl
	push	iy
	call	_itoa
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/text/text.c:147: zeros = length - strLength(str);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_strLength
	pop	af
	pop	bc
	ld	a, 8 (ix)
	sub	a, l
	ld	-7 (ix), a
;src/text/text.c:149: number = str[x];
	ld	a, (bc)
	ld	e, a
;src/text/text.c:151: while (number != '\0') {
	ld	-8 (ix), #0x00
00103$:
	ld	a, e
	or	a, a
	jr	Z,00106$
;src/text/text.c:153: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (zeros + x) * FONT_W + xPos, yPos);
	ld	a, -7 (ix)
	add	a, -8 (ix)
	add	a, a
	add	a, 9 (ix)
	ld	d, a
	push	bc
	push	de
	ld	a, 10 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/text/text.c:154: cpct_drawSpriteMaskedAlignedTable(numbers[number - 44], pvideo, FONT_W, FONT_H, g_tablatrans);
	push	hl
	pop	iy
	ld	a, e
	add	a, #0xd4
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	de, #_numbers
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #_g_tablatrans
	push	hl
	ld	hl, #0x0502
	push	hl
	push	iy
	push	de
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	bc
;src/text/text.c:155: number = str[++x];
	inc	-8 (ix)
	ld	l,-8 (ix)
	ld	h,#0x00
	add	hl, bc
	ld	e, (hl)
;src/text/text.c:158: if (delay){
	ld	a, 11 (ix)
	or	a, a
	jr	Z,00103$
;src/text/text.c:159: cpct_waitVSYNC ();
	push	bc
	push	de
	call	_cpct_waitVSYNC
	call	_cpct_waitVSYNC
	pop	de
	pop	bc
	jr	00103$
00106$:
	ld	sp, ix
	pop	ix
	ret
;src/text/text.c:176: void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered, u8 delay) {
;	---------------------------------
; Function drawText
; ---------------------------------
_drawText::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/text/text.c:182: if (centered) {
	ld	a, 8 (ix)
	or	a, a
	jr	Z,00102$
;src/text/text.c:183: x = strLength(text);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_strLength
	pop	af
;src/text/text.c:184: xPos = 39 - (x / 2) * FONT_W;
	srl	l
	sla	l
	ld	a, #0x27
	sub	a, l
	ld	6 (ix), a
00102$:
;src/text/text.c:190: character = text[x];
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a, (bc)
	ld	e, a
;src/text/text.c:192: while (character != '\0') {
	ld	-1 (ix), #0x00
00111$:
	ld	a, e
	or	a, a
	jp	Z, 00114$
;src/text/text.c:194: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (x * FONT_W) + xPos, yPos);
	ld	a, -1 (ix)
	add	a, a
	add	a, 6 (ix)
	ld	d, a
	push	bc
	push	de
	ld	a, 7 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/text/text.c:199: cpct_drawSpriteMaskedAlignedTable(numbers[character - 44], pvideo, FONT_W, FONT_H, g_tablatrans);
	push	hl
	pop	iy
;src/text/text.c:197: if (character >= 44 && character <= 58) {
	ld	a, e
	sub	a, #0x2c
	jr	C,00106$
	ld	a, #0x3a
	sub	a, e
	jr	C,00106$
;src/text/text.c:199: cpct_drawSpriteMaskedAlignedTable(numbers[character - 44], pvideo, FONT_W, FONT_H, g_tablatrans);
	ld	a, e
	add	a, #0xd4
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	de, #_numbers
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #_g_tablatrans
	push	hl
	ld	hl, #0x0502
	push	hl
	push	iy
	push	de
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	bc
	jr	00107$
00106$:
;src/text/text.c:202: else if (character != 32) { //32 = SPACE
;src/text/text.c:204: cpct_drawSpriteMaskedAlignedTable(font[character - 63], pvideo, FONT_W, FONT_H, g_tablatrans);
	ld	a,e
	cp	a,#0x20
	jr	Z,00107$
	add	a, #0xc1
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	de, #_font
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	hl, #_g_tablatrans
	push	hl
	ld	hl, #0x0502
	push	hl
	push	iy
	push	de
	call	_cpct_drawSpriteMaskedAlignedTable
	pop	bc
00107$:
;src/text/text.c:207: character = text[++x];
	inc	-1 (ix)
	ld	l,-1 (ix)
	ld	h,#0x00
	add	hl, bc
	ld	e, (hl)
;src/text/text.c:210: if (delay){
	ld	a, 9 (ix)
	or	a, a
	jp	Z, 00111$
;src/text/text.c:211: cpct_waitVSYNC ();
	push	bc
	push	de
	call	_cpct_waitVSYNC
	call	_cpct_waitVSYNC
	pop	de
	pop	bc
	jp	00111$
00114$:
	inc	sp
	pop	ix
	ret
;src/text/text.c:221: void drawText2(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
;	---------------------------------
; Function drawText2
; ---------------------------------
_drawText2::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-83
	add	hl, sp
	ld	sp, hl
;src/text/text.c:232: color1 = swapColors[color][0];
	ld	bc, #_swapColors+0
	ld	l, 8 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	pop	iy
	ld	a, 0 (iy)
	ld	-42 (ix), a
;src/text/text.c:233: color2 = swapColors[color][1];
	push	iy
	pop	hl
	inc	hl
	ld	a, (hl)
	ld	-43 (ix), a
;src/text/text.c:234: color3 = swapColors[color][2];
	push	iy
	pop	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-44 (ix), a
;src/text/text.c:235: color4 = swapColors[color][3];
	ld	a, 3 (iy)
	ld	-47 (ix), a
;src/text/text.c:241: character = text[x];
	ld	a, 4 (ix)
	ld	-25 (ix), a
	ld	a, 5 (ix)
	ld	-24 (ix), a
	ld	l,-25 (ix)
	ld	h,-24 (ix)
	ld	a, (hl)
	ld	-39 (ix), a
;src/text/text.c:243: while (character != '\0') {
	ld	hl, #0x0000
	add	hl, sp
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, -5 (ix)
	ld	-34 (ix), a
	ld	a, -4 (ix)
	ld	-33 (ix), a
	ld	a, -5 (ix)
	ld	-29 (ix), a
	ld	a, -4 (ix)
	ld	-28 (ix), a
	ld	a, -5 (ix)
	ld	-27 (ix), a
	ld	a, -4 (ix)
	ld	-26 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-15 (ix), a
	ld	a, -4 (ix)
	ld	-14 (ix), a
	ld	a, -5 (ix)
	ld	-20 (ix), a
	ld	a, -4 (ix)
	ld	-19 (ix), a
	ld	a, -5 (ix)
	ld	-18 (ix), a
	ld	a, -4 (ix)
	ld	-17 (ix), a
	ld	a, -5 (ix)
	ld	-12 (ix), a
	ld	a, -4 (ix)
	ld	-11 (ix), a
	ld	a, -5 (ix)
	ld	-38 (ix), a
	ld	a, -4 (ix)
	ld	-37 (ix), a
	ld	a, 9 (ix)
	dec	a
	jr	NZ,00261$
	ld	a,#0x01
	jr	00262$
00261$:
	xor	a,a
00262$:
	ld	-21 (ix), a
	ld	a, 9 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	-6 (ix), a
	ld	a, -5 (ix)
	ld	-31 (ix), a
	ld	a, -4 (ix)
	ld	-30 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
	ld	a, -5 (ix)
	ld	-36 (ix), a
	ld	a, -4 (ix)
	ld	-35 (ix), a
	ld	-41 (ix), #0x00
00148$:
	ld	a, -39 (ix)
	or	a, a
	jp	Z, 00153$
;src/text/text.c:246: if (character != 32) { //32 = SPACE
	ld	a, -39 (ix)
	sub	a, #0x20
	jp	Z,00147$
;src/text/text.c:250: switch(character){
	ld	a, -39 (ix)
	sub	a, #0x21
	jr	Z,00104$
	ld	a, -39 (ix)
	sub	a, #0x22
	jr	Z,00103$
	ld	a, -39 (ix)
	sub	a, #0x26
	jr	Z,00108$
	ld	a, -39 (ix)
	sub	a, #0x27
	jr	Z,00109$
	ld	a, -39 (ix)
	sub	a, #0x28
	jr	Z,00105$
	ld	a, -39 (ix)
	sub	a, #0x29
	jr	Z,00106$
	ld	a, -39 (ix)
	sub	a, #0x2c
	jr	Z,00102$
	ld	a, -39 (ix)
	sub	a, #0x2e
	jr	Z,00101$
	ld	a, -39 (ix)
	sub	a, #0x2f
	jr	Z,00107$
	jr	00110$
;src/text/text.c:252: case 46:
00101$:
;src/text/text.c:253: character=60;
	ld	-39 (ix), #0x3c
;src/text/text.c:254: break;
	jr	00110$
;src/text/text.c:257: case 44:
00102$:
;src/text/text.c:258: character=61;
	ld	-39 (ix), #0x3d
;src/text/text.c:259: break;
	jr	00110$
;src/text/text.c:262: case 34:
00103$:
;src/text/text.c:263: character=62;
	ld	-39 (ix), #0x3e
;src/text/text.c:264: break;
	jr	00110$
;src/text/text.c:267: case 33:
00104$:
;src/text/text.c:268: character=64;
	ld	-39 (ix), #0x40
;src/text/text.c:269: break;
	jr	00110$
;src/text/text.c:272: case 40:
00105$:
;src/text/text.c:273: character=91;
	ld	-39 (ix), #0x5b
;src/text/text.c:274: break;
	jr	00110$
;src/text/text.c:277: case 41:
00106$:
;src/text/text.c:278: character=93;
	ld	-39 (ix), #0x5d
;src/text/text.c:279: break;
	jr	00110$
;src/text/text.c:282: case 47:
00107$:
;src/text/text.c:283: character=92;
	ld	-39 (ix), #0x5c
;src/text/text.c:284: break;
	jr	00110$
;src/text/text.c:286: case 38:
00108$:
;src/text/text.c:287: character=94;
	ld	-39 (ix), #0x5e
;src/text/text.c:288: break;
	jr	00110$
;src/text/text.c:290: case 39:
00109$:
;src/text/text.c:291: character=96;
	ld	-39 (ix), #0x60
;src/text/text.c:293: }
00110$:
;src/text/text.c:296: character-=48;
	ld	a, -39 (ix)
	add	a, #0xd0
;src/text/text.c:299: for(i=0;i<18;i++){
	ld	-40 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_g_font_chars
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	e, #0x00
00151$:
;src/text/text.c:300: pChar = g_font_chars + (character*18) + i;
	ld	l,e
	ld	h,#0x00
	add	hl, bc
;src/text/text.c:304: if(*pChar == 0x7f) colorchar[i]=color1;
	ld	-46 (ix), l
	ld	-45 (ix), h
	ld	a, (hl)
	ld	-13 (ix), a
	sub	a, #0x7f
	jr	NZ,00273$
	ld	a,#0x01
	jr	00274$
00273$:
	xor	a,a
00274$:
	ld	-16 (ix), a
;src/text/text.c:305: else if(*pChar == 0xff) colorchar[i]=color2;
	ld	a, -13 (ix)
	inc	a
	jr	NZ,00275$
	ld	a,#0x01
	jr	00276$
00275$:
	xor	a,a
00276$:
	ld	-32 (ix), a
;src/text/text.c:306: else if(*pChar == 0xaa) colorchar[i]=color3;
	ld	a, -13 (ix)
	sub	a, #0xaa
	jr	NZ,00277$
	ld	a,#0x01
	jr	00278$
00277$:
	xor	a,a
00278$:
	ld	-22 (ix), a
;src/text/text.c:307: else if(*pChar == 0x55) colorchar[i]=color4;
	ld	a, -13 (ix)
	sub	a, #0x55
	jr	NZ,00279$
	ld	a,#0x01
	jr	00280$
00279$:
	xor	a,a
00280$:
	ld	-23 (ix), a
;src/text/text.c:302: if(size==1) {
	ld	a, -21 (ix)
	or	a, a
	jr	Z,00136$
;src/text/text.c:304: if(*pChar == 0x7f) colorchar[i]=color1;
	ld	a, -16 (ix)
	or	a, a
	jr	Z,00121$
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	ld	d, #0x00
	add	hl, de
	ld	a, -42 (ix)
	ld	(hl), a
	jp	00152$
00121$:
;src/text/text.c:305: else if(*pChar == 0xff) colorchar[i]=color2;
	ld	a, -32 (ix)
	or	a, a
	jr	Z,00118$
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	ld	d, #0x00
	add	hl, de
	ld	a, -43 (ix)
	ld	(hl), a
	jp	00152$
00118$:
;src/text/text.c:306: else if(*pChar == 0xaa) colorchar[i]=color3;
	ld	a, -22 (ix)
	or	a, a
	jr	Z,00115$
	ld	l,-18 (ix)
	ld	h,-17 (ix)
	ld	d, #0x00
	add	hl, de
	ld	a, -44 (ix)
	ld	(hl), a
	jp	00152$
00115$:
;src/text/text.c:307: else if(*pChar == 0x55) colorchar[i]=color4;
	ld	a, -23 (ix)
	or	a, a
	jr	Z,00112$
	ld	l,-20 (ix)
	ld	h,-19 (ix)
	ld	d, #0x00
	add	hl, de
	ld	a, -47 (ix)
	ld	(hl), a
	jp	00152$
00112$:
;src/text/text.c:308: else colorchar[i]=*pChar;
	ld	l,-15 (ix)
	ld	h,-14 (ix)
	ld	d, #0x00
	add	hl, de
	ld	a, -13 (ix)
	ld	(hl), a
	jp	00152$
00136$:
;src/text/text.c:313: pos=(i*size)-(i%FONT2_W);
	push	de
	push	bc
	ld	h, 9 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00281$:
	add	hl, hl
	jr	NC,00282$
	add	hl, de
00282$:
	djnz	00281$
	pop	bc
	pop	de
	ld	a, e
	and	a, #0x01
	ld	d, a
	ld	a, l
	sub	a, d
	ld	l, a
;src/text/text.c:317: colorchar[pos+FONT2_W]=color1;
	ld	d, l
	inc	d
	inc	d
;src/text/text.c:315: if(*pChar == 0x7f) {
	ld	a, -16 (ix)
	or	a, a
	jr	Z,00133$
;src/text/text.c:316: colorchar[pos]=color1;
	ld	a, -3 (ix)
	add	a, l
	ld	l, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -42 (ix)
	ld	(hl), a
;src/text/text.c:317: colorchar[pos+FONT2_W]=color1;
	ld	a, -3 (ix)
	add	a, d
	ld	l, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -42 (ix)
	ld	(hl), a
	jp	00152$
00133$:
;src/text/text.c:319: else if(*pChar == 0xff) {
	ld	a, -32 (ix)
	or	a, a
	jr	Z,00130$
;src/text/text.c:320: colorchar[pos]=color2;
	ld	a, -27 (ix)
	add	a, l
	ld	l, a
	ld	a, -26 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -43 (ix)
	ld	(hl), a
;src/text/text.c:321: colorchar[pos+FONT2_W]=color2;
	ld	a, -27 (ix)
	add	a, d
	ld	l, a
	ld	a, -26 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -43 (ix)
	ld	(hl), a
	jr	00152$
00130$:
;src/text/text.c:323: else if(*pChar == 0xaa) {
	ld	a, -22 (ix)
	or	a, a
	jr	Z,00127$
;src/text/text.c:324: colorchar[pos]=color3;
	ld	a, -29 (ix)
	add	a, l
	ld	l, a
	ld	a, -28 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -44 (ix)
	ld	(hl), a
;src/text/text.c:325: colorchar[pos+FONT2_W]=color3;
	ld	a, -29 (ix)
	add	a, d
	ld	l, a
	ld	a, -28 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -44 (ix)
	ld	(hl), a
	jr	00152$
00127$:
;src/text/text.c:327: else if(*pChar == 0x55) {
	ld	a, -23 (ix)
	or	a, a
	jr	Z,00124$
;src/text/text.c:328: colorchar[pos]=color4;
	ld	a, -34 (ix)
	add	a, l
	ld	l, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -47 (ix)
	ld	(hl), a
;src/text/text.c:329: colorchar[pos+FONT2_W]=color4;
	ld	a, -34 (ix)
	add	a, d
	ld	l, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -47 (ix)
	ld	(hl), a
	jr	00152$
00124$:
;src/text/text.c:332: colorchar[pos]=*pChar;
	ld	a, -5 (ix)
	add	a, l
	ld	l, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -13 (ix)
	ld	(hl), a
;src/text/text.c:333: colorchar[pos+FONT2_W]=*pChar;
	push	hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	ld	c,d
	ld	b,#0x00
	add	iy, bc
	pop	bc
	ld	l,-46 (ix)
	ld	h,-45 (ix)
	ld	d, (hl)
	ld	0 (iy), d
00152$:
;src/text/text.c:299: for(i=0;i<18;i++){
	inc	e
	ld	a, e
	sub	a, #0x12
	jp	C, 00151$
;src/text/text.c:342: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/text/text.c:343: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, 10 (ix)
	or	a, a
	jr	Z,00140$
	ld	de, #_g_tablatrans
	ld	c,-36 (ix)
	ld	b,-35 (ix)
	push	de
	ld	d, -1 (ix)
	ld	e,#0x02
	push	de
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00141$
00140$:
;src/text/text.c:344: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
	ld	a, -31 (ix)
	ld	-10 (ix), a
	ld	a, -30 (ix)
	ld	-9 (ix), a
	ld	d, -6 (ix)
	ld	e,#0x02
	push	de
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	call	_cpct_drawSprite
00141$:
;src/text/text.c:347: if(character == 48 || character == 60 || character == 57) xPos--;
	ld	a, -40 (ix)
	sub	a, #0x30
	jr	Z,00142$
	ld	a, -40 (ix)
	sub	a, #0x3c
	jr	Z,00142$
	ld	a, -40 (ix)
	sub	a, #0x39
	jr	NZ,00147$
00142$:
	dec	6 (ix)
00147$:
;src/text/text.c:350: character = text[++x];
	inc	-41 (ix)
	ld	a, -25 (ix)
	add	a, -41 (ix)
	ld	l, a
	ld	a, -24 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	-39 (ix), a
;src/text/text.c:351: xPos+=FONT2_W;
	inc	6 (ix)
	inc	6 (ix)
	jp	00148$
00153$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
