;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module keyboard
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_scanKeyboard
	.globl _cpct_memcpy
	.globl _tempKeys
	.globl _initKeys
	.globl _wait4OneKey
	.globl _wait4UserKeypress
	.globl _waitForAKey
	.globl _checkKeys
	.globl _waitKeyUp
	.globl _wait4Key
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
;src/keyboard/keyboard.c:33: void initKeys(){
;	---------------------------------
; Function initKeys
; ---------------------------------
_initKeys::
;src/keyboard/keyboard.c:34: cpct_memcpy(&keys, &tempKeys, sizeof(TKeys));
	ld	hl, #0x0012
	push	hl
	ld	hl, #_tempKeys
	push	hl
	ld	hl, #_keys
	push	hl
	call	_cpct_memcpy
	ret
_tempKeys:
	.dw #0x0100
	.dw #0x0400
	.dw #0x0101
	.dw #0x0200
	.dw #0x8005
	.dw #0x0402
	.dw #0x1005
	.dw #0x0408
	.dw #0x4004
;src/keyboard/keyboard.c:45: void wait4OneKey() {
;	---------------------------------
; Function wait4OneKey
; ---------------------------------
_wait4OneKey::
;src/keyboard/keyboard.c:50: keypressed = waitForAKey();
	call	_waitForAKey
;src/keyboard/keyboard.c:51: waitKeyUp(keypressed);
	push	hl
	call	_waitKeyUp
	pop	af
;src/keyboard/keyboard.c:53: return;
	ret
;src/keyboard/keyboard.c:65: u32 wait4UserKeypress() {
;	---------------------------------
; Function wait4UserKeypress
; ---------------------------------
_wait4UserKeypress::
;src/keyboard/keyboard.c:69: do {
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
00101$:
;src/keyboard/keyboard.c:70: c++;                       // One more cycle
	inc	l
	jr	NZ,00115$
	inc	h
	jr	NZ,00115$
	inc	e
	jr	NZ,00115$
	inc	d
00115$:
;src/keyboard/keyboard.c:71: cpct_scanKeyboard_f();     // Scan the scan the keyboard
	push	hl
	push	de
	call	_cpct_scanKeyboard_f
	call	_cpct_isAnyKeyPressed_f
	ld	a, l
	pop	de
	pop	hl
	or	a, a
	jr	Z,00101$
;src/keyboard/keyboard.c:74: return c;
	ret
;src/keyboard/keyboard.c:86: cpct_keyID waitForAKey() {
;	---------------------------------
; Function waitForAKey
; ---------------------------------
_waitForAKey::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/keyboard/keyboard.c:89: u8 i = 10, *keys = cpct_keyboardStatusBuffer + 9;
	ld	d, #0x0a
;src/keyboard/keyboard.c:93: do { cpct_scanKeyboard(); } while ( ! cpct_isAnyKeyPressed() );
00101$:
	push	de
	call	_cpct_scanKeyboard
	call	_cpct_isAnyKeyPressed
	pop	de
	ld	a, l
	or	a, a
	jr	Z,00101$
;src/keyboard/keyboard.c:96: do {
	ld	bc, #(_cpct_keyboardStatusBuffer + 0x0009)
	ld	e, #0x0a
00106$:
;src/keyboard/keyboard.c:99: keypressed = *keys ^ 0xFF;
	ld	a, (bc)
	xor	a, #0xff
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
;src/keyboard/keyboard.c:101: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
	ld	h, -2 (ix)
	ld	l, #0x00
;src/keyboard/keyboard.c:100: if (keypressed)
	ld	a, -1 (ix)
	or	a,-2 (ix)
	jr	Z,00105$
;src/keyboard/keyboard.c:101: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
	ld	c, d
	ld	b, #0x00
	dec	bc
	add	hl, bc
	jr	00109$
00105$:
;src/keyboard/keyboard.c:102: keys--;
	dec	bc
;src/keyboard/keyboard.c:103: } while (--i);
	dec	e
	ld	a,e
	ld	d,a
;src/keyboard/keyboard.c:104: return (keypressed << 8) + (i - 1);
	or	a,a
	jr	NZ,00106$
	ld	d,a
	dec	de
	add	hl,de
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/keyboard/keyboard.c:118: u8 checkKeys(const cpct_keyID *k, u8 numk)
;	---------------------------------
; Function checkKeys
; ---------------------------------
_checkKeys::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/keyboard/keyboard.c:122: if (cpct_isAnyKeyPressed())
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00105$
;src/keyboard/keyboard.c:124: for (i = 1; i <= numk; i++, k++)
	ld	bc,#0x0101
	ld	e,4 (ix)
	ld	d,5 (ix)
00107$:
	ld	a, 6 (ix)
	sub	a, b
	jr	C,00105$
;src/keyboard/keyboard.c:126: if (cpct_isKeyPressed(*k))
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	call	_cpct_isKeyPressed
	pop	de
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00108$
;src/keyboard/keyboard.c:127: return i;
	ld	l, c
	jr	00109$
00108$:
;src/keyboard/keyboard.c:124: for (i = 1; i <= numk; i++, k++)
	inc	b
	ld	c, b
	inc	de
	inc	de
	jr	00107$
00105$:
;src/keyboard/keyboard.c:130: return 0;
	ld	l, #0x00
00109$:
	pop	ix
	ret
;src/keyboard/keyboard.c:140: void waitKeyUp(cpct_keyID key){
;	---------------------------------
; Function waitKeyUp
; ---------------------------------
_waitKeyUp::
;src/keyboard/keyboard.c:142: while (cpct_isKeyPressed(key)) {
00101$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	ret	Z
;src/keyboard/keyboard.c:143: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
	jr	00101$
;src/keyboard/keyboard.c:154: u32 wait4Key(cpct_keyID key) {
;	---------------------------------
; Function wait4Key
; ---------------------------------
_wait4Key::
;src/keyboard/keyboard.c:158: while(!cpct_isKeyPressed(key));
00101$:
	pop	bc
	pop	hl
	push	hl
	push	bc
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00101$
;src/keyboard/keyboard.c:159: do{
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
00104$:
;src/keyboard/keyboard.c:160: c++;
	inc	l
	jr	NZ,00125$
	inc	h
	jr	NZ,00125$
	inc	e
	jr	NZ,00125$
	inc	d
00125$:
;src/keyboard/keyboard.c:162: while(cpct_isKeyPressed(key));
	push	hl
	push	de
	ld	hl, #6
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	_cpct_isKeyPressed
	ld	a, l
	pop	de
	pop	hl
	or	a, a
	jr	NZ,00104$
;src/keyboard/keyboard.c:164: return c;
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
