;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module tools
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _clearWindow
	.globl _clearScreen
	.globl _fast_abs
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM0
	.globl _cpct_memset
	.globl _delay
	.globl _distance
	.globl _sign
	.globl _collision
	.globl _abs
	.globl _drawFrame
	.globl _drawWindow
	.globl _drawWindow2
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
;src/util/tools.c:32: void delay(u32 cycles)
;	---------------------------------
; Function delay
; ---------------------------------
_delay::
;src/util/tools.c:35: for (i = 0; i < cycles; i++)
	ld	bc,#0x0000
	ld	de,#0x0000
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	a, e
	inc	hl
	sbc	a, (hl)
	ld	a, d
	inc	hl
	sbc	a, (hl)
	ret	NC
;src/util/tools.c:39: __endasm;
	halt
;src/util/tools.c:35: for (i = 0; i < cycles; i++)
	inc	c
	jr	NZ,00103$
	inc	b
	jr	NZ,00103$
	inc	e
	jr	NZ,00103$
	inc	d
	jr	00103$
;src/util/tools.c:78: u16 distance (u16 x1, u16 y1, u16 x2, u16 y2)
;	---------------------------------
; Function distance
; ---------------------------------
_distance::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/util/tools.c:80: u16 x = fast_abs( x2 - x1 );  // x = valor absoluto de x2 – x1, es decir, la distancia entre las x
	ld	a, 8 (ix)
	sub	a, 4 (ix)
	ld	l, a
	ld	a, 9 (ix)
	sbc	a, 5 (ix)
	ld	h, a
	call	_fast_abs
	ld	c, l
	ld	b, h
;src/util/tools.c:81: u16 y = fast_abs( y2 - y1 );  // y = valor absoluto de y2 – y1, es decir, la distancia entre las y
	ld	a, 10 (ix)
	sub	a, 6 (ix)
	ld	l, a
	ld	a, 11 (ix)
	sbc	a, 7 (ix)
	ld	h, a
	push	bc
	call	_fast_abs
	pop	bc
;src/util/tools.c:83: u16 min = x < y ? x : y; // Si x < y min = x, si no, vale y. Es decir, el menor de los 2
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC,00103$
	ld	e, c
	ld	d, b
	jr	00104$
00103$:
	ld	e, l
	ld	d, h
00104$:
;src/util/tools.c:85: return ( x + y - (min >> 1) - (min >> 2) + (min >> 4) );
	add	hl, bc
	ld	c, e
	ld	b, d
	srl	b
	rr	c
	cp	a, a
	sbc	hl, bc
	ld	c, e
	ld	b, d
	srl	b
	rr	c
	srl	b
	rr	c
	cp	a, a
	sbc	hl, bc
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	add	hl, de
	pop	ix
	ret
;src/util/tools.c:96: i16 sign(i16 x)
;	---------------------------------
; Function sign
; ---------------------------------
_sign::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/util/tools.c:98: return  (x > 0) - (x < 0);
	xor	a, a
	cp	a, 4 (ix)
	sbc	a, 5 (ix)
	jp	PO, 00103$
	xor	a, #0x80
00103$:
	rlca
	and	a,#0x01
	ld	l, a
	ld	h, #0x00
	ld	a, 5 (ix)
	rlca
	and	a,#0x01
	ld	c, a
	ld	b, #0x00
	cp	a, a
	sbc	hl, bc
	pop	ix
	ret
;src/util/tools.c:111: u8 collision(u8 x1, u8 y1, u8 w1, u8 h1, u8 x2, u8 y2, u8 w2, u8 h2)
;	---------------------------------
; Function collision
; ---------------------------------
_collision::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/util/tools.c:113: return  ((x1 < x2 + w2) && (x1 + w1 > x2) &&  (y1 < y2 + h2) && (h1 + y1 > y2));
	ld	c, 8 (ix)
	ld	b, #0x00
	ld	l, 10 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00103$
	ld	l, 6 (ix)
	ld	h, #0x00
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	P, 00103$
	ld	c, 9 (ix)
	ld	b, #0x00
	ld	l, 11 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00103$
	ld	l, 7 (ix)
	ld	h, #0x00
	add	hl, de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	M, 00104$
00103$:
	ld	l, #0x00
	jr	00105$
00104$:
	ld	l, #0x01
00105$:
	pop	ix
	ret
