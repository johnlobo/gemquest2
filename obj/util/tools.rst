                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module tools
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _clearWindow
                             12 	.globl _clearScreen
                             13 	.globl _fast_abs
                             14 	.globl _cpct_getScreenPtr
                             15 	.globl _cpct_drawSprite
                             16 	.globl _cpct_drawSolidBox
                             17 	.globl _cpct_px2byteM0
                             18 	.globl _cpct_memset
                             19 	.globl _delay
                             20 	.globl _distance
                             21 	.globl _sign
                             22 	.globl _collision
                             23 	.globl _abs
                             24 	.globl _drawFrame
                             25 	.globl _drawWindow
                             26 	.globl _drawWindow2
                             27 ;--------------------------------------------------------
                             28 ; special function registers
                             29 ;--------------------------------------------------------
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _DATA
                             34 ;--------------------------------------------------------
                             35 ; ram data
                             36 ;--------------------------------------------------------
                             37 	.area _INITIALIZED
                             38 ;--------------------------------------------------------
                             39 ; absolute external ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DABS (ABS)
                             42 ;--------------------------------------------------------
                             43 ; global & static initialisations
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _GSINIT
                             47 	.area _GSFINAL
                             48 	.area _GSINIT
                             49 ;--------------------------------------------------------
                             50 ; Home
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _HOME
                             54 ;--------------------------------------------------------
                             55 ; code
                             56 ;--------------------------------------------------------
                             57 	.area _CODE
                             58 ;src/util/tools.c:32: void delay(u32 cycles)
                             59 ;	---------------------------------
                             60 ; Function delay
                             61 ; ---------------------------------
   1DAA                      62 _delay::
                             63 ;src/util/tools.c:35: for (i = 0; i < cycles; i++)
   1DAA 01 00 00      [10]   64 	ld	bc,#0x0000
   1DAD 11 00 00      [10]   65 	ld	de,#0x0000
   1DB0                      66 00103$:
   1DB0 21 02 00      [10]   67 	ld	hl, #2
   1DB3 39            [11]   68 	add	hl, sp
   1DB4 79            [ 4]   69 	ld	a, c
   1DB5 96            [ 7]   70 	sub	a, (hl)
   1DB6 78            [ 4]   71 	ld	a, b
   1DB7 23            [ 6]   72 	inc	hl
   1DB8 9E            [ 7]   73 	sbc	a, (hl)
   1DB9 7B            [ 4]   74 	ld	a, e
   1DBA 23            [ 6]   75 	inc	hl
   1DBB 9E            [ 7]   76 	sbc	a, (hl)
   1DBC 7A            [ 4]   77 	ld	a, d
   1DBD 23            [ 6]   78 	inc	hl
   1DBE 9E            [ 7]   79 	sbc	a, (hl)
   1DBF D0            [11]   80 	ret	NC
                             81 ;src/util/tools.c:39: __endasm;
   1DC0 76            [ 4]   82 	halt
                             83 ;src/util/tools.c:35: for (i = 0; i < cycles; i++)
   1DC1 0C            [ 4]   84 	inc	c
   1DC2 20 EC         [12]   85 	jr	NZ,00103$
   1DC4 04            [ 4]   86 	inc	b
   1DC5 20 E9         [12]   87 	jr	NZ,00103$
   1DC7 1C            [ 4]   88 	inc	e
   1DC8 20 E6         [12]   89 	jr	NZ,00103$
   1DCA 14            [ 4]   90 	inc	d
   1DCB 18 E3         [12]   91 	jr	00103$
                             92 ;src/util/tools.c:78: u16 distance (u16 x1, u16 y1, u16 x2, u16 y2)
                             93 ;	---------------------------------
                             94 ; Function distance
                             95 ; ---------------------------------
   1DCD                      96 _distance::
   1DCD DD E5         [15]   97 	push	ix
   1DCF DD 21 00 00   [14]   98 	ld	ix,#0
   1DD3 DD 39         [15]   99 	add	ix,sp
                            100 ;src/util/tools.c:80: u16 x = fast_abs( x2 - x1 );  // x = valor absoluto de x2 – x1, es decir, la distancia entre las x
   1DD5 DD 7E 08      [19]  101 	ld	a, 8 (ix)
   1DD8 DD 96 04      [19]  102 	sub	a, 4 (ix)
   1DDB 6F            [ 4]  103 	ld	l, a
   1DDC DD 7E 09      [19]  104 	ld	a, 9 (ix)
   1DDF DD 9E 05      [19]  105 	sbc	a, 5 (ix)
   1DE2 67            [ 4]  106 	ld	h, a
   1DE3 CD FD 2A      [17]  107 	call	_fast_abs
   1DE6 4D            [ 4]  108 	ld	c, l
   1DE7 44            [ 4]  109 	ld	b, h
                            110 ;src/util/tools.c:81: u16 y = fast_abs( y2 - y1 );  // y = valor absoluto de y2 – y1, es decir, la distancia entre las y
   1DE8 DD 7E 0A      [19]  111 	ld	a, 10 (ix)
   1DEB DD 96 06      [19]  112 	sub	a, 6 (ix)
   1DEE 6F            [ 4]  113 	ld	l, a
   1DEF DD 7E 0B      [19]  114 	ld	a, 11 (ix)
   1DF2 DD 9E 07      [19]  115 	sbc	a, 7 (ix)
   1DF5 67            [ 4]  116 	ld	h, a
   1DF6 C5            [11]  117 	push	bc
   1DF7 CD FD 2A      [17]  118 	call	_fast_abs
   1DFA C1            [10]  119 	pop	bc
                            120 ;src/util/tools.c:83: u16 min = x < y ? x : y; // Si x < y min = x, si no, vale y. Es decir, el menor de los 2
   1DFB 79            [ 4]  121 	ld	a, c
   1DFC 95            [ 4]  122 	sub	a, l
   1DFD 78            [ 4]  123 	ld	a, b
   1DFE 9C            [ 4]  124 	sbc	a, h
   1DFF 30 04         [12]  125 	jr	NC,00103$
   1E01 59            [ 4]  126 	ld	e, c
   1E02 50            [ 4]  127 	ld	d, b
   1E03 18 02         [12]  128 	jr	00104$
   1E05                     129 00103$:
   1E05 5D            [ 4]  130 	ld	e, l
   1E06 54            [ 4]  131 	ld	d, h
   1E07                     132 00104$:
                            133 ;src/util/tools.c:85: return ( x + y - (min >> 1) - (min >> 2) + (min >> 4) );
   1E07 09            [11]  134 	add	hl, bc
   1E08 4B            [ 4]  135 	ld	c, e
   1E09 42            [ 4]  136 	ld	b, d
   1E0A CB 38         [ 8]  137 	srl	b
   1E0C CB 19         [ 8]  138 	rr	c
   1E0E BF            [ 4]  139 	cp	a, a
   1E0F ED 42         [15]  140 	sbc	hl, bc
   1E11 4B            [ 4]  141 	ld	c, e
   1E12 42            [ 4]  142 	ld	b, d
   1E13 CB 38         [ 8]  143 	srl	b
   1E15 CB 19         [ 8]  144 	rr	c
   1E17 CB 38         [ 8]  145 	srl	b
   1E19 CB 19         [ 8]  146 	rr	c
   1E1B BF            [ 4]  147 	cp	a, a
   1E1C ED 42         [15]  148 	sbc	hl, bc
   1E1E CB 3A         [ 8]  149 	srl	d
   1E20 CB 1B         [ 8]  150 	rr	e
   1E22 CB 3A         [ 8]  151 	srl	d
   1E24 CB 1B         [ 8]  152 	rr	e
   1E26 CB 3A         [ 8]  153 	srl	d
   1E28 CB 1B         [ 8]  154 	rr	e
   1E2A CB 3A         [ 8]  155 	srl	d
   1E2C CB 1B         [ 8]  156 	rr	e
   1E2E 19            [11]  157 	add	hl, de
   1E2F DD E1         [14]  158 	pop	ix
   1E31 C9            [10]  159 	ret
                            160 ;src/util/tools.c:96: i16 sign(i16 x)
                            161 ;	---------------------------------
                            162 ; Function sign
                            163 ; ---------------------------------
   1E32                     164 _sign::
   1E32 DD E5         [15]  165 	push	ix
   1E34 DD 21 00 00   [14]  166 	ld	ix,#0
   1E38 DD 39         [15]  167 	add	ix,sp
                            168 ;src/util/tools.c:98: return  (x > 0) - (x < 0);
   1E3A AF            [ 4]  169 	xor	a, a
   1E3B DD BE 04      [19]  170 	cp	a, 4 (ix)
   1E3E DD 9E 05      [19]  171 	sbc	a, 5 (ix)
   1E41 E2 46 1E      [10]  172 	jp	PO, 00103$
   1E44 EE 80         [ 7]  173 	xor	a, #0x80
   1E46                     174 00103$:
   1E46 07            [ 4]  175 	rlca
   1E47 E6 01         [ 7]  176 	and	a,#0x01
   1E49 6F            [ 4]  177 	ld	l, a
   1E4A 26 00         [ 7]  178 	ld	h, #0x00
   1E4C DD 7E 05      [19]  179 	ld	a, 5 (ix)
   1E4F 07            [ 4]  180 	rlca
   1E50 E6 01         [ 7]  181 	and	a,#0x01
   1E52 4F            [ 4]  182 	ld	c, a
   1E53 06 00         [ 7]  183 	ld	b, #0x00
   1E55 BF            [ 4]  184 	cp	a, a
   1E56 ED 42         [15]  185 	sbc	hl, bc
   1E58 DD E1         [14]  186 	pop	ix
   1E5A C9            [10]  187 	ret
                            188 ;src/util/tools.c:111: u8 collision(u8 x1, u8 y1, u8 w1, u8 h1, u8 x2, u8 y2, u8 w2, u8 h2)
                            189 ;	---------------------------------
                            190 ; Function collision
                            191 ; ---------------------------------
   1E5B                     192 _collision::
   1E5B DD E5         [15]  193 	push	ix
   1E5D DD 21 00 00   [14]  194 	ld	ix,#0
   1E61 DD 39         [15]  195 	add	ix,sp
                            196 ;src/util/tools.c:113: return  ((x1 < x2 + w2) && (x1 + w1 > x2) &&  (y1 < y2 + h2) && (h1 + y1 > y2));
   1E63 DD 4E 08      [19]  197 	ld	c, 8 (ix)
   1E66 06 00         [ 7]  198 	ld	b, #0x00
   1E68 DD 6E 0A      [19]  199 	ld	l, 10 (ix)
   1E6B 26 00         [ 7]  200 	ld	h, #0x00
   1E6D 09            [11]  201 	add	hl, bc
   1E6E DD 5E 04      [19]  202 	ld	e, 4 (ix)
   1E71 16 00         [ 7]  203 	ld	d, #0x00
   1E73 7B            [ 4]  204 	ld	a, e
   1E74 95            [ 4]  205 	sub	a, l
   1E75 7A            [ 4]  206 	ld	a, d
   1E76 9C            [ 4]  207 	sbc	a, h
   1E77 E2 7C 1E      [10]  208 	jp	PO, 00122$
   1E7A EE 80         [ 7]  209 	xor	a, #0x80
   1E7C                     210 00122$:
   1E7C F2 BF 1E      [10]  211 	jp	P, 00103$
   1E7F DD 6E 06      [19]  212 	ld	l, 6 (ix)
   1E82 26 00         [ 7]  213 	ld	h, #0x00
   1E84 19            [11]  214 	add	hl, de
   1E85 79            [ 4]  215 	ld	a, c
   1E86 95            [ 4]  216 	sub	a, l
   1E87 78            [ 4]  217 	ld	a, b
   1E88 9C            [ 4]  218 	sbc	a, h
   1E89 E2 8E 1E      [10]  219 	jp	PO, 00123$
   1E8C EE 80         [ 7]  220 	xor	a, #0x80
   1E8E                     221 00123$:
   1E8E F2 BF 1E      [10]  222 	jp	P, 00103$
   1E91 DD 4E 09      [19]  223 	ld	c, 9 (ix)
   1E94 06 00         [ 7]  224 	ld	b, #0x00
   1E96 DD 6E 0B      [19]  225 	ld	l, 11 (ix)
   1E99 26 00         [ 7]  226 	ld	h, #0x00
   1E9B 09            [11]  227 	add	hl, bc
   1E9C DD 5E 05      [19]  228 	ld	e, 5 (ix)
   1E9F 16 00         [ 7]  229 	ld	d, #0x00
   1EA1 7B            [ 4]  230 	ld	a, e
   1EA2 95            [ 4]  231 	sub	a, l
   1EA3 7A            [ 4]  232 	ld	a, d
   1EA4 9C            [ 4]  233 	sbc	a, h
   1EA5 E2 AA 1E      [10]  234 	jp	PO, 00124$
   1EA8 EE 80         [ 7]  235 	xor	a, #0x80
   1EAA                     236 00124$:
   1EAA F2 BF 1E      [10]  237 	jp	P, 00103$
   1EAD DD 6E 07      [19]  238 	ld	l, 7 (ix)
   1EB0 26 00         [ 7]  239 	ld	h, #0x00
   1EB2 19            [11]  240 	add	hl, de
   1EB3 79            [ 4]  241 	ld	a, c
   1EB4 95            [ 4]  242 	sub	a, l
   1EB5 78            [ 4]  243 	ld	a, b
   1EB6 9C            [ 4]  244 	sbc	a, h
   1EB7 E2 BC 1E      [10]  245 	jp	PO, 00125$
   1EBA EE 80         [ 7]  246 	xor	a, #0x80
   1EBC                     247 00125$:
   1EBC FA C3 1E      [10]  248 	jp	M, 00104$
   1EBF                     249 00103$:
   1EBF 2E 00         [ 7]  250 	ld	l, #0x00
   1EC1 18 02         [12]  251 	jr	00105$
   1EC3                     252 00104$:
   1EC3 2E 01         [ 7]  253 	ld	l, #0x01
   1EC5                     254 00105$:
   1EC5 DD E1         [14]  255 	pop	ix
   1EC7 C9            [10]  256 	ret
                            257 ;src/util/tools.c:124: i16 abs(i16 j)
                            258 ;	---------------------------------
                            259 ; Function abs
                            260 ; ---------------------------------
   1EC8                     261 _abs::
                            262 ;src/util/tools.c:126: return (j < 0) ? -j : j;
   1EC8 FD 21 02 00   [14]  263 	ld	iy, #2
   1ECC FD 39         [15]  264 	add	iy, sp
   1ECE FD CB 01 7E   [20]  265 	bit	7,1 (iy)
   1ED2 28 0C         [12]  266 	jr	Z,00103$
   1ED4 AF            [ 4]  267 	xor	a, a
   1ED5 FD 96 00      [19]  268 	sub	a, 0 (iy)
   1ED8 6F            [ 4]  269 	ld	l, a
   1ED9 3E 00         [ 7]  270 	ld	a, #0x00
   1EDB FD 9E 01      [19]  271 	sbc	a, 1 (iy)
   1EDE 67            [ 4]  272 	ld	h, a
   1EDF C9            [10]  273 	ret
   1EE0                     274 00103$:
   1EE0 C1            [10]  275 	pop	bc
   1EE1 E1            [10]  276 	pop	hl
   1EE2 E5            [11]  277 	push	hl
   1EE3 C5            [11]  278 	push	bc
   1EE4 C9            [10]  279 	ret
                            280 ;src/util/tools.c:138: void clearScreen() {
                            281 ;	---------------------------------
                            282 ; Function clearScreen
                            283 ; ---------------------------------
   1EE5                     284 _clearScreen::
                            285 ;src/util/tools.c:140: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(0,0), 0x4000);
   1EE5 21 00 00      [10]  286 	ld	hl, #0x0000
   1EE8 E5            [11]  287 	push	hl
   1EE9 CD A3 2D      [17]  288 	call	_cpct_px2byteM0
   1EEC 45            [ 4]  289 	ld	b, l
   1EED 21 00 40      [10]  290 	ld	hl, #0x4000
   1EF0 E5            [11]  291 	push	hl
   1EF1 C5            [11]  292 	push	bc
   1EF2 33            [ 6]  293 	inc	sp
   1EF3 26 C0         [ 7]  294 	ld	h, #0xc0
   1EF5 E5            [11]  295 	push	hl
   1EF6 CD BF 2D      [17]  296 	call	_cpct_memset
   1EF9 C9            [10]  297 	ret
                            298 ;src/util/tools.c:152: void clearWindow(u8 xPos, u8 yPos, u8 width, u8 height) {
                            299 ;	---------------------------------
                            300 ; Function clearWindow
                            301 ; ---------------------------------
   1EFA                     302 _clearWindow::
                            303 ;src/util/tools.c:154: u8* pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   1EFA 21 03 00      [10]  304 	ld	hl, #3+0
   1EFD 39            [11]  305 	add	hl, sp
   1EFE 7E            [ 7]  306 	ld	a, (hl)
   1EFF F5            [11]  307 	push	af
   1F00 33            [ 6]  308 	inc	sp
   1F01 21 03 00      [10]  309 	ld	hl, #3+0
   1F04 39            [11]  310 	add	hl, sp
   1F05 7E            [ 7]  311 	ld	a, (hl)
   1F06 F5            [11]  312 	push	af
   1F07 33            [ 6]  313 	inc	sp
   1F08 21 00 C0      [10]  314 	ld	hl, #0xc000
   1F0B E5            [11]  315 	push	hl
   1F0C CD 02 2F      [17]  316 	call	_cpct_getScreenPtr
                            317 ;src/util/tools.c:155: cpct_drawSolidBox(pvideo, cpct_px2byteM0(0,0), width, height);
   1F0F E5            [11]  318 	push	hl
   1F10 21 00 00      [10]  319 	ld	hl, #0x0000
   1F13 E5            [11]  320 	push	hl
   1F14 CD A3 2D      [17]  321 	call	_cpct_px2byteM0
   1F17 55            [ 4]  322 	ld	d, l
   1F18 C1            [10]  323 	pop	bc
   1F19 21 05 00      [10]  324 	ld	hl, #5+0
   1F1C 39            [11]  325 	add	hl, sp
   1F1D 7E            [ 7]  326 	ld	a, (hl)
   1F1E F5            [11]  327 	push	af
   1F1F 33            [ 6]  328 	inc	sp
   1F20 21 05 00      [10]  329 	ld	hl, #5+0
   1F23 39            [11]  330 	add	hl, sp
   1F24 7E            [ 7]  331 	ld	a, (hl)
   1F25 F5            [11]  332 	push	af
   1F26 33            [ 6]  333 	inc	sp
   1F27 D5            [11]  334 	push	de
   1F28 33            [ 6]  335 	inc	sp
   1F29 C5            [11]  336 	push	bc
   1F2A CD DD 2D      [17]  337 	call	_cpct_drawSolidBox
   1F2D F1            [10]  338 	pop	af
   1F2E F1            [10]  339 	pop	af
   1F2F 33            [ 6]  340 	inc	sp
   1F30 C9            [10]  341 	ret
                            342 ;src/util/tools.c:168: void drawFrame(u8 x1, u8 y1, u8 x2, u8 y2) {
                            343 ;	---------------------------------
                            344 ; Function drawFrame
                            345 ; ---------------------------------
   1F31                     346 _drawFrame::
   1F31 DD E5         [15]  347 	push	ix
   1F33 DD 21 00 00   [14]  348 	ld	ix,#0
   1F37 DD 39         [15]  349 	add	ix,sp
   1F39 21 F7 FF      [10]  350 	ld	hl, #-9
   1F3C 39            [11]  351 	add	hl, sp
   1F3D F9            [ 6]  352 	ld	sp, hl
                            353 ;src/util/tools.c:172: frame_w = x2 - x1;
   1F3E DD 7E 06      [19]  354 	ld	a, 6 (ix)
   1F41 DD 96 04      [19]  355 	sub	a, 4 (ix)
   1F44 47            [ 4]  356 	ld	b, a
   1F45 DD 70 F7      [19]  357 	ld	-9 (ix), b
                            358 ;src/util/tools.c:175: clearWindow(x1, y1, x2 - x1, y2 - y1);
   1F48 DD 7E 07      [19]  359 	ld	a, 7 (ix)
   1F4B DD 96 05      [19]  360 	sub	a, 5 (ix)
   1F4E 57            [ 4]  361 	ld	d, a
   1F4F 58            [ 4]  362 	ld	e, b
   1F50 D5            [11]  363 	push	de
   1F51 DD 66 05      [19]  364 	ld	h, 5 (ix)
   1F54 DD 6E 04      [19]  365 	ld	l, 4 (ix)
   1F57 E5            [11]  366 	push	hl
   1F58 CD FA 1E      [17]  367 	call	_clearWindow
   1F5B F1            [10]  368 	pop	af
   1F5C F1            [10]  369 	pop	af
                            370 ;src/util/tools.c:178: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x1, y1);
   1F5D DD 66 05      [19]  371 	ld	h, 5 (ix)
   1F60 DD 6E 04      [19]  372 	ld	l, 4 (ix)
   1F63 E5            [11]  373 	push	hl
   1F64 21 00 C0      [10]  374 	ld	hl, #0xc000
   1F67 E5            [11]  375 	push	hl
   1F68 CD 02 2F      [17]  376 	call	_cpct_getScreenPtr
   1F6B 4D            [ 4]  377 	ld	c, l
   1F6C 44            [ 4]  378 	ld	b, h
                            379 ;src/util/tools.c:179: cpct_drawSprite(g_border_0,  pvideo, 2, 4);
   1F6D 59            [ 4]  380 	ld	e, c
   1F6E 50            [ 4]  381 	ld	d, b
   1F6F C5            [11]  382 	push	bc
   1F70 21 02 04      [10]  383 	ld	hl, #0x0402
   1F73 E5            [11]  384 	push	hl
   1F74 D5            [11]  385 	push	de
   1F75 21 8A 13      [10]  386 	ld	hl, #_g_border_0
   1F78 E5            [11]  387 	push	hl
   1F79 CD EC 2B      [17]  388 	call	_cpct_drawSprite
   1F7C C1            [10]  389 	pop	bc
                            390 ;src/util/tools.c:182: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
   1F7D DD 7E 04      [19]  391 	ld	a, 4 (ix)
   1F80 C6 02         [ 7]  392 	add	a, #0x02
   1F82 DD 77 FC      [19]  393 	ld	-4 (ix), a
   1F85 DD 77 FF      [19]  394 	ld	-1 (ix), a
   1F88 11 AA 13      [10]  395 	ld	de, #_g_border_4+0
   1F8B                     396 00105$:
   1F8B DD 7E 06      [19]  397 	ld	a, 6 (ix)
   1F8E 26 00         [ 7]  398 	ld	h, #0x00
   1F90 C6 FE         [ 7]  399 	add	a, #0xfe
   1F92 DD 77 FD      [19]  400 	ld	-3 (ix), a
   1F95 7C            [ 4]  401 	ld	a, h
   1F96 CE FF         [ 7]  402 	adc	a, #0xff
   1F98 DD 77 FE      [19]  403 	ld	-2 (ix), a
   1F9B DD 6E FF      [19]  404 	ld	l, -1 (ix)
   1F9E 26 00         [ 7]  405 	ld	h, #0x00
                            406 ;src/util/tools.c:183: cpct_drawSprite(g_border_4,  pvideo + (x - x1), 2, 4);
   1FA0 DD 7E 04      [19]  407 	ld	a, 4 (ix)
   1FA3 DD 77 FA      [19]  408 	ld	-6 (ix), a
   1FA6 DD 36 FB 00   [19]  409 	ld	-5 (ix), #0x00
                            410 ;src/util/tools.c:182: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
   1FAA 7D            [ 4]  411 	ld	a, l
   1FAB DD 96 FD      [19]  412 	sub	a, -3 (ix)
   1FAE 7C            [ 4]  413 	ld	a, h
   1FAF DD 9E FE      [19]  414 	sbc	a, -2 (ix)
   1FB2 E2 B7 1F      [10]  415 	jp	PO, 00142$
   1FB5 EE 80         [ 7]  416 	xor	a, #0x80
   1FB7                     417 00142$:
   1FB7 F2 E1 1F      [10]  418 	jp	P, 00101$
                            419 ;src/util/tools.c:183: cpct_drawSprite(g_border_4,  pvideo + (x - x1), 2, 4);
   1FBA 7D            [ 4]  420 	ld	a, l
   1FBB DD 96 FA      [19]  421 	sub	a, -6 (ix)
   1FBE 6F            [ 4]  422 	ld	l, a
   1FBF 7C            [ 4]  423 	ld	a, h
   1FC0 DD 9E FB      [19]  424 	sbc	a, -5 (ix)
   1FC3 67            [ 4]  425 	ld	h, a
   1FC4 09            [11]  426 	add	hl, bc
   1FC5 E5            [11]  427 	push	hl
   1FC6 FD E1         [14]  428 	pop	iy
   1FC8 C5            [11]  429 	push	bc
   1FC9 D5            [11]  430 	push	de
   1FCA 21 02 04      [10]  431 	ld	hl, #0x0402
   1FCD E5            [11]  432 	push	hl
   1FCE FD E5         [15]  433 	push	iy
   1FD0 21 AA 13      [10]  434 	ld	hl, #_g_border_4
   1FD3 E5            [11]  435 	push	hl
   1FD4 CD EC 2B      [17]  436 	call	_cpct_drawSprite
   1FD7 D1            [10]  437 	pop	de
   1FD8 C1            [10]  438 	pop	bc
                            439 ;src/util/tools.c:182: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
   1FD9 DD 34 FF      [23]  440 	inc	-1 (ix)
   1FDC DD 34 FF      [23]  441 	inc	-1 (ix)
   1FDF 18 AA         [12]  442 	jr	00105$
   1FE1                     443 00101$:
                            444 ;src/util/tools.c:187: cpct_drawSprite(g_border_1,  pvideo + (frame_w - 2), 2, 4);
   1FE1 DD 5E F7      [19]  445 	ld	e, -9 (ix)
   1FE4 16 00         [ 7]  446 	ld	d, #0x00
   1FE6 1B            [ 6]  447 	dec	de
   1FE7 1B            [ 6]  448 	dec	de
   1FE8 6B            [ 4]  449 	ld	l, e
   1FE9 62            [ 4]  450 	ld	h, d
   1FEA 09            [11]  451 	add	hl, bc
   1FEB 4D            [ 4]  452 	ld	c, l
   1FEC 44            [ 4]  453 	ld	b, h
   1FED D5            [11]  454 	push	de
   1FEE 21 02 04      [10]  455 	ld	hl, #0x0402
   1FF1 E5            [11]  456 	push	hl
   1FF2 C5            [11]  457 	push	bc
   1FF3 21 92 13      [10]  458 	ld	hl, #_g_border_1
   1FF6 E5            [11]  459 	push	hl
   1FF7 CD EC 2B      [17]  460 	call	_cpct_drawSprite
   1FFA D1            [10]  461 	pop	de
                            462 ;src/util/tools.c:190: for (x = y1 + 4; x < (y2 - 4); x = x + 4) {
   1FFB DD 7E 05      [19]  463 	ld	a, 5 (ix)
   1FFE C6 04         [ 7]  464 	add	a, #0x04
   2000 DD 77 FF      [19]  465 	ld	-1 (ix), a
   2003                     466 00108$:
   2003 DD 7E 07      [19]  467 	ld	a, 7 (ix)
   2006 06 00         [ 7]  468 	ld	b, #0x00
   2008 C6 FC         [ 7]  469 	add	a, #0xfc
   200A 4F            [ 4]  470 	ld	c, a
   200B 78            [ 4]  471 	ld	a, b
   200C CE FF         [ 7]  472 	adc	a, #0xff
   200E 47            [ 4]  473 	ld	b, a
   200F DD 7E FF      [19]  474 	ld	a, -1 (ix)
   2012 26 00         [ 7]  475 	ld	h, #0x00
   2014 91            [ 4]  476 	sub	a, c
   2015 7C            [ 4]  477 	ld	a, h
   2016 98            [ 4]  478 	sbc	a, b
   2017 E2 1C 20      [10]  479 	jp	PO, 00143$
   201A EE 80         [ 7]  480 	xor	a, #0x80
   201C                     481 00143$:
   201C F2 60 20      [10]  482 	jp	P, 00102$
                            483 ;src/util/tools.c:191: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x1, x);
   201F D5            [11]  484 	push	de
   2020 DD 66 FF      [19]  485 	ld	h, -1 (ix)
   2023 DD 6E 04      [19]  486 	ld	l, 4 (ix)
   2026 E5            [11]  487 	push	hl
   2027 21 00 C0      [10]  488 	ld	hl, #0xc000
   202A E5            [11]  489 	push	hl
   202B CD 02 2F      [17]  490 	call	_cpct_getScreenPtr
   202E D1            [10]  491 	pop	de
                            492 ;src/util/tools.c:192: cpct_drawSprite(g_border_5,  pvideo, 2, 4);
   202F E5            [11]  493 	push	hl
   2030 FD E1         [14]  494 	pop	iy
   2032 E5            [11]  495 	push	hl
   2033 D5            [11]  496 	push	de
   2034 01 02 04      [10]  497 	ld	bc, #0x0402
   2037 C5            [11]  498 	push	bc
   2038 FD E5         [15]  499 	push	iy
   203A 01 B2 13      [10]  500 	ld	bc, #_g_border_5
   203D C5            [11]  501 	push	bc
   203E CD EC 2B      [17]  502 	call	_cpct_drawSprite
   2041 D1            [10]  503 	pop	de
   2042 E1            [10]  504 	pop	hl
                            505 ;src/util/tools.c:193: cpct_drawSprite(g_border_6,  pvideo + (frame_w - 2), 2, 4);
   2043 19            [11]  506 	add	hl, de
   2044 D5            [11]  507 	push	de
   2045 01 02 04      [10]  508 	ld	bc, #0x0402
   2048 C5            [11]  509 	push	bc
   2049 E5            [11]  510 	push	hl
   204A 21 BA 13      [10]  511 	ld	hl, #_g_border_6
   204D E5            [11]  512 	push	hl
   204E CD EC 2B      [17]  513 	call	_cpct_drawSprite
   2051 D1            [10]  514 	pop	de
                            515 ;src/util/tools.c:190: for (x = y1 + 4; x < (y2 - 4); x = x + 4) {
   2052 DD 34 FF      [23]  516 	inc	-1 (ix)
   2055 DD 34 FF      [23]  517 	inc	-1 (ix)
   2058 DD 34 FF      [23]  518 	inc	-1 (ix)
   205B DD 34 FF      [23]  519 	inc	-1 (ix)
   205E 18 A3         [12]  520 	jr	00108$
   2060                     521 00102$:
                            522 ;src/util/tools.c:196: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x1, y2 - 4);
   2060 DD 7E 07      [19]  523 	ld	a, 7 (ix)
   2063 C6 FC         [ 7]  524 	add	a, #0xfc
   2065 47            [ 4]  525 	ld	b, a
   2066 D5            [11]  526 	push	de
   2067 C5            [11]  527 	push	bc
   2068 33            [ 6]  528 	inc	sp
   2069 DD 7E 04      [19]  529 	ld	a, 4 (ix)
   206C F5            [11]  530 	push	af
   206D 33            [ 6]  531 	inc	sp
   206E 21 00 C0      [10]  532 	ld	hl, #0xc000
   2071 E5            [11]  533 	push	hl
   2072 CD 02 2F      [17]  534 	call	_cpct_getScreenPtr
   2075 4D            [ 4]  535 	ld	c, l
   2076 44            [ 4]  536 	ld	b, h
   2077 D1            [10]  537 	pop	de
                            538 ;src/util/tools.c:199: cpct_drawSprite(g_border_2,  pvideo, 2, 4);
   2078 DD 71 F8      [19]  539 	ld	-8 (ix), c
   207B DD 70 F9      [19]  540 	ld	-7 (ix), b
   207E C5            [11]  541 	push	bc
   207F D5            [11]  542 	push	de
   2080 21 02 04      [10]  543 	ld	hl, #0x0402
   2083 E5            [11]  544 	push	hl
   2084 DD 6E F8      [19]  545 	ld	l,-8 (ix)
   2087 DD 66 F9      [19]  546 	ld	h,-7 (ix)
   208A E5            [11]  547 	push	hl
   208B 21 9A 13      [10]  548 	ld	hl, #_g_border_2
   208E E5            [11]  549 	push	hl
   208F CD EC 2B      [17]  550 	call	_cpct_drawSprite
   2092 D1            [10]  551 	pop	de
   2093 C1            [10]  552 	pop	bc
                            553 ;src/util/tools.c:202: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
   2094 DD 7E FC      [19]  554 	ld	a, -4 (ix)
   2097 DD 77 F8      [19]  555 	ld	-8 (ix), a
   209A                     556 00111$:
   209A DD 6E F8      [19]  557 	ld	l, -8 (ix)
   209D 26 00         [ 7]  558 	ld	h, #0x00
   209F 7D            [ 4]  559 	ld	a, l
   20A0 DD 96 FD      [19]  560 	sub	a, -3 (ix)
   20A3 7C            [ 4]  561 	ld	a, h
   20A4 DD 9E FE      [19]  562 	sbc	a, -2 (ix)
   20A7 E2 AC 20      [10]  563 	jp	PO, 00144$
   20AA EE 80         [ 7]  564 	xor	a, #0x80
   20AC                     565 00144$:
   20AC F2 D6 20      [10]  566 	jp	P, 00103$
                            567 ;src/util/tools.c:203: cpct_drawSprite(g_border_7,  pvideo + (x - x1), 2, 4);
   20AF 7D            [ 4]  568 	ld	a, l
   20B0 DD 96 FA      [19]  569 	sub	a, -6 (ix)
   20B3 6F            [ 4]  570 	ld	l, a
   20B4 7C            [ 4]  571 	ld	a, h
   20B5 DD 9E FB      [19]  572 	sbc	a, -5 (ix)
   20B8 67            [ 4]  573 	ld	h, a
   20B9 09            [11]  574 	add	hl, bc
   20BA E5            [11]  575 	push	hl
   20BB FD E1         [14]  576 	pop	iy
   20BD C5            [11]  577 	push	bc
   20BE D5            [11]  578 	push	de
   20BF 21 02 04      [10]  579 	ld	hl, #0x0402
   20C2 E5            [11]  580 	push	hl
   20C3 FD E5         [15]  581 	push	iy
   20C5 21 C2 13      [10]  582 	ld	hl, #_g_border_7
   20C8 E5            [11]  583 	push	hl
   20C9 CD EC 2B      [17]  584 	call	_cpct_drawSprite
   20CC D1            [10]  585 	pop	de
   20CD C1            [10]  586 	pop	bc
                            587 ;src/util/tools.c:202: for (x = x1 + 2; x < (x2 - 2); x = x + 2) {
   20CE DD 34 F8      [23]  588 	inc	-8 (ix)
   20D1 DD 34 F8      [23]  589 	inc	-8 (ix)
   20D4 18 C4         [12]  590 	jr	00111$
   20D6                     591 00103$:
                            592 ;src/util/tools.c:207: cpct_drawSprite(g_border_3,  pvideo + (frame_w - 2), 2, 4);
   20D6 69            [ 4]  593 	ld	l, c
   20D7 60            [ 4]  594 	ld	h, b
   20D8 19            [11]  595 	add	hl, de
   20D9 01 A2 13      [10]  596 	ld	bc, #_g_border_3+0
   20DC 11 02 04      [10]  597 	ld	de, #0x0402
   20DF D5            [11]  598 	push	de
   20E0 E5            [11]  599 	push	hl
   20E1 C5            [11]  600 	push	bc
   20E2 CD EC 2B      [17]  601 	call	_cpct_drawSprite
   20E5 DD F9         [10]  602 	ld	sp, ix
   20E7 DD E1         [14]  603 	pop	ix
   20E9 C9            [10]  604 	ret
                            605 ;src/util/tools.c:210: void drawWindow(){
                            606 ;	---------------------------------
                            607 ; Function drawWindow
                            608 ; ---------------------------------
   20EA                     609 _drawWindow::
                            610 ;src/util/tools.c:215: cpct_drawSolidBox ((u16*)62099-5, 0xff, 51-2, 2);
   20EA 21 31 02      [10]  611 	ld	hl, #0x0231
   20ED E5            [11]  612 	push	hl
   20EE 3E FF         [ 7]  613 	ld	a, #0xff
   20F0 F5            [11]  614 	push	af
   20F1 33            [ 6]  615 	inc	sp
   20F2 21 8E F2      [10]  616 	ld	hl, #0xf28e
   20F5 E5            [11]  617 	push	hl
   20F6 CD DD 2D      [17]  618 	call	_cpct_drawSolidBox
   20F9 F1            [10]  619 	pop	af
                            620 ;src/util/tools.c:216: cpct_drawSolidBox ((u16*)62659-5, 0xff, 51-2, 2);
   20FA 33            [ 6]  621 	inc	sp
   20FB 21 31 02      [10]  622 	ld	hl,#0x0231
   20FE E3            [19]  623 	ex	(sp),hl
   20FF 3E FF         [ 7]  624 	ld	a, #0xff
   2101 F5            [11]  625 	push	af
   2102 33            [ 6]  626 	inc	sp
   2103 21 BE F4      [10]  627 	ld	hl, #0xf4be
   2106 E5            [11]  628 	push	hl
   2107 CD DD 2D      [17]  629 	call	_cpct_drawSolidBox
   210A F1            [10]  630 	pop	af
                            631 ;src/util/tools.c:219: cpct_drawSolidBox ((u16*)49891-5, 0x00, 51-2, 2);
   210B 33            [ 6]  632 	inc	sp
   210C 21 31 02      [10]  633 	ld	hl,#0x0231
   210F E3            [19]  634 	ex	(sp),hl
   2110 AF            [ 4]  635 	xor	a, a
   2111 F5            [11]  636 	push	af
   2112 33            [ 6]  637 	inc	sp
   2113 21 DE C2      [10]  638 	ld	hl, #0xc2de
   2116 E5            [11]  639 	push	hl
   2117 CD DD 2D      [17]  640 	call	_cpct_drawSolidBox
   211A F1            [10]  641 	pop	af
                            642 ;src/util/tools.c:220: cpct_drawSolidBox ((u16*)58563-5, 0x00, 51-2, 2);
   211B 33            [ 6]  643 	inc	sp
   211C 21 31 02      [10]  644 	ld	hl,#0x0231
   211F E3            [19]  645 	ex	(sp),hl
   2120 AF            [ 4]  646 	xor	a, a
   2121 F5            [11]  647 	push	af
   2122 33            [ 6]  648 	inc	sp
   2123 21 BE E4      [10]  649 	ld	hl, #0xe4be
   2126 E5            [11]  650 	push	hl
   2127 CD DD 2D      [17]  651 	call	_cpct_drawSolidBox
   212A F1            [10]  652 	pop	af
                            653 ;src/util/tools.c:223: cpct_drawSolidBox ((u16*)53987-5, 0x3f, 51-2, 58-8);
   212B 33            [ 6]  654 	inc	sp
   212C 21 31 32      [10]  655 	ld	hl,#0x3231
   212F E3            [19]  656 	ex	(sp),hl
   2130 3E 3F         [ 7]  657 	ld	a, #0x3f
   2132 F5            [11]  658 	push	af
   2133 33            [ 6]  659 	inc	sp
   2134 21 DE D2      [10]  660 	ld	hl, #0xd2de
   2137 E5            [11]  661 	push	hl
   2138 CD DD 2D      [17]  662 	call	_cpct_drawSolidBox
   213B F1            [10]  663 	pop	af
                            664 ;src/util/tools.c:228: cpct_drawSolidBox ((u16*)49890-5, 0x55, 1, 2);
   213C 33            [ 6]  665 	inc	sp
   213D 21 01 02      [10]  666 	ld	hl,#0x0201
   2140 E3            [19]  667 	ex	(sp),hl
   2141 3E 55         [ 7]  668 	ld	a, #0x55
   2143 F5            [11]  669 	push	af
   2144 33            [ 6]  670 	inc	sp
   2145 21 DD C2      [10]  671 	ld	hl, #0xc2dd
   2148 E5            [11]  672 	push	hl
   2149 CD DD 2D      [17]  673 	call	_cpct_drawSolidBox
   214C F1            [10]  674 	pop	af
                            675 ;src/util/tools.c:231: cpct_drawSolidBox ((u16*)53986-5, 0xaa, 1, 58-8);
   214D 33            [ 6]  676 	inc	sp
   214E 21 01 32      [10]  677 	ld	hl,#0x3201
   2151 E3            [19]  678 	ex	(sp),hl
   2152 3E AA         [ 7]  679 	ld	a, #0xaa
   2154 F5            [11]  680 	push	af
   2155 33            [ 6]  681 	inc	sp
   2156 21 DD D2      [10]  682 	ld	hl, #0xd2dd
   2159 E5            [11]  683 	push	hl
   215A CD DD 2D      [17]  684 	call	_cpct_drawSolidBox
   215D F1            [10]  685 	pop	af
                            686 ;src/util/tools.c:234: cpct_drawSolidBox ((u16*)58562-5, 0x55, 1, 2);
   215E 33            [ 6]  687 	inc	sp
   215F 21 01 02      [10]  688 	ld	hl,#0x0201
   2162 E3            [19]  689 	ex	(sp),hl
   2163 3E 55         [ 7]  690 	ld	a, #0x55
   2165 F5            [11]  691 	push	af
   2166 33            [ 6]  692 	inc	sp
   2167 21 BD E4      [10]  693 	ld	hl, #0xe4bd
   216A E5            [11]  694 	push	hl
   216B CD DD 2D      [17]  695 	call	_cpct_drawSolidBox
   216E F1            [10]  696 	pop	af
                            697 ;src/util/tools.c:238: cpct_drawSolidBox ((u16*)49931+2, 0xaa, 1, 2);
   216F 33            [ 6]  698 	inc	sp
   2170 21 01 02      [10]  699 	ld	hl,#0x0201
   2173 E3            [19]  700 	ex	(sp),hl
   2174 3E AA         [ 7]  701 	ld	a, #0xaa
   2176 F5            [11]  702 	push	af
   2177 33            [ 6]  703 	inc	sp
   2178 21 0F C3      [10]  704 	ld	hl, #0xc30f
   217B E5            [11]  705 	push	hl
   217C CD DD 2D      [17]  706 	call	_cpct_drawSolidBox
   217F F1            [10]  707 	pop	af
                            708 ;src/util/tools.c:242: cpct_drawSolidBox ((u16*)54027+2, 0x55, 1, 58-8);
   2180 33            [ 6]  709 	inc	sp
   2181 21 01 32      [10]  710 	ld	hl,#0x3201
   2184 E3            [19]  711 	ex	(sp),hl
   2185 3E 55         [ 7]  712 	ld	a, #0x55
   2187 F5            [11]  713 	push	af
   2188 33            [ 6]  714 	inc	sp
   2189 21 0F D3      [10]  715 	ld	hl, #0xd30f
   218C E5            [11]  716 	push	hl
   218D CD DD 2D      [17]  717 	call	_cpct_drawSolidBox
   2190 F1            [10]  718 	pop	af
                            719 ;src/util/tools.c:245: cpct_drawSolidBox ((u16*)58603+2, 0xaa, 1, 2);
   2191 33            [ 6]  720 	inc	sp
   2192 21 01 02      [10]  721 	ld	hl,#0x0201
   2195 E3            [19]  722 	ex	(sp),hl
   2196 3E AA         [ 7]  723 	ld	a, #0xaa
   2198 F5            [11]  724 	push	af
   2199 33            [ 6]  725 	inc	sp
   219A 21 EF E4      [10]  726 	ld	hl, #0xe4ef
   219D E5            [11]  727 	push	hl
   219E CD DD 2D      [17]  728 	call	_cpct_drawSolidBox
   21A1 F1            [10]  729 	pop	af
   21A2 F1            [10]  730 	pop	af
   21A3 33            [ 6]  731 	inc	sp
   21A4 C9            [10]  732 	ret
                            733 ;src/util/tools.c:249: void drawWindow2(u8 x, u8 y, u8 width, u8 height){
                            734 ;	---------------------------------
                            735 ; Function drawWindow2
                            736 ; ---------------------------------
   21A5                     737 _drawWindow2::
   21A5 DD E5         [15]  738 	push	ix
   21A7 DD 21 00 00   [14]  739 	ld	ix,#0
   21AB DD 39         [15]  740 	add	ix,sp
   21AD F5            [11]  741 	push	af
                            742 ;src/util/tools.c:256: cornerUp = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   21AE DD 66 05      [19]  743 	ld	h, 5 (ix)
   21B1 DD 6E 04      [19]  744 	ld	l, 4 (ix)
   21B4 E5            [11]  745 	push	hl
   21B5 21 00 C0      [10]  746 	ld	hl, #0xc000
   21B8 E5            [11]  747 	push	hl
   21B9 CD 02 2F      [17]  748 	call	_cpct_getScreenPtr
                            749 ;src/util/tools.c:257: lineUp = cpct_getScreenPtr(CPCT_VMEM_START, x, y+1);
   21BC DD 46 05      [19]  750 	ld	b, 5 (ix)
   21BF 04            [ 4]  751 	inc	b
   21C0 C5            [11]  752 	push	bc
   21C1 33            [ 6]  753 	inc	sp
   21C2 DD 7E 04      [19]  754 	ld	a, 4 (ix)
   21C5 F5            [11]  755 	push	af
   21C6 33            [ 6]  756 	inc	sp
   21C7 21 00 C0      [10]  757 	ld	hl, #0xc000
   21CA E5            [11]  758 	push	hl
   21CB CD 02 2F      [17]  759 	call	_cpct_getScreenPtr
                            760 ;src/util/tools.c:258: cornerDown = cpct_getScreenPtr(CPCT_VMEM_START, x, y+height);
   21CE DD 7E 05      [19]  761 	ld	a, 5 (ix)
   21D1 DD 86 07      [19]  762 	add	a, 7 (ix)
   21D4 DD 77 FF      [19]  763 	ld	-1 (ix), a
   21D7 F5            [11]  764 	push	af
   21D8 33            [ 6]  765 	inc	sp
   21D9 DD 7E 04      [19]  766 	ld	a, 4 (ix)
   21DC F5            [11]  767 	push	af
   21DD 33            [ 6]  768 	inc	sp
   21DE 21 00 C0      [10]  769 	ld	hl, #0xc000
   21E1 E5            [11]  770 	push	hl
   21E2 CD 02 2F      [17]  771 	call	_cpct_getScreenPtr
                            772 ;src/util/tools.c:259: lineDown = cpct_getScreenPtr(CPCT_VMEM_START, x, y+height-1);
   21E5 DD 46 FF      [19]  773 	ld	b, -1 (ix)
   21E8 05            [ 4]  774 	dec	b
   21E9 C5            [11]  775 	push	bc
   21EA 33            [ 6]  776 	inc	sp
   21EB DD 7E 04      [19]  777 	ld	a, 4 (ix)
   21EE F5            [11]  778 	push	af
   21EF 33            [ 6]  779 	inc	sp
   21F0 21 00 C0      [10]  780 	ld	hl, #0xc000
   21F3 E5            [11]  781 	push	hl
   21F4 CD 02 2F      [17]  782 	call	_cpct_getScreenPtr
                            783 ;src/util/tools.c:264: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y);
   21F7 DD 46 04      [19]  784 	ld	b, 4 (ix)
   21FA 04            [ 4]  785 	inc	b
   21FB C5            [11]  786 	push	bc
   21FC DD 7E 05      [19]  787 	ld	a, 5 (ix)
   21FF F5            [11]  788 	push	af
   2200 33            [ 6]  789 	inc	sp
   2201 C5            [11]  790 	push	bc
   2202 33            [ 6]  791 	inc	sp
   2203 21 00 C0      [10]  792 	ld	hl, #0xc000
   2206 E5            [11]  793 	push	hl
   2207 CD 02 2F      [17]  794 	call	_cpct_getScreenPtr
   220A C1            [10]  795 	pop	bc
                            796 ;src/util/tools.c:265: cpct_drawSolidBox (pvideo, 0xff, width-4, 2);
   220B DD 7E 06      [19]  797 	ld	a, 6 (ix)
   220E C6 FC         [ 7]  798 	add	a, #0xfc
   2210 4F            [ 4]  799 	ld	c, a
   2211 C5            [11]  800 	push	bc
   2212 3E 02         [ 7]  801 	ld	a, #0x02
   2214 F5            [11]  802 	push	af
   2215 33            [ 6]  803 	inc	sp
   2216 51            [ 4]  804 	ld	d, c
   2217 1E FF         [ 7]  805 	ld	e,#0xff
   2219 D5            [11]  806 	push	de
   221A E5            [11]  807 	push	hl
   221B CD DD 2D      [17]  808 	call	_cpct_drawSolidBox
   221E F1            [10]  809 	pop	af
   221F F1            [10]  810 	pop	af
   2220 33            [ 6]  811 	inc	sp
   2221 C1            [10]  812 	pop	bc
                            813 ;src/util/tools.c:266: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+height);
   2222 C5            [11]  814 	push	bc
   2223 DD 7E FF      [19]  815 	ld	a, -1 (ix)
   2226 F5            [11]  816 	push	af
   2227 33            [ 6]  817 	inc	sp
   2228 C5            [11]  818 	push	bc
   2229 33            [ 6]  819 	inc	sp
   222A 21 00 C0      [10]  820 	ld	hl, #0xc000
   222D E5            [11]  821 	push	hl
   222E CD 02 2F      [17]  822 	call	_cpct_getScreenPtr
   2231 C1            [10]  823 	pop	bc
                            824 ;src/util/tools.c:267: cpct_drawSolidBox (pvideo, 0xff, width-4, 2);
   2232 C5            [11]  825 	push	bc
   2233 3E 02         [ 7]  826 	ld	a, #0x02
   2235 F5            [11]  827 	push	af
   2236 33            [ 6]  828 	inc	sp
   2237 51            [ 4]  829 	ld	d, c
   2238 1E FF         [ 7]  830 	ld	e,#0xff
   223A D5            [11]  831 	push	de
   223B E5            [11]  832 	push	hl
   223C CD DD 2D      [17]  833 	call	_cpct_drawSolidBox
   223F F1            [10]  834 	pop	af
   2240 F1            [10]  835 	pop	af
   2241 33            [ 6]  836 	inc	sp
   2242 C1            [10]  837 	pop	bc
                            838 ;src/util/tools.c:269: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+2);
   2243 DD 7E 05      [19]  839 	ld	a, 5 (ix)
   2246 C6 02         [ 7]  840 	add	a, #0x02
   2248 DD 77 FE      [19]  841 	ld	-2 (ix), a
   224B C5            [11]  842 	push	bc
   224C DD 7E FE      [19]  843 	ld	a, -2 (ix)
   224F F5            [11]  844 	push	af
   2250 33            [ 6]  845 	inc	sp
   2251 C5            [11]  846 	push	bc
   2252 33            [ 6]  847 	inc	sp
   2253 21 00 C0      [10]  848 	ld	hl, #0xc000
   2256 E5            [11]  849 	push	hl
   2257 CD 02 2F      [17]  850 	call	_cpct_getScreenPtr
   225A C1            [10]  851 	pop	bc
                            852 ;src/util/tools.c:270: cpct_drawSolidBox (pvideo, 0x00, width-4, 2);
   225B C5            [11]  853 	push	bc
   225C 06 02         [ 7]  854 	ld	b, #0x02
   225E C5            [11]  855 	push	bc
   225F AF            [ 4]  856 	xor	a, a
   2260 F5            [11]  857 	push	af
   2261 33            [ 6]  858 	inc	sp
   2262 E5            [11]  859 	push	hl
   2263 CD DD 2D      [17]  860 	call	_cpct_drawSolidBox
   2266 F1            [10]  861 	pop	af
   2267 F1            [10]  862 	pop	af
   2268 33            [ 6]  863 	inc	sp
   2269 C1            [10]  864 	pop	bc
                            865 ;src/util/tools.c:271: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+height-2);
   226A DD 35 FF      [23]  866 	dec	-1 (ix)
   226D DD 35 FF      [23]  867 	dec	-1 (ix)
   2270 C5            [11]  868 	push	bc
   2271 DD 7E FF      [19]  869 	ld	a, -1 (ix)
   2274 F5            [11]  870 	push	af
   2275 33            [ 6]  871 	inc	sp
   2276 C5            [11]  872 	push	bc
   2277 33            [ 6]  873 	inc	sp
   2278 21 00 C0      [10]  874 	ld	hl, #0xc000
   227B E5            [11]  875 	push	hl
   227C CD 02 2F      [17]  876 	call	_cpct_getScreenPtr
   227F C1            [10]  877 	pop	bc
                            878 ;src/util/tools.c:272: cpct_drawSolidBox (pvideo, 0x00, width-4, 2);
   2280 C5            [11]  879 	push	bc
   2281 06 02         [ 7]  880 	ld	b, #0x02
   2283 C5            [11]  881 	push	bc
   2284 AF            [ 4]  882 	xor	a, a
   2285 F5            [11]  883 	push	af
   2286 33            [ 6]  884 	inc	sp
   2287 E5            [11]  885 	push	hl
   2288 CD DD 2D      [17]  886 	call	_cpct_drawSolidBox
   228B F1            [10]  887 	pop	af
   228C F1            [10]  888 	pop	af
   228D 33            [ 6]  889 	inc	sp
   228E C1            [10]  890 	pop	bc
                            891 ;src/util/tools.c:276: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+1, y+4);
   228F DD 56 05      [19]  892 	ld	d, 5 (ix)
   2292 14            [ 4]  893 	inc	d
   2293 14            [ 4]  894 	inc	d
   2294 14            [ 4]  895 	inc	d
   2295 14            [ 4]  896 	inc	d
   2296 C5            [11]  897 	push	bc
   2297 D5            [11]  898 	push	de
   2298 58            [ 4]  899 	ld	e, b
   2299 D5            [11]  900 	push	de
   229A 21 00 C0      [10]  901 	ld	hl, #0xc000
   229D E5            [11]  902 	push	hl
   229E CD 02 2F      [17]  903 	call	_cpct_getScreenPtr
   22A1 D1            [10]  904 	pop	de
   22A2 C1            [10]  905 	pop	bc
                            906 ;src/util/tools.c:277: cpct_drawSolidBox (pvideo, 0x3f, width-4, height-6);
   22A3 DD 7E 07      [19]  907 	ld	a, 7 (ix)
   22A6 C6 FA         [ 7]  908 	add	a, #0xfa
   22A8 5F            [ 4]  909 	ld	e, a
   22A9 D5            [11]  910 	push	de
   22AA 7B            [ 4]  911 	ld	a, e
   22AB F5            [11]  912 	push	af
   22AC 33            [ 6]  913 	inc	sp
   22AD 51            [ 4]  914 	ld	d, c
   22AE 1E 3F         [ 7]  915 	ld	e,#0x3f
   22B0 D5            [11]  916 	push	de
   22B1 E5            [11]  917 	push	hl
   22B2 CD DD 2D      [17]  918 	call	_cpct_drawSolidBox
   22B5 F1            [10]  919 	pop	af
   22B6 33            [ 6]  920 	inc	sp
   22B7 DD 66 FE      [19]  921 	ld	h, -2 (ix)
   22BA DD 6E 04      [19]  922 	ld	l, 4 (ix)
   22BD E3            [19]  923 	ex	(sp),hl
   22BE 21 00 C0      [10]  924 	ld	hl, #0xc000
   22C1 E5            [11]  925 	push	hl
   22C2 CD 02 2F      [17]  926 	call	_cpct_getScreenPtr
   22C5 01 01 02      [10]  927 	ld	bc, #0x0201
   22C8 C5            [11]  928 	push	bc
   22C9 3E 55         [ 7]  929 	ld	a, #0x55
   22CB F5            [11]  930 	push	af
   22CC 33            [ 6]  931 	inc	sp
   22CD E5            [11]  932 	push	hl
   22CE CD DD 2D      [17]  933 	call	_cpct_drawSolidBox
   22D1 F1            [10]  934 	pop	af
   22D2 F1            [10]  935 	pop	af
   22D3 33            [ 6]  936 	inc	sp
   22D4 D1            [10]  937 	pop	de
                            938 ;src/util/tools.c:285: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x, y+4);
   22D5 D5            [11]  939 	push	de
   22D6 D5            [11]  940 	push	de
   22D7 33            [ 6]  941 	inc	sp
   22D8 DD 7E 04      [19]  942 	ld	a, 4 (ix)
   22DB F5            [11]  943 	push	af
   22DC 33            [ 6]  944 	inc	sp
   22DD 21 00 C0      [10]  945 	ld	hl, #0xc000
   22E0 E5            [11]  946 	push	hl
   22E1 CD 02 2F      [17]  947 	call	_cpct_getScreenPtr
   22E4 D1            [10]  948 	pop	de
                            949 ;src/util/tools.c:286: cpct_drawSolidBox (pvideo, 0xaa, 1, height-6);
   22E5 D5            [11]  950 	push	de
   22E6 7B            [ 4]  951 	ld	a, e
   22E7 F5            [11]  952 	push	af
   22E8 33            [ 6]  953 	inc	sp
   22E9 01 AA 01      [10]  954 	ld	bc, #0x01aa
   22EC C5            [11]  955 	push	bc
   22ED E5            [11]  956 	push	hl
   22EE CD DD 2D      [17]  957 	call	_cpct_drawSolidBox
   22F1 F1            [10]  958 	pop	af
   22F2 33            [ 6]  959 	inc	sp
   22F3 DD 66 FF      [19]  960 	ld	h, -1 (ix)
   22F6 DD 6E 04      [19]  961 	ld	l, 4 (ix)
   22F9 E3            [19]  962 	ex	(sp),hl
   22FA 21 00 C0      [10]  963 	ld	hl, #0xc000
   22FD E5            [11]  964 	push	hl
   22FE CD 02 2F      [17]  965 	call	_cpct_getScreenPtr
   2301 01 01 02      [10]  966 	ld	bc, #0x0201
   2304 C5            [11]  967 	push	bc
   2305 3E 55         [ 7]  968 	ld	a, #0x55
   2307 F5            [11]  969 	push	af
   2308 33            [ 6]  970 	inc	sp
   2309 E5            [11]  971 	push	hl
   230A CD DD 2D      [17]  972 	call	_cpct_drawSolidBox
   230D F1            [10]  973 	pop	af
   230E F1            [10]  974 	pop	af
   230F 33            [ 6]  975 	inc	sp
   2310 D1            [10]  976 	pop	de
                            977 ;src/util/tools.c:292: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+width-3, y+2);
   2311 DD 7E 04      [19]  978 	ld	a, 4 (ix)
   2314 DD 86 06      [19]  979 	add	a, 6 (ix)
   2317 C6 FD         [ 7]  980 	add	a, #0xfd
   2319 4F            [ 4]  981 	ld	c, a
   231A C5            [11]  982 	push	bc
   231B D5            [11]  983 	push	de
   231C DD 46 FE      [19]  984 	ld	b, -2 (ix)
   231F C5            [11]  985 	push	bc
   2320 21 00 C0      [10]  986 	ld	hl, #0xc000
   2323 E5            [11]  987 	push	hl
   2324 CD 02 2F      [17]  988 	call	_cpct_getScreenPtr
   2327 D1            [10]  989 	pop	de
   2328 C1            [10]  990 	pop	bc
                            991 ;src/util/tools.c:293: cpct_drawSolidBox (pvideo, 0xaa, 1, 2);
   2329 E5            [11]  992 	push	hl
   232A FD E1         [14]  993 	pop	iy
   232C C5            [11]  994 	push	bc
   232D D5            [11]  995 	push	de
   232E 21 01 02      [10]  996 	ld	hl, #0x0201
   2331 E5            [11]  997 	push	hl
   2332 3E AA         [ 7]  998 	ld	a, #0xaa
   2334 F5            [11]  999 	push	af
   2335 33            [ 6] 1000 	inc	sp
   2336 FD E5         [15] 1001 	push	iy
   2338 CD DD 2D      [17] 1002 	call	_cpct_drawSolidBox
   233B F1            [10] 1003 	pop	af
   233C F1            [10] 1004 	pop	af
   233D 33            [ 6] 1005 	inc	sp
   233E D1            [10] 1006 	pop	de
   233F C1            [10] 1007 	pop	bc
                           1008 ;src/util/tools.c:295: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+width-3, y+4);
   2340 C5            [11] 1009 	push	bc
   2341 D5            [11] 1010 	push	de
   2342 59            [ 4] 1011 	ld	e, c
   2343 D5            [11] 1012 	push	de
   2344 21 00 C0      [10] 1013 	ld	hl, #0xc000
   2347 E5            [11] 1014 	push	hl
   2348 CD 02 2F      [17] 1015 	call	_cpct_getScreenPtr
   234B D1            [10] 1016 	pop	de
   234C 7B            [ 4] 1017 	ld	a, e
   234D F5            [11] 1018 	push	af
   234E 33            [ 6] 1019 	inc	sp
   234F 11 55 01      [10] 1020 	ld	de, #0x0155
   2352 D5            [11] 1021 	push	de
   2353 E5            [11] 1022 	push	hl
   2354 CD DD 2D      [17] 1023 	call	_cpct_drawSolidBox
   2357 F1            [10] 1024 	pop	af
   2358 F1            [10] 1025 	pop	af
   2359 33            [ 6] 1026 	inc	sp
   235A C1            [10] 1027 	pop	bc
                           1028 ;src/util/tools.c:298: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, x+width-3, y+height-2);
   235B DD 46 FF      [19] 1029 	ld	b, -1 (ix)
   235E C5            [11] 1030 	push	bc
   235F 21 00 C0      [10] 1031 	ld	hl, #0xc000
   2362 E5            [11] 1032 	push	hl
   2363 CD 02 2F      [17] 1033 	call	_cpct_getScreenPtr
                           1034 ;src/util/tools.c:299: cpct_drawSolidBox (pvideo, 0xaa, 1, 2);
   2366 01 01 02      [10] 1035 	ld	bc, #0x0201
   2369 C5            [11] 1036 	push	bc
   236A 3E AA         [ 7] 1037 	ld	a, #0xaa
   236C F5            [11] 1038 	push	af
   236D 33            [ 6] 1039 	inc	sp
   236E E5            [11] 1040 	push	hl
   236F CD DD 2D      [17] 1041 	call	_cpct_drawSolidBox
   2372 DD F9         [10] 1042 	ld	sp,ix
   2374 DD E1         [14] 1043 	pop	ix
   2376 C9            [10] 1044 	ret
                           1045 	.area _CODE
                           1046 	.area _INITIALIZER
                           1047 	.area _CABS (ABS)
