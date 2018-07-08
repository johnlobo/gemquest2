                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module keyboard
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_isAnyKeyPressed_f
                             12 	.globl _cpct_isAnyKeyPressed
                             13 	.globl _cpct_isKeyPressed
                             14 	.globl _cpct_scanKeyboard_f
                             15 	.globl _cpct_scanKeyboard
                             16 	.globl _cpct_memcpy
                             17 	.globl _tempKeys
                             18 	.globl _initKeys
                             19 	.globl _wait4OneKey
                             20 	.globl _wait4UserKeypress
                             21 	.globl _waitForAKey
                             22 	.globl _checkKeys
                             23 	.globl _waitKeyUp
                             24 	.globl _wait4Key
                             25 ;--------------------------------------------------------
                             26 ; special function registers
                             27 ;--------------------------------------------------------
                             28 ;--------------------------------------------------------
                             29 ; ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DATA
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
                             56 ;src/keyboard/keyboard.c:33: void initKeys(){
                             57 ;	---------------------------------
                             58 ; Function initKeys
                             59 ; ---------------------------------
   1C9B                      60 _initKeys::
                             61 ;src/keyboard/keyboard.c:34: cpct_memcpy(&keys, &tempKeys, sizeof(TKeys));
   1C9B 21 12 00      [10]   62 	ld	hl, #0x0012
   1C9E E5            [11]   63 	push	hl
   1C9F 21 AB 1C      [10]   64 	ld	hl, #_tempKeys
   1CA2 E5            [11]   65 	push	hl
   1CA3 21 E7 2F      [10]   66 	ld	hl, #_keys
   1CA6 E5            [11]   67 	push	hl
   1CA7 CD 9B 2D      [17]   68 	call	_cpct_memcpy
   1CAA C9            [10]   69 	ret
   1CAB                      70 _tempKeys:
   1CAB 00 01                71 	.dw #0x0100
   1CAD 00 04                72 	.dw #0x0400
   1CAF 01 01                73 	.dw #0x0101
   1CB1 00 02                74 	.dw #0x0200
   1CB3 05 80                75 	.dw #0x8005
   1CB5 02 04                76 	.dw #0x0402
   1CB7 05 10                77 	.dw #0x1005
   1CB9 08 04                78 	.dw #0x0408
   1CBB 04 40                79 	.dw #0x4004
                             80 ;src/keyboard/keyboard.c:45: void wait4OneKey() {
                             81 ;	---------------------------------
                             82 ; Function wait4OneKey
                             83 ; ---------------------------------
   1CBD                      84 _wait4OneKey::
                             85 ;src/keyboard/keyboard.c:50: keypressed = waitForAKey();
   1CBD CD E4 1C      [17]   86 	call	_waitForAKey
                             87 ;src/keyboard/keyboard.c:51: waitKeyUp(keypressed);
   1CC0 E5            [11]   88 	push	hl
   1CC1 CD 6A 1D      [17]   89 	call	_waitKeyUp
   1CC4 F1            [10]   90 	pop	af
                             91 ;src/keyboard/keyboard.c:53: return;
   1CC5 C9            [10]   92 	ret
                             93 ;src/keyboard/keyboard.c:65: u32 wait4UserKeypress() {
                             94 ;	---------------------------------
                             95 ; Function wait4UserKeypress
                             96 ; ---------------------------------
   1CC6                      97 _wait4UserKeypress::
                             98 ;src/keyboard/keyboard.c:69: do {
   1CC6 21 00 00      [10]   99 	ld	hl,#0x0000
   1CC9 5D            [ 4]  100 	ld	e,l
   1CCA 54            [ 4]  101 	ld	d,h
   1CCB                     102 00101$:
                            103 ;src/keyboard/keyboard.c:70: c++;                       // One more cycle
   1CCB 2C            [ 4]  104 	inc	l
   1CCC 20 07         [12]  105 	jr	NZ,00115$
   1CCE 24            [ 4]  106 	inc	h
   1CCF 20 04         [12]  107 	jr	NZ,00115$
   1CD1 1C            [ 4]  108 	inc	e
   1CD2 20 01         [12]  109 	jr	NZ,00115$
   1CD4 14            [ 4]  110 	inc	d
   1CD5                     111 00115$:
                            112 ;src/keyboard/keyboard.c:71: cpct_scanKeyboard_f();     // Scan the scan the keyboard
   1CD5 E5            [11]  113 	push	hl
   1CD6 D5            [11]  114 	push	de
   1CD7 CD 5F 2B      [17]  115 	call	_cpct_scanKeyboard_f
   1CDA CD 72 2D      [17]  116 	call	_cpct_isAnyKeyPressed_f
   1CDD 7D            [ 4]  117 	ld	a, l
   1CDE D1            [10]  118 	pop	de
   1CDF E1            [10]  119 	pop	hl
   1CE0 B7            [ 4]  120 	or	a, a
   1CE1 28 E8         [12]  121 	jr	Z,00101$
                            122 ;src/keyboard/keyboard.c:74: return c;
   1CE3 C9            [10]  123 	ret
                            124 ;src/keyboard/keyboard.c:86: cpct_keyID waitForAKey() {
                            125 ;	---------------------------------
                            126 ; Function waitForAKey
                            127 ; ---------------------------------
   1CE4                     128 _waitForAKey::
   1CE4 DD E5         [15]  129 	push	ix
   1CE6 DD 21 00 00   [14]  130 	ld	ix,#0
   1CEA DD 39         [15]  131 	add	ix,sp
   1CEC F5            [11]  132 	push	af
                            133 ;src/keyboard/keyboard.c:89: u8 i = 10, *keys = cpct_keyboardStatusBuffer + 9;
   1CED 16 0A         [ 7]  134 	ld	d, #0x0a
                            135 ;src/keyboard/keyboard.c:93: do { cpct_scanKeyboard(); } while ( ! cpct_isAnyKeyPressed() );
   1CEF                     136 00101$:
   1CEF D5            [11]  137 	push	de
   1CF0 CD D1 2E      [17]  138 	call	_cpct_scanKeyboard
   1CF3 CD F5 2C      [17]  139 	call	_cpct_isAnyKeyPressed
   1CF6 D1            [10]  140 	pop	de
   1CF7 7D            [ 4]  141 	ld	a, l
   1CF8 B7            [ 4]  142 	or	a, a
   1CF9 28 F4         [12]  143 	jr	Z,00101$
                            144 ;src/keyboard/keyboard.c:96: do {
   1CFB 01 9A 2C      [10]  145 	ld	bc, #(_cpct_keyboardStatusBuffer + 0x0009)
   1CFE 1E 0A         [ 7]  146 	ld	e, #0x0a
   1D00                     147 00106$:
                            148 ;src/keyboard/keyboard.c:99: keypressed = *keys ^ 0xFF;
   1D00 0A            [ 7]  149 	ld	a, (bc)
   1D01 EE FF         [ 7]  150 	xor	a, #0xff
   1D03 DD 77 FE      [19]  151 	ld	-2 (ix), a
   1D06 DD 36 FF 00   [19]  152 	ld	-1 (ix), #0x00
                            153 ;src/keyboard/keyboard.c:101: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
   1D0A DD 66 FE      [19]  154 	ld	h, -2 (ix)
   1D0D 2E 00         [ 7]  155 	ld	l, #0x00
                            156 ;src/keyboard/keyboard.c:100: if (keypressed)
   1D0F DD 7E FF      [19]  157 	ld	a, -1 (ix)
   1D12 DD B6 FE      [19]  158 	or	a,-2 (ix)
   1D15 28 07         [12]  159 	jr	Z,00105$
                            160 ;src/keyboard/keyboard.c:101: return (keypressed << 8) + (i - 1);  // Formato cpct_keyID: 8 primeros bits = máscara de tecla, 8 siguientes fila del teclado (0-9)
   1D17 4A            [ 4]  161 	ld	c, d
   1D18 06 00         [ 7]  162 	ld	b, #0x00
   1D1A 0B            [ 6]  163 	dec	bc
   1D1B 09            [11]  164 	add	hl, bc
   1D1C 18 0A         [12]  165 	jr	00109$
   1D1E                     166 00105$:
                            167 ;src/keyboard/keyboard.c:102: keys--;
   1D1E 0B            [ 6]  168 	dec	bc
                            169 ;src/keyboard/keyboard.c:103: } while (--i);
   1D1F 1D            [ 4]  170 	dec	e
   1D20 7B            [ 4]  171 	ld	a,e
   1D21 57            [ 4]  172 	ld	d,a
                            173 ;src/keyboard/keyboard.c:104: return (keypressed << 8) + (i - 1);
   1D22 B7            [ 4]  174 	or	a,a
   1D23 20 DB         [12]  175 	jr	NZ,00106$
   1D25 57            [ 4]  176 	ld	d,a
   1D26 1B            [ 6]  177 	dec	de
   1D27 19            [11]  178 	add	hl,de
   1D28                     179 00109$:
   1D28 DD F9         [10]  180 	ld	sp, ix
   1D2A DD E1         [14]  181 	pop	ix
   1D2C C9            [10]  182 	ret
                            183 ;src/keyboard/keyboard.c:118: u8 checkKeys(const cpct_keyID *k, u8 numk)
                            184 ;	---------------------------------
                            185 ; Function checkKeys
                            186 ; ---------------------------------
   1D2D                     187 _checkKeys::
   1D2D DD E5         [15]  188 	push	ix
   1D2F DD 21 00 00   [14]  189 	ld	ix,#0
   1D33 DD 39         [15]  190 	add	ix,sp
                            191 ;src/keyboard/keyboard.c:122: if (cpct_isAnyKeyPressed())
   1D35 CD F5 2C      [17]  192 	call	_cpct_isAnyKeyPressed
   1D38 7D            [ 4]  193 	ld	a, l
   1D39 B7            [ 4]  194 	or	a, a
   1D3A 28 29         [12]  195 	jr	Z,00105$
                            196 ;src/keyboard/keyboard.c:124: for (i = 1; i <= numk; i++, k++)
   1D3C 01 01 01      [10]  197 	ld	bc,#0x0101
   1D3F DD 5E 04      [19]  198 	ld	e,4 (ix)
   1D42 DD 56 05      [19]  199 	ld	d,5 (ix)
   1D45                     200 00107$:
   1D45 DD 7E 06      [19]  201 	ld	a, 6 (ix)
   1D48 90            [ 4]  202 	sub	a, b
   1D49 38 1A         [12]  203 	jr	C,00105$
                            204 ;src/keyboard/keyboard.c:126: if (cpct_isKeyPressed(*k))
   1D4B 6B            [ 4]  205 	ld	l, e
   1D4C 62            [ 4]  206 	ld	h, d
   1D4D 7E            [ 7]  207 	ld	a, (hl)
   1D4E 23            [ 6]  208 	inc	hl
   1D4F 66            [ 7]  209 	ld	h, (hl)
   1D50 6F            [ 4]  210 	ld	l, a
   1D51 C5            [11]  211 	push	bc
   1D52 D5            [11]  212 	push	de
   1D53 CD 53 2B      [17]  213 	call	_cpct_isKeyPressed
   1D56 D1            [10]  214 	pop	de
   1D57 C1            [10]  215 	pop	bc
   1D58 7D            [ 4]  216 	ld	a, l
   1D59 B7            [ 4]  217 	or	a, a
   1D5A 28 03         [12]  218 	jr	Z,00108$
                            219 ;src/keyboard/keyboard.c:127: return i;
   1D5C 69            [ 4]  220 	ld	l, c
   1D5D 18 08         [12]  221 	jr	00109$
   1D5F                     222 00108$:
                            223 ;src/keyboard/keyboard.c:124: for (i = 1; i <= numk; i++, k++)
   1D5F 04            [ 4]  224 	inc	b
   1D60 48            [ 4]  225 	ld	c, b
   1D61 13            [ 6]  226 	inc	de
   1D62 13            [ 6]  227 	inc	de
   1D63 18 E0         [12]  228 	jr	00107$
   1D65                     229 00105$:
                            230 ;src/keyboard/keyboard.c:130: return 0;
   1D65 2E 00         [ 7]  231 	ld	l, #0x00
   1D67                     232 00109$:
   1D67 DD E1         [14]  233 	pop	ix
   1D69 C9            [10]  234 	ret
                            235 ;src/keyboard/keyboard.c:140: void waitKeyUp(cpct_keyID key){
                            236 ;	---------------------------------
                            237 ; Function waitKeyUp
                            238 ; ---------------------------------
   1D6A                     239 _waitKeyUp::
                            240 ;src/keyboard/keyboard.c:142: while (cpct_isKeyPressed(key)) {
   1D6A                     241 00101$:
   1D6A C1            [10]  242 	pop	bc
   1D6B E1            [10]  243 	pop	hl
   1D6C E5            [11]  244 	push	hl
   1D6D C5            [11]  245 	push	bc
   1D6E CD 53 2B      [17]  246 	call	_cpct_isKeyPressed
   1D71 7D            [ 4]  247 	ld	a, l
   1D72 B7            [ 4]  248 	or	a, a
   1D73 C8            [11]  249 	ret	Z
                            250 ;src/keyboard/keyboard.c:143: cpct_scanKeyboard_f();
   1D74 CD 5F 2B      [17]  251 	call	_cpct_scanKeyboard_f
   1D77 18 F1         [12]  252 	jr	00101$
                            253 ;src/keyboard/keyboard.c:154: u32 wait4Key(cpct_keyID key) {
                            254 ;	---------------------------------
                            255 ; Function wait4Key
                            256 ; ---------------------------------
   1D79                     257 _wait4Key::
                            258 ;src/keyboard/keyboard.c:158: while(!cpct_isKeyPressed(key));
   1D79                     259 00101$:
   1D79 C1            [10]  260 	pop	bc
   1D7A E1            [10]  261 	pop	hl
   1D7B E5            [11]  262 	push	hl
   1D7C C5            [11]  263 	push	bc
   1D7D CD 53 2B      [17]  264 	call	_cpct_isKeyPressed
   1D80 7D            [ 4]  265 	ld	a, l
   1D81 B7            [ 4]  266 	or	a, a
   1D82 28 F5         [12]  267 	jr	Z,00101$
                            268 ;src/keyboard/keyboard.c:159: do{
   1D84 21 00 00      [10]  269 	ld	hl,#0x0000
   1D87 5D            [ 4]  270 	ld	e,l
   1D88 54            [ 4]  271 	ld	d,h
   1D89                     272 00104$:
                            273 ;src/keyboard/keyboard.c:160: c++;
   1D89 2C            [ 4]  274 	inc	l
   1D8A 20 07         [12]  275 	jr	NZ,00125$
   1D8C 24            [ 4]  276 	inc	h
   1D8D 20 04         [12]  277 	jr	NZ,00125$
   1D8F 1C            [ 4]  278 	inc	e
   1D90 20 01         [12]  279 	jr	NZ,00125$
   1D92 14            [ 4]  280 	inc	d
   1D93                     281 00125$:
                            282 ;src/keyboard/keyboard.c:162: while(cpct_isKeyPressed(key));
   1D93 E5            [11]  283 	push	hl
   1D94 D5            [11]  284 	push	de
   1D95 21 06 00      [10]  285 	ld	hl, #6
   1D98 39            [11]  286 	add	hl, sp
   1D99 7E            [ 7]  287 	ld	a, (hl)
   1D9A 23            [ 6]  288 	inc	hl
   1D9B 66            [ 7]  289 	ld	h, (hl)
   1D9C 6F            [ 4]  290 	ld	l, a
   1D9D CD 53 2B      [17]  291 	call	_cpct_isKeyPressed
   1DA0 7D            [ 4]  292 	ld	a, l
   1DA1 D1            [10]  293 	pop	de
   1DA2 E1            [10]  294 	pop	hl
   1DA3 B7            [ 4]  295 	or	a, a
   1DA4 20 E3         [12]  296 	jr	NZ,00104$
                            297 ;src/keyboard/keyboard.c:164: return c;
   1DA6 C9            [10]  298 	ret
                            299 	.area _CODE
                            300 	.area _INITIALIZER
                            301 	.area _CABS (ABS)
