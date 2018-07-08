                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _itoa
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_waitVSYNC
                             14 	.globl _cpct_drawSpriteMaskedAlignedTable
                             15 	.globl _cpct_drawSprite
                             16 	.globl _swapColors
                             17 	.globl _numbers
                             18 	.globl _font
                             19 	.globl _strLength
                             20 	.globl _strCopy
                             21 	.globl _drawNumber
                             22 	.globl _drawText
                             23 	.globl _drawText2
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _INITIALIZED
                             35 ;--------------------------------------------------------
                             36 ; absolute external ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DABS (ABS)
                             39 ;--------------------------------------------------------
                             40 ; global & static initialisations
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _GSINIT
                             44 	.area _GSFINAL
                             45 	.area _GSINIT
                             46 ;--------------------------------------------------------
                             47 ; Home
                             48 ;--------------------------------------------------------
                             49 	.area _HOME
                             50 	.area _HOME
                             51 ;--------------------------------------------------------
                             52 ; code
                             53 ;--------------------------------------------------------
                             54 	.area _CODE
                             55 ;src/text/text.c:54: char *itoa(int value, char *result, int base)
                             56 ;	---------------------------------
                             57 ; Function itoa
                             58 ; ---------------------------------
   2377                      59 _itoa::
   2377 DD E5         [15]   60 	push	ix
   2379 DD 21 00 00   [14]   61 	ld	ix,#0
   237D DD 39         [15]   62 	add	ix,sp
   237F 21 F9 FF      [10]   63 	ld	hl, #-7
   2382 39            [11]   64 	add	hl, sp
   2383 F9            [ 6]   65 	ld	sp, hl
                             66 ;src/text/text.c:58: char *ptr = result, *ptr1 = result, tmp_char;
   2384 DD 5E 06      [19]   67 	ld	e,6 (ix)
   2387 DD 56 07      [19]   68 	ld	d,7 (ix)
   238A DD 73 FA      [19]   69 	ld	-6 (ix), e
   238D DD 72 FB      [19]   70 	ld	-5 (ix), d
                             71 ;src/text/text.c:61: if (base < 2 || base > 36)
   2390 DD 7E 08      [19]   72 	ld	a, 8 (ix)
   2393 D6 02         [ 7]   73 	sub	a, #0x02
   2395 DD 7E 09      [19]   74 	ld	a, 9 (ix)
   2398 17            [ 4]   75 	rla
   2399 3F            [ 4]   76 	ccf
   239A 1F            [ 4]   77 	rra
   239B DE 80         [ 7]   78 	sbc	a, #0x80
   239D 38 12         [12]   79 	jr	C,00101$
   239F 3E 24         [ 7]   80 	ld	a, #0x24
   23A1 DD BE 08      [19]   81 	cp	a, 8 (ix)
   23A4 3E 00         [ 7]   82 	ld	a, #0x00
   23A6 DD 9E 09      [19]   83 	sbc	a, 9 (ix)
   23A9 E2 AE 23      [10]   84 	jp	PO, 00140$
   23AC EE 80         [ 7]   85 	xor	a, #0x80
   23AE                      86 00140$:
   23AE F2 B7 23      [10]   87 	jp	P, 00115$
   23B1                      88 00101$:
                             89 ;src/text/text.c:63: *result = '\0';
   23B1 AF            [ 4]   90 	xor	a, a
   23B2 12            [ 7]   91 	ld	(de), a
                             92 ;src/text/text.c:64: return result;
   23B3 EB            [ 4]   93 	ex	de,hl
   23B4 C3 58 24      [10]   94 	jp	00112$
                             95 ;src/text/text.c:67: do
   23B7                      96 00115$:
   23B7 DD 73 FE      [19]   97 	ld	-2 (ix), e
   23BA DD 72 FF      [19]   98 	ld	-1 (ix), d
   23BD                      99 00104$:
                            100 ;src/text/text.c:69: tmp_value = value;
   23BD DD 7E 04      [19]  101 	ld	a, 4 (ix)
   23C0 DD 77 FC      [19]  102 	ld	-4 (ix), a
   23C3 DD 7E 05      [19]  103 	ld	a, 5 (ix)
   23C6 DD 77 FD      [19]  104 	ld	-3 (ix), a
                            105 ;src/text/text.c:70: value /= base;
   23C9 DD 6E 08      [19]  106 	ld	l,8 (ix)
   23CC DD 66 09      [19]  107 	ld	h,9 (ix)
   23CF E5            [11]  108 	push	hl
   23D0 DD 6E FC      [19]  109 	ld	l,-4 (ix)
   23D3 DD 66 FD      [19]  110 	ld	h,-3 (ix)
   23D6 E5            [11]  111 	push	hl
   23D7 CD 22 2F      [17]  112 	call	__divsint
   23DA F1            [10]  113 	pop	af
   23DB F1            [10]  114 	pop	af
   23DC DD 75 04      [19]  115 	ld	4 (ix), l
   23DF DD 74 05      [19]  116 	ld	5 (ix), h
                            117 ;src/text/text.c:71: *ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
   23E2 DD 4E FC      [19]  118 	ld	c, -4 (ix)
   23E5 DD 5E 04      [19]  119 	ld	e, 4 (ix)
   23E8 DD 66 08      [19]  120 	ld	h, 8 (ix)
   23EB 2E 00         [ 7]  121 	ld	l, #0x00
   23ED 55            [ 4]  122 	ld	d, l
   23EE 06 08         [ 7]  123 	ld	b, #0x08
   23F0                     124 00141$:
   23F0 29            [11]  125 	add	hl, hl
   23F1 30 01         [12]  126 	jr	NC,00142$
   23F3 19            [11]  127 	add	hl, de
   23F4                     128 00142$:
   23F4 10 FA         [13]  129 	djnz	00141$
   23F6 79            [ 4]  130 	ld	a, c
   23F7 95            [ 4]  131 	sub	a, l
   23F8 C6 23         [ 7]  132 	add	a, #0x23
   23FA 4F            [ 4]  133 	ld	c, a
   23FB 17            [ 4]  134 	rla
   23FC 9F            [ 4]  135 	sbc	a, a
   23FD 47            [ 4]  136 	ld	b, a
   23FE 21 CD 24      [10]  137 	ld	hl, #___str_0
   2401 09            [11]  138 	add	hl, bc
   2402 4E            [ 7]  139 	ld	c, (hl)
   2403 DD 6E FE      [19]  140 	ld	l,-2 (ix)
   2406 DD 66 FF      [19]  141 	ld	h,-1 (ix)
   2409 71            [ 7]  142 	ld	(hl), c
   240A DD 34 FE      [23]  143 	inc	-2 (ix)
   240D 20 03         [12]  144 	jr	NZ,00143$
   240F DD 34 FF      [23]  145 	inc	-1 (ix)
   2412                     146 00143$:
                            147 ;src/text/text.c:73: while ( value );
   2412 DD 7E 05      [19]  148 	ld	a, 5 (ix)
   2415 DD B6 04      [19]  149 	or	a,4 (ix)
   2418 20 A3         [12]  150 	jr	NZ,00104$
                            151 ;src/text/text.c:76: if (tmp_value < 0) *ptr++ = '-';
   241A DD 4E FE      [19]  152 	ld	c,-2 (ix)
   241D DD 46 FF      [19]  153 	ld	b,-1 (ix)
   2420 DD CB FD 7E   [20]  154 	bit	7, -3 (ix)
   2424 28 0F         [12]  155 	jr	Z,00108$
   2426 DD 6E FE      [19]  156 	ld	l,-2 (ix)
   2429 DD 66 FF      [19]  157 	ld	h,-1 (ix)
   242C 36 2D         [10]  158 	ld	(hl), #0x2d
   242E DD 4E FE      [19]  159 	ld	c,-2 (ix)
   2431 DD 46 FF      [19]  160 	ld	b,-1 (ix)
   2434 03            [ 6]  161 	inc	bc
   2435                     162 00108$:
                            163 ;src/text/text.c:77: *ptr-- = '\0';
   2435 AF            [ 4]  164 	xor	a, a
   2436 02            [ 7]  165 	ld	(bc), a
   2437 0B            [ 6]  166 	dec	bc
                            167 ;src/text/text.c:78: while(ptr1 < ptr)
   2438 DD 5E FA      [19]  168 	ld	e,-6 (ix)
   243B DD 56 FB      [19]  169 	ld	d,-5 (ix)
   243E                     170 00109$:
   243E 7B            [ 4]  171 	ld	a, e
   243F 91            [ 4]  172 	sub	a, c
   2440 7A            [ 4]  173 	ld	a, d
   2441 98            [ 4]  174 	sbc	a, b
   2442 30 0E         [12]  175 	jr	NC,00111$
                            176 ;src/text/text.c:80: tmp_char = *ptr;
   2444 0A            [ 7]  177 	ld	a, (bc)
   2445 DD 77 F9      [19]  178 	ld	-7 (ix), a
                            179 ;src/text/text.c:81: *ptr-- = *ptr1;
   2448 1A            [ 7]  180 	ld	a, (de)
   2449 02            [ 7]  181 	ld	(bc), a
   244A 0B            [ 6]  182 	dec	bc
                            183 ;src/text/text.c:82: *ptr1++ = tmp_char;
   244B DD 7E F9      [19]  184 	ld	a, -7 (ix)
   244E 12            [ 7]  185 	ld	(de), a
   244F 13            [ 6]  186 	inc	de
   2450 18 EC         [12]  187 	jr	00109$
   2452                     188 00111$:
                            189 ;src/text/text.c:84: return result;
   2452 DD 6E 06      [19]  190 	ld	l,6 (ix)
   2455 DD 66 07      [19]  191 	ld	h,7 (ix)
   2458                     192 00112$:
   2458 DD F9         [10]  193 	ld	sp, ix
   245A DD E1         [14]  194 	pop	ix
   245C C9            [10]  195 	ret
   245D                     196 _font:
   245D A6 19               197 	.dw _g_fonts_small_00
   245F B0 19               198 	.dw _g_fonts_small_01
   2461 BA 19               199 	.dw _g_fonts_small_02
   2463 C4 19               200 	.dw _g_fonts_small_03
   2465 CE 19               201 	.dw _g_fonts_small_04
   2467 D8 19               202 	.dw _g_fonts_small_05
   2469 E2 19               203 	.dw _g_fonts_small_06
   246B EC 19               204 	.dw _g_fonts_small_07
   246D F6 19               205 	.dw _g_fonts_small_08
   246F 00 1A               206 	.dw _g_fonts_small_09
   2471 0A 1A               207 	.dw _g_fonts_small_10
   2473 14 1A               208 	.dw _g_fonts_small_11
   2475 1E 1A               209 	.dw _g_fonts_small_12
   2477 28 1A               210 	.dw _g_fonts_small_13
   2479 32 1A               211 	.dw _g_fonts_small_14
   247B 3C 1A               212 	.dw _g_fonts_small_15
   247D 46 1A               213 	.dw _g_fonts_small_16
   247F 50 1A               214 	.dw _g_fonts_small_17
   2481 5A 1A               215 	.dw _g_fonts_small_18
   2483 64 1A               216 	.dw _g_fonts_small_19
   2485 6E 1A               217 	.dw _g_fonts_small_20
   2487 78 1A               218 	.dw _g_fonts_small_21
   2489 82 1A               219 	.dw _g_fonts_small_22
   248B 8C 1A               220 	.dw _g_fonts_small_23
   248D 96 1A               221 	.dw _g_fonts_small_24
   248F A0 1A               222 	.dw _g_fonts_small_25
   2491 AA 1A               223 	.dw _g_fonts_small_26
   2493 B4 1A               224 	.dw _g_fonts_small_27
   2495 BE 1A               225 	.dw _g_fonts_small_28
   2497                     226 _numbers:
   2497 CA 13               227 	.dw _g_numbers_small_00
   2499 D4 13               228 	.dw _g_numbers_small_01
   249B DE 13               229 	.dw _g_numbers_small_02
   249D E8 13               230 	.dw _g_numbers_small_03
   249F F2 13               231 	.dw _g_numbers_small_04
   24A1 FC 13               232 	.dw _g_numbers_small_05
   24A3 06 14               233 	.dw _g_numbers_small_06
   24A5 10 14               234 	.dw _g_numbers_small_07
   24A7 1A 14               235 	.dw _g_numbers_small_08
   24A9 24 14               236 	.dw _g_numbers_small_09
   24AB 2E 14               237 	.dw _g_numbers_small_10
   24AD 38 14               238 	.dw _g_numbers_small_11
   24AF 42 14               239 	.dw _g_numbers_small_12
   24B1 4C 14               240 	.dw _g_numbers_small_13
   24B3 56 14               241 	.dw _g_numbers_small_14
   24B5                     242 _swapColors:
   24B5 7F                  243 	.db #0x7f	; 127
   24B6 FF                  244 	.db #0xff	; 255
   24B7 AA                  245 	.db #0xaa	; 170
   24B8 55                  246 	.db #0x55	; 85	'U'
   24B9 3E                  247 	.db #0x3e	; 62
   24BA 3C                  248 	.db #0x3c	; 60
   24BB 28                  249 	.db #0x28	; 40
   24BC 14                  250 	.db #0x14	; 20
   24BD 7A                  251 	.db #0x7a	; 122	'z'
   24BE F0                  252 	.db #0xf0	; 240
   24BF A0                  253 	.db #0xa0	; 160
   24C0 50                  254 	.db #0x50	; 80	'P'
   24C1 3B                  255 	.db #0x3b	; 59
   24C2 33                  256 	.db #0x33	; 51	'3'
   24C3 22                  257 	.db #0x22	; 34
   24C4 11                  258 	.db #0x11	; 17
   24C5 3A                  259 	.db #0x3a	; 58
   24C6 30                  260 	.db #0x30	; 48	'0'
   24C7 20                  261 	.db #0x20	; 32
   24C8 10                  262 	.db #0x10	; 16
   24C9 7B                  263 	.db #0x7b	; 123
   24CA F3                  264 	.db #0xf3	; 243
   24CB A2                  265 	.db #0xa2	; 162
   24CC 51                  266 	.db #0x51	; 81	'Q'
   24CD                     267 ___str_0:
   24CD 7A 79 78 77 76 75   268 	.ascii "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmno"
        74 73 72 71 70 6F
        6E 6D 6C 6B 6A 69
        68 67 66 65 64 63
        62 61 39 38 37 36
        35 34 33 32 31 30
        31 32 33 34 35 36
        37 38 39 61 62 63
        64 65 66 67 68 69
        6A 6B 6C 6D 6E 6F
   2509 70 71 72 73 74 75   269 	.ascii "pqrstuvwxyz"
        76 77 78 79 7A
   2514 00                  270 	.db 0x00
                            271 ;src/text/text.c:97: u8 strLength(u8 str[]) {
                            272 ;	---------------------------------
                            273 ; Function strLength
                            274 ; ---------------------------------
   2515                     275 _strLength::
                            276 ;src/text/text.c:101: while (str[result] != '\0') {
   2515 0E 00         [ 7]  277 	ld	c, #0x00
   2517                     278 00101$:
   2517 21 02 00      [10]  279 	ld	hl, #2
   251A 39            [11]  280 	add	hl, sp
   251B 7E            [ 7]  281 	ld	a, (hl)
   251C 23            [ 6]  282 	inc	hl
   251D 66            [ 7]  283 	ld	h, (hl)
   251E 6F            [ 4]  284 	ld	l, a
   251F 06 00         [ 7]  285 	ld	b, #0x00
   2521 09            [11]  286 	add	hl, bc
   2522 7E            [ 7]  287 	ld	a, (hl)
   2523 B7            [ 4]  288 	or	a, a
   2524 28 03         [12]  289 	jr	Z,00103$
                            290 ;src/text/text.c:102: result++;
   2526 0C            [ 4]  291 	inc	c
   2527 18 EE         [12]  292 	jr	00101$
   2529                     293 00103$:
                            294 ;src/text/text.c:104: return result;
   2529 69            [ 4]  295 	ld	l, c
   252A C9            [10]  296 	ret
                            297 ;src/text/text.c:118: void strCopy(u8 *str1, u8 *str2){
                            298 ;	---------------------------------
                            299 ; Function strCopy
                            300 ; ---------------------------------
   252B                     301 _strCopy::
                            302 ;src/text/text.c:120: while (str1[i] != '\0'){
   252B 0E 00         [ 7]  303 	ld	c, #0x00
   252D                     304 00101$:
   252D 21 02 00      [10]  305 	ld	hl, #2
   2530 39            [11]  306 	add	hl, sp
   2531 7E            [ 7]  307 	ld	a, (hl)
   2532 23            [ 6]  308 	inc	hl
   2533 66            [ 7]  309 	ld	h, (hl)
   2534 6F            [ 4]  310 	ld	l, a
   2535 06 00         [ 7]  311 	ld	b, #0x00
   2537 09            [11]  312 	add	hl, bc
   2538 46            [ 7]  313 	ld	b, (hl)
   2539 78            [ 4]  314 	ld	a, b
   253A B7            [ 4]  315 	or	a, a
   253B C8            [11]  316 	ret	Z
                            317 ;src/text/text.c:121: str2[i] = str1[i];
   253C FD 21 04 00   [14]  318 	ld	iy, #4
   2540 FD 39         [15]  319 	add	iy, sp
   2542 FD 7E 00      [19]  320 	ld	a, 0 (iy)
   2545 81            [ 4]  321 	add	a, c
   2546 5F            [ 4]  322 	ld	e, a
   2547 FD 7E 01      [19]  323 	ld	a, 1 (iy)
   254A CE 00         [ 7]  324 	adc	a, #0x00
   254C 57            [ 4]  325 	ld	d, a
   254D 78            [ 4]  326 	ld	a, b
   254E 12            [ 7]  327 	ld	(de), a
                            328 ;src/text/text.c:122: i++;
   254F 0C            [ 4]  329 	inc	c
   2550 18 DB         [12]  330 	jr	00101$
                            331 ;src/text/text.c:135: void drawNumber(i32 aNumber, u8 length, u8 xPos, u8 yPos, u8 delay) {
                            332 ;	---------------------------------
                            333 ; Function drawNumber
                            334 ; ---------------------------------
   2552                     335 _drawNumber::
   2552 DD E5         [15]  336 	push	ix
   2554 DD 21 00 00   [14]  337 	ld	ix,#0
   2558 DD 39         [15]  338 	add	ix,sp
   255A 21 F8 FF      [10]  339 	ld	hl, #-8
   255D 39            [11]  340 	add	hl, sp
                            341 ;src/text/text.c:145: itoa(aNumber, str, 10);
   255E F9            [ 6]  342 	ld	sp, hl
   255F 23            [ 6]  343 	inc	hl
   2560 23            [ 6]  344 	inc	hl
   2561 4D            [ 4]  345 	ld	c,l
   2562 44            [ 4]  346 	ld	b,h
   2563 DD 5E 04      [19]  347 	ld	e, 4 (ix)
   2566 DD 56 05      [19]  348 	ld	d, 5 (ix)
   2569 D5            [11]  349 	push	de
   256A FD E1         [14]  350 	pop	iy
   256C C5            [11]  351 	push	bc
   256D 11 0A 00      [10]  352 	ld	de, #0x000a
   2570 D5            [11]  353 	push	de
   2571 E5            [11]  354 	push	hl
   2572 FD E5         [15]  355 	push	iy
   2574 CD 77 23      [17]  356 	call	_itoa
   2577 21 06 00      [10]  357 	ld	hl, #6
   257A 39            [11]  358 	add	hl, sp
   257B F9            [ 6]  359 	ld	sp, hl
   257C C1            [10]  360 	pop	bc
                            361 ;src/text/text.c:147: zeros = length - strLength(str);
   257D 59            [ 4]  362 	ld	e, c
   257E 50            [ 4]  363 	ld	d, b
   257F C5            [11]  364 	push	bc
   2580 D5            [11]  365 	push	de
   2581 CD 15 25      [17]  366 	call	_strLength
   2584 F1            [10]  367 	pop	af
   2585 C1            [10]  368 	pop	bc
   2586 DD 7E 08      [19]  369 	ld	a, 8 (ix)
   2589 95            [ 4]  370 	sub	a, l
   258A DD 77 F9      [19]  371 	ld	-7 (ix), a
                            372 ;src/text/text.c:149: number = str[x];
   258D 0A            [ 7]  373 	ld	a, (bc)
   258E 5F            [ 4]  374 	ld	e, a
                            375 ;src/text/text.c:151: while (number != '\0') {
   258F DD 36 F8 00   [19]  376 	ld	-8 (ix), #0x00
   2593                     377 00103$:
   2593 7B            [ 4]  378 	ld	a, e
   2594 B7            [ 4]  379 	or	a, a
   2595 28 5A         [12]  380 	jr	Z,00106$
                            381 ;src/text/text.c:153: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (zeros + x) * FONT_W + xPos, yPos);
   2597 DD 7E F9      [19]  382 	ld	a, -7 (ix)
   259A DD 86 F8      [19]  383 	add	a, -8 (ix)
   259D 87            [ 4]  384 	add	a, a
   259E DD 86 09      [19]  385 	add	a, 9 (ix)
   25A1 57            [ 4]  386 	ld	d, a
   25A2 C5            [11]  387 	push	bc
   25A3 D5            [11]  388 	push	de
   25A4 DD 7E 0A      [19]  389 	ld	a, 10 (ix)
   25A7 F5            [11]  390 	push	af
   25A8 33            [ 6]  391 	inc	sp
   25A9 D5            [11]  392 	push	de
   25AA 33            [ 6]  393 	inc	sp
   25AB 21 00 C0      [10]  394 	ld	hl, #0xc000
   25AE E5            [11]  395 	push	hl
   25AF CD 02 2F      [17]  396 	call	_cpct_getScreenPtr
   25B2 D1            [10]  397 	pop	de
   25B3 C1            [10]  398 	pop	bc
                            399 ;src/text/text.c:154: cpct_drawSpriteMaskedAlignedTable(numbers[number - 44], pvideo, FONT_W, FONT_H, g_tablatrans);
   25B4 E5            [11]  400 	push	hl
   25B5 FD E1         [14]  401 	pop	iy
   25B7 7B            [ 4]  402 	ld	a, e
   25B8 C6 D4         [ 7]  403 	add	a, #0xd4
   25BA 6F            [ 4]  404 	ld	l, a
   25BB 26 00         [ 7]  405 	ld	h, #0x00
   25BD 29            [11]  406 	add	hl, hl
   25BE 11 97 24      [10]  407 	ld	de, #_numbers
   25C1 19            [11]  408 	add	hl, de
   25C2 5E            [ 7]  409 	ld	e, (hl)
   25C3 23            [ 6]  410 	inc	hl
   25C4 56            [ 7]  411 	ld	d, (hl)
   25C5 C5            [11]  412 	push	bc
   25C6 21 00 01      [10]  413 	ld	hl, #_g_tablatrans
   25C9 E5            [11]  414 	push	hl
   25CA 21 02 05      [10]  415 	ld	hl, #0x0502
   25CD E5            [11]  416 	push	hl
   25CE FD E5         [15]  417 	push	iy
   25D0 D5            [11]  418 	push	de
   25D1 CD 96 2E      [17]  419 	call	_cpct_drawSpriteMaskedAlignedTable
   25D4 C1            [10]  420 	pop	bc
                            421 ;src/text/text.c:155: number = str[++x];
   25D5 DD 34 F8      [23]  422 	inc	-8 (ix)
   25D8 DD 6E F8      [19]  423 	ld	l,-8 (ix)
   25DB 26 00         [ 7]  424 	ld	h,#0x00
   25DD 09            [11]  425 	add	hl, bc
   25DE 5E            [ 7]  426 	ld	e, (hl)
                            427 ;src/text/text.c:158: if (delay){
   25DF DD 7E 0B      [19]  428 	ld	a, 11 (ix)
   25E2 B7            [ 4]  429 	or	a, a
   25E3 28 AE         [12]  430 	jr	Z,00103$
                            431 ;src/text/text.c:159: cpct_waitVSYNC ();
   25E5 C5            [11]  432 	push	bc
   25E6 D5            [11]  433 	push	de
   25E7 CD 6A 2D      [17]  434 	call	_cpct_waitVSYNC
   25EA CD 6A 2D      [17]  435 	call	_cpct_waitVSYNC
   25ED D1            [10]  436 	pop	de
   25EE C1            [10]  437 	pop	bc
   25EF 18 A2         [12]  438 	jr	00103$
   25F1                     439 00106$:
   25F1 DD F9         [10]  440 	ld	sp, ix
   25F3 DD E1         [14]  441 	pop	ix
   25F5 C9            [10]  442 	ret
                            443 ;src/text/text.c:176: void drawText(u8 text[], u8 xPos, u8 yPos, u8 centered, u8 delay) {
                            444 ;	---------------------------------
                            445 ; Function drawText
                            446 ; ---------------------------------
   25F6                     447 _drawText::
   25F6 DD E5         [15]  448 	push	ix
   25F8 DD 21 00 00   [14]  449 	ld	ix,#0
   25FC DD 39         [15]  450 	add	ix,sp
   25FE 3B            [ 6]  451 	dec	sp
                            452 ;src/text/text.c:182: if (centered) {
   25FF DD 7E 08      [19]  453 	ld	a, 8 (ix)
   2602 B7            [ 4]  454 	or	a, a
   2603 28 15         [12]  455 	jr	Z,00102$
                            456 ;src/text/text.c:183: x = strLength(text);
   2605 DD 6E 04      [19]  457 	ld	l,4 (ix)
   2608 DD 66 05      [19]  458 	ld	h,5 (ix)
   260B E5            [11]  459 	push	hl
   260C CD 15 25      [17]  460 	call	_strLength
   260F F1            [10]  461 	pop	af
                            462 ;src/text/text.c:184: xPos = 39 - (x / 2) * FONT_W;
   2610 CB 3D         [ 8]  463 	srl	l
   2612 CB 25         [ 8]  464 	sla	l
   2614 3E 27         [ 7]  465 	ld	a, #0x27
   2616 95            [ 4]  466 	sub	a, l
   2617 DD 77 06      [19]  467 	ld	6 (ix), a
   261A                     468 00102$:
                            469 ;src/text/text.c:190: character = text[x];
   261A DD 4E 04      [19]  470 	ld	c,4 (ix)
   261D DD 46 05      [19]  471 	ld	b,5 (ix)
   2620 0A            [ 7]  472 	ld	a, (bc)
   2621 5F            [ 4]  473 	ld	e, a
                            474 ;src/text/text.c:192: while (character != '\0') {
   2622 DD 36 FF 00   [19]  475 	ld	-1 (ix), #0x00
   2626                     476 00111$:
   2626 7B            [ 4]  477 	ld	a, e
   2627 B7            [ 4]  478 	or	a, a
   2628 CA B2 26      [10]  479 	jp	Z, 00114$
                            480 ;src/text/text.c:194: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, (x * FONT_W) + xPos, yPos);
   262B DD 7E FF      [19]  481 	ld	a, -1 (ix)
   262E 87            [ 4]  482 	add	a, a
   262F DD 86 06      [19]  483 	add	a, 6 (ix)
   2632 57            [ 4]  484 	ld	d, a
   2633 C5            [11]  485 	push	bc
   2634 D5            [11]  486 	push	de
   2635 DD 7E 07      [19]  487 	ld	a, 7 (ix)
   2638 F5            [11]  488 	push	af
   2639 33            [ 6]  489 	inc	sp
   263A D5            [11]  490 	push	de
   263B 33            [ 6]  491 	inc	sp
   263C 21 00 C0      [10]  492 	ld	hl, #0xc000
   263F E5            [11]  493 	push	hl
   2640 CD 02 2F      [17]  494 	call	_cpct_getScreenPtr
   2643 D1            [10]  495 	pop	de
   2644 C1            [10]  496 	pop	bc
                            497 ;src/text/text.c:199: cpct_drawSpriteMaskedAlignedTable(numbers[character - 44], pvideo, FONT_W, FONT_H, g_tablatrans);
   2645 E5            [11]  498 	push	hl
   2646 FD E1         [14]  499 	pop	iy
                            500 ;src/text/text.c:197: if (character >= 44 && character <= 58) {
   2648 7B            [ 4]  501 	ld	a, e
   2649 D6 2C         [ 7]  502 	sub	a, #0x2c
   264B 38 25         [12]  503 	jr	C,00106$
   264D 3E 3A         [ 7]  504 	ld	a, #0x3a
   264F 93            [ 4]  505 	sub	a, e
   2650 38 20         [12]  506 	jr	C,00106$
                            507 ;src/text/text.c:199: cpct_drawSpriteMaskedAlignedTable(numbers[character - 44], pvideo, FONT_W, FONT_H, g_tablatrans);
   2652 7B            [ 4]  508 	ld	a, e
   2653 C6 D4         [ 7]  509 	add	a, #0xd4
   2655 6F            [ 4]  510 	ld	l, a
   2656 26 00         [ 7]  511 	ld	h, #0x00
   2658 29            [11]  512 	add	hl, hl
   2659 11 97 24      [10]  513 	ld	de, #_numbers
   265C 19            [11]  514 	add	hl, de
   265D 5E            [ 7]  515 	ld	e, (hl)
   265E 23            [ 6]  516 	inc	hl
   265F 56            [ 7]  517 	ld	d, (hl)
   2660 C5            [11]  518 	push	bc
   2661 21 00 01      [10]  519 	ld	hl, #_g_tablatrans
   2664 E5            [11]  520 	push	hl
   2665 21 02 05      [10]  521 	ld	hl, #0x0502
   2668 E5            [11]  522 	push	hl
   2669 FD E5         [15]  523 	push	iy
   266B D5            [11]  524 	push	de
   266C CD 96 2E      [17]  525 	call	_cpct_drawSpriteMaskedAlignedTable
   266F C1            [10]  526 	pop	bc
   2670 18 22         [12]  527 	jr	00107$
   2672                     528 00106$:
                            529 ;src/text/text.c:202: else if (character != 32) { //32 = SPACE
                            530 ;src/text/text.c:204: cpct_drawSpriteMaskedAlignedTable(font[character - 63], pvideo, FONT_W, FONT_H, g_tablatrans);
   2672 7B            [ 4]  531 	ld	a,e
   2673 FE 20         [ 7]  532 	cp	a,#0x20
   2675 28 1D         [12]  533 	jr	Z,00107$
   2677 C6 C1         [ 7]  534 	add	a, #0xc1
   2679 6F            [ 4]  535 	ld	l, a
   267A 26 00         [ 7]  536 	ld	h, #0x00
   267C 29            [11]  537 	add	hl, hl
   267D 11 5D 24      [10]  538 	ld	de, #_font
   2680 19            [11]  539 	add	hl, de
   2681 5E            [ 7]  540 	ld	e, (hl)
   2682 23            [ 6]  541 	inc	hl
   2683 56            [ 7]  542 	ld	d, (hl)
   2684 C5            [11]  543 	push	bc
   2685 21 00 01      [10]  544 	ld	hl, #_g_tablatrans
   2688 E5            [11]  545 	push	hl
   2689 21 02 05      [10]  546 	ld	hl, #0x0502
   268C E5            [11]  547 	push	hl
   268D FD E5         [15]  548 	push	iy
   268F D5            [11]  549 	push	de
   2690 CD 96 2E      [17]  550 	call	_cpct_drawSpriteMaskedAlignedTable
   2693 C1            [10]  551 	pop	bc
   2694                     552 00107$:
                            553 ;src/text/text.c:207: character = text[++x];
   2694 DD 34 FF      [23]  554 	inc	-1 (ix)
   2697 DD 6E FF      [19]  555 	ld	l,-1 (ix)
   269A 26 00         [ 7]  556 	ld	h,#0x00
   269C 09            [11]  557 	add	hl, bc
   269D 5E            [ 7]  558 	ld	e, (hl)
                            559 ;src/text/text.c:210: if (delay){
   269E DD 7E 09      [19]  560 	ld	a, 9 (ix)
   26A1 B7            [ 4]  561 	or	a, a
   26A2 CA 26 26      [10]  562 	jp	Z, 00111$
                            563 ;src/text/text.c:211: cpct_waitVSYNC ();
   26A5 C5            [11]  564 	push	bc
   26A6 D5            [11]  565 	push	de
   26A7 CD 6A 2D      [17]  566 	call	_cpct_waitVSYNC
   26AA CD 6A 2D      [17]  567 	call	_cpct_waitVSYNC
   26AD D1            [10]  568 	pop	de
   26AE C1            [10]  569 	pop	bc
   26AF C3 26 26      [10]  570 	jp	00111$
   26B2                     571 00114$:
   26B2 33            [ 6]  572 	inc	sp
   26B3 DD E1         [14]  573 	pop	ix
   26B5 C9            [10]  574 	ret
                            575 ;src/text/text.c:221: void drawText2(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
                            576 ;	---------------------------------
                            577 ; Function drawText2
                            578 ; ---------------------------------
   26B6                     579 _drawText2::
   26B6 DD E5         [15]  580 	push	ix
   26B8 DD 21 00 00   [14]  581 	ld	ix,#0
   26BC DD 39         [15]  582 	add	ix,sp
   26BE 21 AD FF      [10]  583 	ld	hl, #-83
   26C1 39            [11]  584 	add	hl, sp
   26C2 F9            [ 6]  585 	ld	sp, hl
                            586 ;src/text/text.c:232: color1 = swapColors[color][0];
   26C3 01 B5 24      [10]  587 	ld	bc, #_swapColors+0
   26C6 DD 6E 08      [19]  588 	ld	l, 8 (ix)
   26C9 26 00         [ 7]  589 	ld	h, #0x00
   26CB 29            [11]  590 	add	hl, hl
   26CC 29            [11]  591 	add	hl, hl
   26CD 09            [11]  592 	add	hl, bc
   26CE E5            [11]  593 	push	hl
   26CF FD E1         [14]  594 	pop	iy
   26D1 FD 7E 00      [19]  595 	ld	a, 0 (iy)
   26D4 DD 77 D6      [19]  596 	ld	-42 (ix), a
                            597 ;src/text/text.c:233: color2 = swapColors[color][1];
   26D7 FD E5         [15]  598 	push	iy
   26D9 E1            [10]  599 	pop	hl
   26DA 23            [ 6]  600 	inc	hl
   26DB 7E            [ 7]  601 	ld	a, (hl)
   26DC DD 77 D5      [19]  602 	ld	-43 (ix), a
                            603 ;src/text/text.c:234: color3 = swapColors[color][2];
   26DF FD E5         [15]  604 	push	iy
   26E1 E1            [10]  605 	pop	hl
   26E2 23            [ 6]  606 	inc	hl
   26E3 23            [ 6]  607 	inc	hl
   26E4 7E            [ 7]  608 	ld	a, (hl)
   26E5 DD 77 D4      [19]  609 	ld	-44 (ix), a
                            610 ;src/text/text.c:235: color4 = swapColors[color][3];
   26E8 FD 7E 03      [19]  611 	ld	a, 3 (iy)
   26EB DD 77 D1      [19]  612 	ld	-47 (ix), a
                            613 ;src/text/text.c:241: character = text[x];
   26EE DD 7E 04      [19]  614 	ld	a, 4 (ix)
   26F1 DD 77 E7      [19]  615 	ld	-25 (ix), a
   26F4 DD 7E 05      [19]  616 	ld	a, 5 (ix)
   26F7 DD 77 E8      [19]  617 	ld	-24 (ix), a
   26FA DD 6E E7      [19]  618 	ld	l,-25 (ix)
   26FD DD 66 E8      [19]  619 	ld	h,-24 (ix)
   2700 7E            [ 7]  620 	ld	a, (hl)
   2701 DD 77 D9      [19]  621 	ld	-39 (ix), a
                            622 ;src/text/text.c:243: while (character != '\0') {
   2704 21 00 00      [10]  623 	ld	hl, #0x0000
   2707 39            [11]  624 	add	hl, sp
   2708 DD 75 FB      [19]  625 	ld	-5 (ix), l
   270B DD 74 FC      [19]  626 	ld	-4 (ix), h
   270E DD 7E FB      [19]  627 	ld	a, -5 (ix)
   2711 DD 77 DE      [19]  628 	ld	-34 (ix), a
   2714 DD 7E FC      [19]  629 	ld	a, -4 (ix)
   2717 DD 77 DF      [19]  630 	ld	-33 (ix), a
   271A DD 7E FB      [19]  631 	ld	a, -5 (ix)
   271D DD 77 E3      [19]  632 	ld	-29 (ix), a
   2720 DD 7E FC      [19]  633 	ld	a, -4 (ix)
   2723 DD 77 E4      [19]  634 	ld	-28 (ix), a
   2726 DD 7E FB      [19]  635 	ld	a, -5 (ix)
   2729 DD 77 E5      [19]  636 	ld	-27 (ix), a
   272C DD 7E FC      [19]  637 	ld	a, -4 (ix)
   272F DD 77 E6      [19]  638 	ld	-26 (ix), a
   2732 DD 7E FB      [19]  639 	ld	a, -5 (ix)
   2735 DD 77 FD      [19]  640 	ld	-3 (ix), a
   2738 DD 7E FC      [19]  641 	ld	a, -4 (ix)
   273B DD 77 FE      [19]  642 	ld	-2 (ix), a
   273E DD 7E FB      [19]  643 	ld	a, -5 (ix)
   2741 DD 77 F1      [19]  644 	ld	-15 (ix), a
   2744 DD 7E FC      [19]  645 	ld	a, -4 (ix)
   2747 DD 77 F2      [19]  646 	ld	-14 (ix), a
   274A DD 7E FB      [19]  647 	ld	a, -5 (ix)
   274D DD 77 EC      [19]  648 	ld	-20 (ix), a
   2750 DD 7E FC      [19]  649 	ld	a, -4 (ix)
   2753 DD 77 ED      [19]  650 	ld	-19 (ix), a
   2756 DD 7E FB      [19]  651 	ld	a, -5 (ix)
   2759 DD 77 EE      [19]  652 	ld	-18 (ix), a
   275C DD 7E FC      [19]  653 	ld	a, -4 (ix)
   275F DD 77 EF      [19]  654 	ld	-17 (ix), a
   2762 DD 7E FB      [19]  655 	ld	a, -5 (ix)
   2765 DD 77 F4      [19]  656 	ld	-12 (ix), a
   2768 DD 7E FC      [19]  657 	ld	a, -4 (ix)
   276B DD 77 F5      [19]  658 	ld	-11 (ix), a
   276E DD 7E FB      [19]  659 	ld	a, -5 (ix)
   2771 DD 77 DA      [19]  660 	ld	-38 (ix), a
   2774 DD 7E FC      [19]  661 	ld	a, -4 (ix)
   2777 DD 77 DB      [19]  662 	ld	-37 (ix), a
   277A DD 7E 09      [19]  663 	ld	a, 9 (ix)
   277D 3D            [ 4]  664 	dec	a
   277E 20 04         [12]  665 	jr	NZ,00261$
   2780 3E 01         [ 7]  666 	ld	a,#0x01
   2782 18 01         [12]  667 	jr	00262$
   2784                     668 00261$:
   2784 AF            [ 4]  669 	xor	a,a
   2785                     670 00262$:
   2785 DD 77 EB      [19]  671 	ld	-21 (ix), a
   2788 DD 7E 09      [19]  672 	ld	a, 9 (ix)
   278B 4F            [ 4]  673 	ld	c, a
   278C 87            [ 4]  674 	add	a, a
   278D 87            [ 4]  675 	add	a, a
   278E 87            [ 4]  676 	add	a, a
   278F 81            [ 4]  677 	add	a, c
   2790 DD 77 FA      [19]  678 	ld	-6 (ix), a
   2793 DD 7E FB      [19]  679 	ld	a, -5 (ix)
   2796 DD 77 E1      [19]  680 	ld	-31 (ix), a
   2799 DD 7E FC      [19]  681 	ld	a, -4 (ix)
   279C DD 77 E2      [19]  682 	ld	-30 (ix), a
   279F DD 7E FA      [19]  683 	ld	a, -6 (ix)
   27A2 DD 77 FF      [19]  684 	ld	-1 (ix), a
   27A5 DD 7E FB      [19]  685 	ld	a, -5 (ix)
   27A8 DD 77 DC      [19]  686 	ld	-36 (ix), a
   27AB DD 7E FC      [19]  687 	ld	a, -4 (ix)
   27AE DD 77 DD      [19]  688 	ld	-35 (ix), a
   27B1 DD 36 D7 00   [19]  689 	ld	-41 (ix), #0x00
   27B5                     690 00148$:
   27B5 DD 7E D9      [19]  691 	ld	a, -39 (ix)
   27B8 B7            [ 4]  692 	or	a, a
   27B9 CA 7D 2A      [10]  693 	jp	Z, 00153$
                            694 ;src/text/text.c:246: if (character != 32) { //32 = SPACE
   27BC DD 7E D9      [19]  695 	ld	a, -39 (ix)
   27BF D6 20         [ 7]  696 	sub	a, #0x20
   27C1 CA 60 2A      [10]  697 	jp	Z,00147$
                            698 ;src/text/text.c:250: switch(character){
   27C4 DD 7E D9      [19]  699 	ld	a, -39 (ix)
   27C7 D6 21         [ 7]  700 	sub	a, #0x21
   27C9 28 4C         [12]  701 	jr	Z,00104$
   27CB DD 7E D9      [19]  702 	ld	a, -39 (ix)
   27CE D6 22         [ 7]  703 	sub	a, #0x22
   27D0 28 3F         [12]  704 	jr	Z,00103$
   27D2 DD 7E D9      [19]  705 	ld	a, -39 (ix)
   27D5 D6 26         [ 7]  706 	sub	a, #0x26
   27D7 28 56         [12]  707 	jr	Z,00108$
   27D9 DD 7E D9      [19]  708 	ld	a, -39 (ix)
   27DC D6 27         [ 7]  709 	sub	a, #0x27
   27DE 28 55         [12]  710 	jr	Z,00109$
   27E0 DD 7E D9      [19]  711 	ld	a, -39 (ix)
   27E3 D6 28         [ 7]  712 	sub	a, #0x28
   27E5 28 36         [12]  713 	jr	Z,00105$
   27E7 DD 7E D9      [19]  714 	ld	a, -39 (ix)
   27EA D6 29         [ 7]  715 	sub	a, #0x29
   27EC 28 35         [12]  716 	jr	Z,00106$
   27EE DD 7E D9      [19]  717 	ld	a, -39 (ix)
   27F1 D6 2C         [ 7]  718 	sub	a, #0x2c
   27F3 28 16         [12]  719 	jr	Z,00102$
   27F5 DD 7E D9      [19]  720 	ld	a, -39 (ix)
   27F8 D6 2E         [ 7]  721 	sub	a, #0x2e
   27FA 28 09         [12]  722 	jr	Z,00101$
   27FC DD 7E D9      [19]  723 	ld	a, -39 (ix)
   27FF D6 2F         [ 7]  724 	sub	a, #0x2f
   2801 28 26         [12]  725 	jr	Z,00107$
   2803 18 34         [12]  726 	jr	00110$
                            727 ;src/text/text.c:252: case 46:
   2805                     728 00101$:
                            729 ;src/text/text.c:253: character=60;
   2805 DD 36 D9 3C   [19]  730 	ld	-39 (ix), #0x3c
                            731 ;src/text/text.c:254: break;
   2809 18 2E         [12]  732 	jr	00110$
                            733 ;src/text/text.c:257: case 44:
   280B                     734 00102$:
                            735 ;src/text/text.c:258: character=61;
   280B DD 36 D9 3D   [19]  736 	ld	-39 (ix), #0x3d
                            737 ;src/text/text.c:259: break;
   280F 18 28         [12]  738 	jr	00110$
                            739 ;src/text/text.c:262: case 34:
   2811                     740 00103$:
                            741 ;src/text/text.c:263: character=62;
   2811 DD 36 D9 3E   [19]  742 	ld	-39 (ix), #0x3e
                            743 ;src/text/text.c:264: break;
   2815 18 22         [12]  744 	jr	00110$
                            745 ;src/text/text.c:267: case 33:
   2817                     746 00104$:
                            747 ;src/text/text.c:268: character=64;
   2817 DD 36 D9 40   [19]  748 	ld	-39 (ix), #0x40
                            749 ;src/text/text.c:269: break;
   281B 18 1C         [12]  750 	jr	00110$
                            751 ;src/text/text.c:272: case 40:
   281D                     752 00105$:
                            753 ;src/text/text.c:273: character=91;
   281D DD 36 D9 5B   [19]  754 	ld	-39 (ix), #0x5b
                            755 ;src/text/text.c:274: break;
   2821 18 16         [12]  756 	jr	00110$
                            757 ;src/text/text.c:277: case 41:
   2823                     758 00106$:
                            759 ;src/text/text.c:278: character=93;
   2823 DD 36 D9 5D   [19]  760 	ld	-39 (ix), #0x5d
                            761 ;src/text/text.c:279: break;
   2827 18 10         [12]  762 	jr	00110$
                            763 ;src/text/text.c:282: case 47:
   2829                     764 00107$:
                            765 ;src/text/text.c:283: character=92;
   2829 DD 36 D9 5C   [19]  766 	ld	-39 (ix), #0x5c
                            767 ;src/text/text.c:284: break;
   282D 18 0A         [12]  768 	jr	00110$
                            769 ;src/text/text.c:286: case 38:
   282F                     770 00108$:
                            771 ;src/text/text.c:287: character=94;
   282F DD 36 D9 5E   [19]  772 	ld	-39 (ix), #0x5e
                            773 ;src/text/text.c:288: break;
   2833 18 04         [12]  774 	jr	00110$
                            775 ;src/text/text.c:290: case 39:
   2835                     776 00109$:
                            777 ;src/text/text.c:291: character=96;
   2835 DD 36 D9 60   [19]  778 	ld	-39 (ix), #0x60
                            779 ;src/text/text.c:293: }
   2839                     780 00110$:
                            781 ;src/text/text.c:296: character-=48;
   2839 DD 7E D9      [19]  782 	ld	a, -39 (ix)
   283C C6 D0         [ 7]  783 	add	a, #0xd0
                            784 ;src/text/text.c:299: for(i=0;i<18;i++){
   283E DD 77 D8      [19]  785 	ld	-40 (ix), a
   2841 4F            [ 4]  786 	ld	c, a
   2842 06 00         [ 7]  787 	ld	b,#0x00
   2844 69            [ 4]  788 	ld	l, c
   2845 60            [ 4]  789 	ld	h, b
   2846 29            [11]  790 	add	hl, hl
   2847 29            [11]  791 	add	hl, hl
   2848 29            [11]  792 	add	hl, hl
   2849 09            [11]  793 	add	hl, bc
   284A 29            [11]  794 	add	hl, hl
   284B 01 60 14      [10]  795 	ld	bc,#_g_font_chars
   284E 09            [11]  796 	add	hl,bc
   284F 4D            [ 4]  797 	ld	c, l
   2850 44            [ 4]  798 	ld	b, h
   2851 1E 00         [ 7]  799 	ld	e, #0x00
   2853                     800 00151$:
                            801 ;src/text/text.c:300: pChar = g_font_chars + (character*18) + i;
   2853 6B            [ 4]  802 	ld	l,e
   2854 26 00         [ 7]  803 	ld	h,#0x00
   2856 09            [11]  804 	add	hl, bc
                            805 ;src/text/text.c:304: if(*pChar == 0x7f) colorchar[i]=color1;
   2857 DD 75 D2      [19]  806 	ld	-46 (ix), l
   285A DD 74 D3      [19]  807 	ld	-45 (ix), h
   285D 7E            [ 7]  808 	ld	a, (hl)
   285E DD 77 F3      [19]  809 	ld	-13 (ix), a
   2861 D6 7F         [ 7]  810 	sub	a, #0x7f
   2863 20 04         [12]  811 	jr	NZ,00273$
   2865 3E 01         [ 7]  812 	ld	a,#0x01
   2867 18 01         [12]  813 	jr	00274$
   2869                     814 00273$:
   2869 AF            [ 4]  815 	xor	a,a
   286A                     816 00274$:
   286A DD 77 F0      [19]  817 	ld	-16 (ix), a
                            818 ;src/text/text.c:305: else if(*pChar == 0xff) colorchar[i]=color2;
   286D DD 7E F3      [19]  819 	ld	a, -13 (ix)
   2870 3C            [ 4]  820 	inc	a
   2871 20 04         [12]  821 	jr	NZ,00275$
   2873 3E 01         [ 7]  822 	ld	a,#0x01
   2875 18 01         [12]  823 	jr	00276$
   2877                     824 00275$:
   2877 AF            [ 4]  825 	xor	a,a
   2878                     826 00276$:
   2878 DD 77 E0      [19]  827 	ld	-32 (ix), a
                            828 ;src/text/text.c:306: else if(*pChar == 0xaa) colorchar[i]=color3;
   287B DD 7E F3      [19]  829 	ld	a, -13 (ix)
   287E D6 AA         [ 7]  830 	sub	a, #0xaa
   2880 20 04         [12]  831 	jr	NZ,00277$
   2882 3E 01         [ 7]  832 	ld	a,#0x01
   2884 18 01         [12]  833 	jr	00278$
   2886                     834 00277$:
   2886 AF            [ 4]  835 	xor	a,a
   2887                     836 00278$:
   2887 DD 77 EA      [19]  837 	ld	-22 (ix), a
                            838 ;src/text/text.c:307: else if(*pChar == 0x55) colorchar[i]=color4;
   288A DD 7E F3      [19]  839 	ld	a, -13 (ix)
   288D D6 55         [ 7]  840 	sub	a, #0x55
   288F 20 04         [12]  841 	jr	NZ,00279$
   2891 3E 01         [ 7]  842 	ld	a,#0x01
   2893 18 01         [12]  843 	jr	00280$
   2895                     844 00279$:
   2895 AF            [ 4]  845 	xor	a,a
   2896                     846 00280$:
   2896 DD 77 E9      [19]  847 	ld	-23 (ix), a
                            848 ;src/text/text.c:302: if(size==1) {
   2899 DD 7E EB      [19]  849 	ld	a, -21 (ix)
   289C B7            [ 4]  850 	or	a, a
   289D 28 68         [12]  851 	jr	Z,00136$
                            852 ;src/text/text.c:304: if(*pChar == 0x7f) colorchar[i]=color1;
   289F DD 7E F0      [19]  853 	ld	a, -16 (ix)
   28A2 B7            [ 4]  854 	or	a, a
   28A3 28 10         [12]  855 	jr	Z,00121$
   28A5 DD 6E DA      [19]  856 	ld	l,-38 (ix)
   28A8 DD 66 DB      [19]  857 	ld	h,-37 (ix)
   28AB 16 00         [ 7]  858 	ld	d, #0x00
   28AD 19            [11]  859 	add	hl, de
   28AE DD 7E D6      [19]  860 	ld	a, -42 (ix)
   28B1 77            [ 7]  861 	ld	(hl), a
   28B2 C3 E7 29      [10]  862 	jp	00152$
   28B5                     863 00121$:
                            864 ;src/text/text.c:305: else if(*pChar == 0xff) colorchar[i]=color2;
   28B5 DD 7E E0      [19]  865 	ld	a, -32 (ix)
   28B8 B7            [ 4]  866 	or	a, a
   28B9 28 10         [12]  867 	jr	Z,00118$
   28BB DD 6E F4      [19]  868 	ld	l,-12 (ix)
   28BE DD 66 F5      [19]  869 	ld	h,-11 (ix)
   28C1 16 00         [ 7]  870 	ld	d, #0x00
   28C3 19            [11]  871 	add	hl, de
   28C4 DD 7E D5      [19]  872 	ld	a, -43 (ix)
   28C7 77            [ 7]  873 	ld	(hl), a
   28C8 C3 E7 29      [10]  874 	jp	00152$
   28CB                     875 00118$:
                            876 ;src/text/text.c:306: else if(*pChar == 0xaa) colorchar[i]=color3;
   28CB DD 7E EA      [19]  877 	ld	a, -22 (ix)
   28CE B7            [ 4]  878 	or	a, a
   28CF 28 10         [12]  879 	jr	Z,00115$
   28D1 DD 6E EE      [19]  880 	ld	l,-18 (ix)
   28D4 DD 66 EF      [19]  881 	ld	h,-17 (ix)
   28D7 16 00         [ 7]  882 	ld	d, #0x00
   28D9 19            [11]  883 	add	hl, de
   28DA DD 7E D4      [19]  884 	ld	a, -44 (ix)
   28DD 77            [ 7]  885 	ld	(hl), a
   28DE C3 E7 29      [10]  886 	jp	00152$
   28E1                     887 00115$:
                            888 ;src/text/text.c:307: else if(*pChar == 0x55) colorchar[i]=color4;
   28E1 DD 7E E9      [19]  889 	ld	a, -23 (ix)
   28E4 B7            [ 4]  890 	or	a, a
   28E5 28 10         [12]  891 	jr	Z,00112$
   28E7 DD 6E EC      [19]  892 	ld	l,-20 (ix)
   28EA DD 66 ED      [19]  893 	ld	h,-19 (ix)
   28ED 16 00         [ 7]  894 	ld	d, #0x00
   28EF 19            [11]  895 	add	hl, de
   28F0 DD 7E D1      [19]  896 	ld	a, -47 (ix)
   28F3 77            [ 7]  897 	ld	(hl), a
   28F4 C3 E7 29      [10]  898 	jp	00152$
   28F7                     899 00112$:
                            900 ;src/text/text.c:308: else colorchar[i]=*pChar;
   28F7 DD 6E F1      [19]  901 	ld	l,-15 (ix)
   28FA DD 66 F2      [19]  902 	ld	h,-14 (ix)
   28FD 16 00         [ 7]  903 	ld	d, #0x00
   28FF 19            [11]  904 	add	hl, de
   2900 DD 7E F3      [19]  905 	ld	a, -13 (ix)
   2903 77            [ 7]  906 	ld	(hl), a
   2904 C3 E7 29      [10]  907 	jp	00152$
   2907                     908 00136$:
                            909 ;src/text/text.c:313: pos=(i*size)-(i%FONT2_W);
   2907 D5            [11]  910 	push	de
   2908 C5            [11]  911 	push	bc
   2909 DD 66 09      [19]  912 	ld	h, 9 (ix)
   290C 2E 00         [ 7]  913 	ld	l, #0x00
   290E 55            [ 4]  914 	ld	d, l
   290F 06 08         [ 7]  915 	ld	b, #0x08
   2911                     916 00281$:
   2911 29            [11]  917 	add	hl, hl
   2912 30 01         [12]  918 	jr	NC,00282$
   2914 19            [11]  919 	add	hl, de
   2915                     920 00282$:
   2915 10 FA         [13]  921 	djnz	00281$
   2917 C1            [10]  922 	pop	bc
   2918 D1            [10]  923 	pop	de
   2919 7B            [ 4]  924 	ld	a, e
   291A E6 01         [ 7]  925 	and	a, #0x01
   291C 57            [ 4]  926 	ld	d, a
   291D 7D            [ 4]  927 	ld	a, l
   291E 92            [ 4]  928 	sub	a, d
   291F 6F            [ 4]  929 	ld	l, a
                            930 ;src/text/text.c:317: colorchar[pos+FONT2_W]=color1;
   2920 55            [ 4]  931 	ld	d, l
   2921 14            [ 4]  932 	inc	d
   2922 14            [ 4]  933 	inc	d
                            934 ;src/text/text.c:315: if(*pChar == 0x7f) {
   2923 DD 7E F0      [19]  935 	ld	a, -16 (ix)
   2926 B7            [ 4]  936 	or	a, a
   2927 28 21         [12]  937 	jr	Z,00133$
                            938 ;src/text/text.c:316: colorchar[pos]=color1;
   2929 DD 7E FD      [19]  939 	ld	a, -3 (ix)
   292C 85            [ 4]  940 	add	a, l
   292D 6F            [ 4]  941 	ld	l, a
   292E DD 7E FE      [19]  942 	ld	a, -2 (ix)
   2931 CE 00         [ 7]  943 	adc	a, #0x00
   2933 67            [ 4]  944 	ld	h, a
   2934 DD 7E D6      [19]  945 	ld	a, -42 (ix)
   2937 77            [ 7]  946 	ld	(hl), a
                            947 ;src/text/text.c:317: colorchar[pos+FONT2_W]=color1;
   2938 DD 7E FD      [19]  948 	ld	a, -3 (ix)
   293B 82            [ 4]  949 	add	a, d
   293C 6F            [ 4]  950 	ld	l, a
   293D DD 7E FE      [19]  951 	ld	a, -2 (ix)
   2940 CE 00         [ 7]  952 	adc	a, #0x00
   2942 67            [ 4]  953 	ld	h, a
   2943 DD 7E D6      [19]  954 	ld	a, -42 (ix)
   2946 77            [ 7]  955 	ld	(hl), a
   2947 C3 E7 29      [10]  956 	jp	00152$
   294A                     957 00133$:
                            958 ;src/text/text.c:319: else if(*pChar == 0xff) {
   294A DD 7E E0      [19]  959 	ld	a, -32 (ix)
   294D B7            [ 4]  960 	or	a, a
   294E 28 20         [12]  961 	jr	Z,00130$
                            962 ;src/text/text.c:320: colorchar[pos]=color2;
   2950 DD 7E E5      [19]  963 	ld	a, -27 (ix)
   2953 85            [ 4]  964 	add	a, l
   2954 6F            [ 4]  965 	ld	l, a
   2955 DD 7E E6      [19]  966 	ld	a, -26 (ix)
   2958 CE 00         [ 7]  967 	adc	a, #0x00
   295A 67            [ 4]  968 	ld	h, a
   295B DD 7E D5      [19]  969 	ld	a, -43 (ix)
   295E 77            [ 7]  970 	ld	(hl), a
                            971 ;src/text/text.c:321: colorchar[pos+FONT2_W]=color2;
   295F DD 7E E5      [19]  972 	ld	a, -27 (ix)
   2962 82            [ 4]  973 	add	a, d
   2963 6F            [ 4]  974 	ld	l, a
   2964 DD 7E E6      [19]  975 	ld	a, -26 (ix)
   2967 CE 00         [ 7]  976 	adc	a, #0x00
   2969 67            [ 4]  977 	ld	h, a
   296A DD 7E D5      [19]  978 	ld	a, -43 (ix)
   296D 77            [ 7]  979 	ld	(hl), a
   296E 18 77         [12]  980 	jr	00152$
   2970                     981 00130$:
                            982 ;src/text/text.c:323: else if(*pChar == 0xaa) {
   2970 DD 7E EA      [19]  983 	ld	a, -22 (ix)
   2973 B7            [ 4]  984 	or	a, a
   2974 28 20         [12]  985 	jr	Z,00127$
                            986 ;src/text/text.c:324: colorchar[pos]=color3;
   2976 DD 7E E3      [19]  987 	ld	a, -29 (ix)
   2979 85            [ 4]  988 	add	a, l
   297A 6F            [ 4]  989 	ld	l, a
   297B DD 7E E4      [19]  990 	ld	a, -28 (ix)
   297E CE 00         [ 7]  991 	adc	a, #0x00
   2980 67            [ 4]  992 	ld	h, a
   2981 DD 7E D4      [19]  993 	ld	a, -44 (ix)
   2984 77            [ 7]  994 	ld	(hl), a
                            995 ;src/text/text.c:325: colorchar[pos+FONT2_W]=color3;
   2985 DD 7E E3      [19]  996 	ld	a, -29 (ix)
   2988 82            [ 4]  997 	add	a, d
   2989 6F            [ 4]  998 	ld	l, a
   298A DD 7E E4      [19]  999 	ld	a, -28 (ix)
   298D CE 00         [ 7] 1000 	adc	a, #0x00
   298F 67            [ 4] 1001 	ld	h, a
   2990 DD 7E D4      [19] 1002 	ld	a, -44 (ix)
   2993 77            [ 7] 1003 	ld	(hl), a
   2994 18 51         [12] 1004 	jr	00152$
   2996                    1005 00127$:
                           1006 ;src/text/text.c:327: else if(*pChar == 0x55) {
   2996 DD 7E E9      [19] 1007 	ld	a, -23 (ix)
   2999 B7            [ 4] 1008 	or	a, a
   299A 28 20         [12] 1009 	jr	Z,00124$
                           1010 ;src/text/text.c:328: colorchar[pos]=color4;
   299C DD 7E DE      [19] 1011 	ld	a, -34 (ix)
   299F 85            [ 4] 1012 	add	a, l
   29A0 6F            [ 4] 1013 	ld	l, a
   29A1 DD 7E DF      [19] 1014 	ld	a, -33 (ix)
   29A4 CE 00         [ 7] 1015 	adc	a, #0x00
   29A6 67            [ 4] 1016 	ld	h, a
   29A7 DD 7E D1      [19] 1017 	ld	a, -47 (ix)
   29AA 77            [ 7] 1018 	ld	(hl), a
                           1019 ;src/text/text.c:329: colorchar[pos+FONT2_W]=color4;
   29AB DD 7E DE      [19] 1020 	ld	a, -34 (ix)
   29AE 82            [ 4] 1021 	add	a, d
   29AF 6F            [ 4] 1022 	ld	l, a
   29B0 DD 7E DF      [19] 1023 	ld	a, -33 (ix)
   29B3 CE 00         [ 7] 1024 	adc	a, #0x00
   29B5 67            [ 4] 1025 	ld	h, a
   29B6 DD 7E D1      [19] 1026 	ld	a, -47 (ix)
   29B9 77            [ 7] 1027 	ld	(hl), a
   29BA 18 2B         [12] 1028 	jr	00152$
   29BC                    1029 00124$:
                           1030 ;src/text/text.c:332: colorchar[pos]=*pChar;
   29BC DD 7E FB      [19] 1031 	ld	a, -5 (ix)
   29BF 85            [ 4] 1032 	add	a, l
   29C0 6F            [ 4] 1033 	ld	l, a
   29C1 DD 7E FC      [19] 1034 	ld	a, -4 (ix)
   29C4 CE 00         [ 7] 1035 	adc	a, #0x00
   29C6 67            [ 4] 1036 	ld	h, a
   29C7 DD 7E F3      [19] 1037 	ld	a, -13 (ix)
   29CA 77            [ 7] 1038 	ld	(hl), a
                           1039 ;src/text/text.c:333: colorchar[pos+FONT2_W]=*pChar;
   29CB E5            [11] 1040 	push	hl
   29CC DD 6E FB      [19] 1041 	ld	l, -5 (ix)
   29CF DD 66 FC      [19] 1042 	ld	h, -4 (ix)
   29D2 E5            [11] 1043 	push	hl
   29D3 FD E1         [14] 1044 	pop	iy
   29D5 E1            [10] 1045 	pop	hl
   29D6 C5            [11] 1046 	push	bc
   29D7 4A            [ 4] 1047 	ld	c,d
   29D8 06 00         [ 7] 1048 	ld	b,#0x00
   29DA FD 09         [15] 1049 	add	iy, bc
   29DC C1            [10] 1050 	pop	bc
   29DD DD 6E D2      [19] 1051 	ld	l,-46 (ix)
   29E0 DD 66 D3      [19] 1052 	ld	h,-45 (ix)
   29E3 56            [ 7] 1053 	ld	d, (hl)
   29E4 FD 72 00      [19] 1054 	ld	0 (iy), d
   29E7                    1055 00152$:
                           1056 ;src/text/text.c:299: for(i=0;i<18;i++){
   29E7 1C            [ 4] 1057 	inc	e
   29E8 7B            [ 4] 1058 	ld	a, e
   29E9 D6 12         [ 7] 1059 	sub	a, #0x12
   29EB DA 53 28      [10] 1060 	jp	C, 00151$
                           1061 ;src/text/text.c:342: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   29EE DD 66 07      [19] 1062 	ld	h, 7 (ix)
   29F1 DD 6E 06      [19] 1063 	ld	l, 6 (ix)
   29F4 E5            [11] 1064 	push	hl
   29F5 21 00 C0      [10] 1065 	ld	hl, #0xc000
   29F8 E5            [11] 1066 	push	hl
   29F9 CD 02 2F      [17] 1067 	call	_cpct_getScreenPtr
                           1068 ;src/text/text.c:343: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
   29FC DD 75 F8      [19] 1069 	ld	-8 (ix), l
   29FF DD 74 F9      [19] 1070 	ld	-7 (ix), h
   2A02 DD 7E 0A      [19] 1071 	ld	a, 10 (ix)
   2A05 B7            [ 4] 1072 	or	a, a
   2A06 28 1D         [12] 1073 	jr	Z,00140$
   2A08 11 00 01      [10] 1074 	ld	de, #_g_tablatrans
   2A0B DD 4E DC      [19] 1075 	ld	c,-36 (ix)
   2A0E DD 46 DD      [19] 1076 	ld	b,-35 (ix)
   2A11 D5            [11] 1077 	push	de
   2A12 DD 56 FF      [19] 1078 	ld	d, -1 (ix)
   2A15 1E 02         [ 7] 1079 	ld	e,#0x02
   2A17 D5            [11] 1080 	push	de
   2A18 DD 6E F8      [19] 1081 	ld	l,-8 (ix)
   2A1B DD 66 F9      [19] 1082 	ld	h,-7 (ix)
   2A1E E5            [11] 1083 	push	hl
   2A1F C5            [11] 1084 	push	bc
   2A20 CD 96 2E      [17] 1085 	call	_cpct_drawSpriteMaskedAlignedTable
   2A23 18 23         [12] 1086 	jr	00141$
   2A25                    1087 00140$:
                           1088 ;src/text/text.c:344: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
   2A25 DD 7E E1      [19] 1089 	ld	a, -31 (ix)
   2A28 DD 77 F6      [19] 1090 	ld	-10 (ix), a
   2A2B DD 7E E2      [19] 1091 	ld	a, -30 (ix)
   2A2E DD 77 F7      [19] 1092 	ld	-9 (ix), a
   2A31 DD 56 FA      [19] 1093 	ld	d, -6 (ix)
   2A34 1E 02         [ 7] 1094 	ld	e,#0x02
   2A36 D5            [11] 1095 	push	de
   2A37 DD 6E F8      [19] 1096 	ld	l,-8 (ix)
   2A3A DD 66 F9      [19] 1097 	ld	h,-7 (ix)
   2A3D E5            [11] 1098 	push	hl
   2A3E DD 6E F6      [19] 1099 	ld	l,-10 (ix)
   2A41 DD 66 F7      [19] 1100 	ld	h,-9 (ix)
   2A44 E5            [11] 1101 	push	hl
   2A45 CD EC 2B      [17] 1102 	call	_cpct_drawSprite
   2A48                    1103 00141$:
                           1104 ;src/text/text.c:347: if(character == 48 || character == 60 || character == 57) xPos--;
   2A48 DD 7E D8      [19] 1105 	ld	a, -40 (ix)
   2A4B D6 30         [ 7] 1106 	sub	a, #0x30
   2A4D 28 0E         [12] 1107 	jr	Z,00142$
   2A4F DD 7E D8      [19] 1108 	ld	a, -40 (ix)
   2A52 D6 3C         [ 7] 1109 	sub	a, #0x3c
   2A54 28 07         [12] 1110 	jr	Z,00142$
   2A56 DD 7E D8      [19] 1111 	ld	a, -40 (ix)
   2A59 D6 39         [ 7] 1112 	sub	a, #0x39
   2A5B 20 03         [12] 1113 	jr	NZ,00147$
   2A5D                    1114 00142$:
   2A5D DD 35 06      [23] 1115 	dec	6 (ix)
   2A60                    1116 00147$:
                           1117 ;src/text/text.c:350: character = text[++x];
   2A60 DD 34 D7      [23] 1118 	inc	-41 (ix)
   2A63 DD 7E E7      [19] 1119 	ld	a, -25 (ix)
   2A66 DD 86 D7      [19] 1120 	add	a, -41 (ix)
   2A69 6F            [ 4] 1121 	ld	l, a
   2A6A DD 7E E8      [19] 1122 	ld	a, -24 (ix)
   2A6D CE 00         [ 7] 1123 	adc	a, #0x00
   2A6F 67            [ 4] 1124 	ld	h, a
   2A70 7E            [ 7] 1125 	ld	a, (hl)
   2A71 DD 77 D9      [19] 1126 	ld	-39 (ix), a
                           1127 ;src/text/text.c:351: xPos+=FONT2_W;
   2A74 DD 34 06      [23] 1128 	inc	6 (ix)
   2A77 DD 34 06      [23] 1129 	inc	6 (ix)
   2A7A C3 B5 27      [10] 1130 	jp	00148$
   2A7D                    1131 00153$:
   2A7D DD F9         [10] 1132 	ld	sp, ix
   2A7F DD E1         [14] 1133 	pop	ix
   2A81 C9            [10] 1134 	ret
                           1135 	.area _CODE
                           1136 	.area _INITIALIZER
                           1137 	.area _CABS (ABS)