;src/util/tools.c:124: i16 abs(i16 j)
;	---------------------------------
; Function abs
; ---------------------------------
_abs::
;src/util/tools.c:126: return (j < 0) ? -j : j;
	ld	iy, #2
	add	iy, sp
	bit	7,1 (iy)
	jr	Z,00103$
	xor	a, a
	sub	a, 0 (iy)
	ld	l, a
	ld	a, #0x00
	sbc	a, 1 (iy)
	ld	h, a
	ret
00103$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret
;src/util/tools.c:138: void clearScreen() {
;	---------------------------------
; Function clearScreen
; ---------------------------------
_clearScreen::
;src/util/tools.c:140: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);
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
;src/util/tools.c:152: void clearWindow(u8 xPos, u8 yPos, u8 width, u8 height) {
;	---------------------------------
; Function clearWindow
; ---------------------------------
_clearWindow::
;src/util/tools.c:154: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:155: cpct_drawSolidBox(pvideo, cpct_px2byteM0(0,0), width, height);
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ret
;src/util/tools.c:168: void drawFrame(u8 x1, u8 y1, u8 x2, u8 y2) {
;	---------------------------------
; Function drawFrame
; ---------------------------------
_drawFrame::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
;src/util/tools.c:172: frame_w = x2 - x1;
	ld	a, 6 (ix)
	sub	a, 4 (ix)
	ld	b, a
	ld	-9 (ix), b
;src/util/tools.c:175: clearWindow(x1, y1, x2 - x1, y2 - y1);
	ld	a, 7 (ix)
	sub	a, 5 (ix)
	ld	d, a
	ld	e, b
	push	de
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	call	_clearWindow
	pop	af
	pop	af
;src/util/tools.c:178: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x1, y1);
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/util/tools.c:179: cpct_drawSprite(g_border_0,  pvideo, 2, 4);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0402
	push	hl
	push	de
	ld	hl, #_g_border_0
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/util/tools.c:182: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
	ld	a, 4 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	-1 (ix), a
	ld	de, #_g_border_4+0
00105$:
	ld	a, 6 (ix)
	ld	h, #0x00
	add	a, #0xfe
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, -1 (ix)
	ld	h, #0x00
;src/util/tools.c:183: cpct_drawSprite(g_border_4,  pvideo + (x - x1), 2, 4);
	ld	a, 4 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;src/util/tools.c:182: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
	ld	a, l
	sub	a, -3 (ix)
	ld	a, h
	sbc	a, -2 (ix)
	jp	PO, 00142$
	xor	a, #0x80
00142$:
	jp	P, 00101$
;src/util/tools.c:183: cpct_drawSprite(g_border_4,  pvideo + (x - x1), 2, 4);
	ld	a, l
	sub	a, -6 (ix)
	ld	l, a
	ld	a, h
	sbc	a, -5 (ix)
	ld	h, a
	add	hl, bc
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0402
	push	hl
	push	iy
	ld	hl, #_g_border_4
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/util/tools.c:182: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
	inc	-1 (ix)
	inc	-1 (ix)
	jr	00105$
00101$:
;src/util/tools.c:187: cpct_drawSprite(g_border_1,  pvideo + (frame_w - 2), 2, 4);
	ld	e, -9 (ix)
	ld	d, #0x00
	dec	de
	dec	de
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0402
	push	hl
	push	bc
	ld	hl, #_g_border_1
	push	hl
	call	_cpct_drawSprite
	pop	de
;src/util/tools.c:190: for (x = y1 + 4; x < (y2 - 4); x = x + 4) {
	ld	a, 5 (ix)
	add	a, #0x04
	ld	-1 (ix), a
00108$:
	ld	a, 7 (ix)
	ld	b, #0x00
	add	a, #0xfc
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, -1 (ix)
	ld	h, #0x00
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	PO, 00143$
	xor	a, #0x80
00143$:
	jp	P, 00102$
;src/util/tools.c:191: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x1, x);
	push	de
	ld	h, -1 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/util/tools.c:192: cpct_drawSprite(g_border_5,  pvideo, 2, 4);
	push	hl
	pop	iy
	push	hl
	push	de
	ld	bc, #0x0402
	push	bc
	push	iy
	ld	bc, #_g_border_5
	push	bc
	call	_cpct_drawSprite
	pop	de
	pop	hl
;src/util/tools.c:193: cpct_drawSprite(g_border_6,  pvideo + (frame_w - 2), 2, 4);
	add	hl, de
	push	de
	ld	bc, #0x0402
	push	bc
	push	hl
	ld	hl, #_g_border_6
	push	hl
	call	_cpct_drawSprite
	pop	de
;src/util/tools.c:190: for (x = y1 + 4; x < (y2 - 4); x = x + 4) {
	inc	-1 (ix)
	inc	-1 (ix)
	inc	-1 (ix)
	inc	-1 (ix)
	jr	00108$
00102$:
;src/util/tools.c:196: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x1, y2 - 4);
	ld	a, 7 (ix)
	add	a, #0xfc
	ld	b, a
	push	de
	push	bc
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
	pop	de
;src/util/tools.c:199: cpct_drawSprite(g_border_2,  pvideo, 2, 4);
	ld	-8 (ix), c
	ld	-7 (ix), b
	push	bc
	push	de
	ld	hl, #0x0402
	push	hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	hl, #_g_border_2
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/util/tools.c:202: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
	ld	a, -4 (ix)
	ld	-8 (ix), a
00111$:
	ld	l, -8 (ix)
	ld	h, #0x00
	ld	a, l
	sub	a, -3 (ix)
	ld	a, h
	sbc	a, -2 (ix)
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	P, 00103$
;src/util/tools.c:203: cpct_drawSprite(g_border_7,  pvideo + (x - x1), 2, 4);
	ld	a, l
	sub	a, -6 (ix)
	ld	l, a
	ld	a, h
	sbc	a, -5 (ix)
	ld	h, a
	add	hl, bc
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0402
	push	hl
	push	iy
	ld	hl, #_g_border_7
	push	hl
	call	_cpct_drawSprite
	pop	de
	pop	bc
;src/util/tools.c:202: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
	inc	-8 (ix)
	inc	-8 (ix)
	jr	00111$
00103$:
;src/util/tools.c:207: cpct_drawSprite(g_border_3,  pvideo + (frame_w - 2), 2, 4);
	ld	l, c
	ld	h, b
	add	hl, de
	ld	bc, #_g_border_3+0
	ld	de, #0x0402
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	ld	sp, ix
	pop	ix
	ret
;src/util/tools.c:210: void drawWindow(){
;	---------------------------------
; Function drawWindow
; ---------------------------------
_drawWindow::
;src/util/tools.c:215: cpct_drawSolidBox ((u16*)62099-5, 0xff, 51-2, 2);
	ld	hl, #0x0231
	push	hl
	ld	a, #0xff
	push	af
	inc	sp
	ld	hl, #0xf28e
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:216: cpct_drawSolidBox ((u16*)62659-5, 0xff, 51-2, 2);
	inc	sp
	ld	hl,#0x0231
	ex	(sp),hl
	ld	a, #0xff
	push	af
	inc	sp
	ld	hl, #0xf4be
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:219: cpct_drawSolidBox ((u16*)49891-5, 0x00, 51-2, 2);
	inc	sp
	ld	hl,#0x0231
	ex	(sp),hl
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xc2de
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:220: cpct_drawSolidBox ((u16*)58563-5, 0x00, 51-2, 2);
	inc	sp
	ld	hl,#0x0231
	ex	(sp),hl
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xe4be
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:223: cpct_drawSolidBox ((u16*)53987-5, 0x3f, 51-2, 58-8);
	inc	sp
	ld	hl,#0x3231
	ex	(sp),hl
	ld	a, #0x3f
	push	af
	inc	sp
	ld	hl, #0xd2de
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:228: cpct_drawSolidBox ((u16*)49890-5, 0x55, 1, 2);
	inc	sp
	ld	hl,#0x0201
	ex	(sp),hl
	ld	a, #0x55
	push	af
	inc	sp
	ld	hl, #0xc2dd
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:231: cpct_drawSolidBox ((u16*)53986-5, 0xaa, 1, 58-8);
	inc	sp
	ld	hl,#0x3201
	ex	(sp),hl
	ld	a, #0xaa
	push	af
	inc	sp
	ld	hl, #0xd2dd
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:234: cpct_drawSolidBox ((u16*)58562-5, 0x55, 1, 2);
	inc	sp
	ld	hl,#0x0201
	ex	(sp),hl
	ld	a, #0x55
	push	af
	inc	sp
	ld	hl, #0xe4bd
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:238: cpct_drawSolidBox ((u16*)49931+2, 0xaa, 1, 2);
	inc	sp
	ld	hl,#0x0201
	ex	(sp),hl
	ld	a, #0xaa
	push	af
	inc	sp
	ld	hl, #0xc30f
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:242: cpct_drawSolidBox ((u16*)54027+2, 0x55, 1, 58-8);
	inc	sp
	ld	hl,#0x3201
	ex	(sp),hl
	ld	a, #0x55
	push	af
	inc	sp
	ld	hl, #0xd30f
	push	hl
	call	_cpct_drawSolidBox
	pop	af
;src/util/tools.c:245: cpct_drawSolidBox ((u16*)58603+2, 0xaa, 1, 2);
	inc	sp
	ld	hl,#0x0201
	ex	(sp),hl
	ld	a, #0xaa
	push	af
	inc	sp
	ld	hl, #0xe4ef
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ret
;src/util/tools.c:249: void drawWindow2(u8 x, u8 y, u8 width, u8 height){
;	---------------------------------
; Function drawWindow2
; ---------------------------------
_drawWindow2::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/util/tools.c:256: cornerUp = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:257: lineUp = cpct_getScreenPtr(CPCT_VMEM_START, x, y+1);
	ld	b, 5 (ix)
	inc	b
	push	bc
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:258: cornerDown = cpct_getScreenPtr(CPCT_VMEM_START, x, y+height);
	ld	a, 5 (ix)
	add	a, 7 (ix)
	ld	-1 (ix), a
	push	af
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:259: lineDown = cpct_getScreenPtr(CPCT_VMEM_START, x, y+height-1);
	ld	b, -1 (ix)
	dec	b
	push	bc
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:264: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y);
	ld	b, 4 (ix)
	inc	b
	push	bc
	ld	a, 5 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/util/tools.c:265: cpct_drawSolidBox (pvideo, 0xff, width-4, 2);
	ld	a, 6 (ix)
	add	a, #0xfc
	ld	c, a
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	ld	d, c
	ld	e,#0xff
	push	de
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/util/tools.c:266: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+height);
	push	bc
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/util/tools.c:267: cpct_drawSolidBox (pvideo, 0xff, width-4, 2);
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	ld	d, c
	ld	e,#0xff
	push	de
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/util/tools.c:269: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+2);
	ld	a, 5 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	push	bc
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/util/tools.c:270: cpct_drawSolidBox (pvideo, 0x00, width-4, 2);
	push	bc
	ld	b, #0x02
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/util/tools.c:271: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+height-2);
	dec	-1 (ix)
	dec	-1 (ix)
	push	bc
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	bc
;src/util/tools.c:272: cpct_drawSolidBox (pvideo, 0x00, width-4, 2);
	push	bc
	ld	b, #0x02
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/util/tools.c:276: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+4);
	ld	d, 5 (ix)
	inc	d
	inc	d
	inc	d
	inc	d
	push	bc
	push	de
	ld	e, b
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/util/tools.c:277: cpct_drawSolidBox (pvideo, 0x3f, width-4, height-6);
	ld	a, 7 (ix)
	add	a, #0xfa
	ld	e, a
	push	de
	ld	a, e
	push	af
	inc	sp
	ld	d, c
	ld	e,#0x3f
	push	de
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	inc	sp
	ld	h, -2 (ix)
	ld	l, 4 (ix)
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #0x0201
	push	bc
	ld	a, #0x55
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
;src/util/tools.c:285: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y+4);
	push	de
	push	de
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
;src/util/tools.c:286: cpct_drawSolidBox (pvideo, 0xaa, 1, height-6);
	push	de
	ld	a, e
	push	af
	inc	sp
	ld	bc, #0x01aa
	push	bc
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	inc	sp
	ld	h, -1 (ix)
	ld	l, 4 (ix)
	ex	(sp),hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	bc, #0x0201
	push	bc
	ld	a, #0x55
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
;src/util/tools.c:292: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+width-3, y+2);
	ld	a, 4 (ix)
	add	a, 6 (ix)
	add	a, #0xfd
	ld	c, a
	push	bc
	push	de
	ld	b, -2 (ix)
	push	bc
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/util/tools.c:293: cpct_drawSolidBox (pvideo, 0xaa, 1, 2);
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0201
	push	hl
	ld	a, #0xaa
	push	af
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/util/tools.c:295: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+width-3, y+4);
	push	bc
	push	de
	ld	e, c
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	ld	a, e
	push	af
	inc	sp
	ld	de, #0x0155
	push	de
	push	hl
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/util/tools.c:298: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+width-3, y+height-2);
	ld	b, -1 (ix)
	push	bc
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/util/tools.c:299: cpct_drawSolidBox (pvideo, 0xaa, 1, 2);
	ld	bc, #0x0201
	push	bc
	ld	a, #0xaa
	push	af
	inc	sp
	push	hl
	call	_cpct_drawSolidBox
	ld	sp,ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
