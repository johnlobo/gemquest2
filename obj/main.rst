                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _initMain
                             13 	.globl _myInterruptHandler
                             14 	.globl _drawWindow
                             15 	.globl _drawWindow2
                             16 	.globl _reset_cpc
                             17 	.globl _drawText2
                             18 	.globl _initKeys
                             19 	.globl _wait4UserKeypress
                             20 	.globl _wait4OneKey
                             21 	.globl _playGame
                             22 	.globl _initGame
                             23 	.globl _cpct_restoreState_mxor_u8
                             24 	.globl _cpct_setSeed_mxor
                             25 	.globl _cpct_getScreenPtr
                             26 	.globl _cpct_setPALColour
                             27 	.globl _cpct_setPalette
                             28 	.globl _cpct_setVideoMode
                             29 	.globl _cpct_px2byteM0
                             30 	.globl _cpct_scanKeyboard_if
                             31 	.globl _cpct_setStackLocation
                             32 	.globl _cpct_memset
                             33 	.globl _cpct_setInterruptHandler
                             34 	.globl _cpct_disableFirmware
                             35 	.globl _sp_palette0
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   3001                      43 _myInterruptHandler_i_1_117:
   3001                      44 	.ds 1
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/main.c:50: cpctm_createTransparentMaskTable(g_tablatrans, 0x100, M0, 0);
                             70 ;	---------------------------------
                             71 ; Function dummy_cpct_transparentMaskTable0M0_container
                             72 ; ---------------------------------
   1C9B                      73 _dummy_cpct_transparentMaskTable0M0_container::
                             74 	.area _g_tablatrans_ (ABS) 
   0100                      75 	.org 0x100 
   0100                      76 	 _g_tablatrans::
   0100 FF AA 55 00 AA AA    77 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0108 55 00 55 00 00 00    78 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0110 AA AA 00 00 AA AA    79 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0118 00 00 00 00 00 00    80 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0120 55 00 55 00 00 00    81 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0128 55 00 55 00 00 00    82 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0130 00 00 00 00 00 00    83 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0138 00 00 00 00 00 00    84 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0140 AA AA 00 00 AA AA    85 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0148 00 00 00 00 00 00    86 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0150 AA AA 00 00 AA AA    87 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0158 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0160 00 00 00 00 00 00    89 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0168 00 00 00 00 00 00    90 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0170 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0178 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0180 55 00 55 00 00 00    93 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0188 55 00 55 00 00 00    94 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0190 00 00 00 00 00 00    95 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0198 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A0 55 00 55 00 00 00    97 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01A8 55 00 55 00 00 00    98 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B0 00 00 00 00 00 00    99 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01B8 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C0 00 00 00 00 00 00   101 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01C8 00 00 00 00 00 00   102 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D0 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01D8 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E0 00 00 00 00 00 00   105 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01E8 00 00 00 00 00 00   106 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F0 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   01F8 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            109 	.area _CSEG (REL, CON) 
                            110 ;src/main.c:61: void myInterruptHandler()
                            111 ;	---------------------------------
                            112 ; Function myInterruptHandler
                            113 ; ---------------------------------
   3003                     114 _myInterruptHandler::
                            115 ;src/main.c:65: i++;
   3003 FD 21 01 30   [14]  116 	ld	iy, #_myInterruptHandler_i_1_117
   3007 FD 34 00      [23]  117 	inc	0 (iy)
                            118 ;src/main.c:66: switch (i) {
   300A FD 7E 00      [19]  119 	ld	a, 0 (iy)
   300D D6 04         [ 7]  120 	sub	a, #0x04
   300F CA 02 2D      [10]  121 	jp	Z,_cpct_scanKeyboard_if
   3012 FD 7E 00      [19]  122 	ld	a, 0 (iy)
   3015 D6 05         [ 7]  123 	sub	a, #0x05
   3017 28 0B         [12]  124 	jr	Z,00103$
   3019 FD 7E 00      [19]  125 	ld	a, 0 (iy)
   301C D6 06         [ 7]  126 	sub	a, #0x06
   301E 28 04         [12]  127 	jr	Z,00103$
   3020 C9            [10]  128 	ret
                            129 ;src/main.c:67: case 4:
                            130 ;src/main.c:68: cpct_scanKeyboard_if();
                            131 ;src/main.c:69: break;
   3021 C3 02 2D      [10]  132 	jp  _cpct_scanKeyboard_if
                            133 ;src/main.c:72: case 6:
   3024                     134 00103$:
                            135 ;src/main.c:73: i = 0;
   3024 21 01 30      [10]  136 	ld	hl,#_myInterruptHandler_i_1_117 + 0
   3027 36 00         [10]  137 	ld	(hl), #0x00
                            138 ;src/main.c:74: }
   3029 C9            [10]  139 	ret
   302A                     140 _sp_palette0:
   302A 54                  141 	.db #0x54	; 84	'T'
   302B 4D                  142 	.db #0x4d	; 77	'M'
   302C 40                  143 	.db #0x40	; 64
   302D 5C                  144 	.db #0x5c	; 92
   302E 4C                  145 	.db #0x4c	; 76	'L'
   302F 4E                  146 	.db #0x4e	; 78	'N'
   3030 4A                  147 	.db #0x4a	; 74	'J'
   3031 52                  148 	.db #0x52	; 82	'R'
   3032 56                  149 	.db #0x56	; 86	'V'
   3033 5E                  150 	.db #0x5e	; 94
   3034 53                  151 	.db #0x53	; 83	'S'
   3035 5F                  152 	.db #0x5f	; 95
   3036 55                  153 	.db #0x55	; 85	'U'
   3037 58                  154 	.db #0x58	; 88	'X'
   3038 44                  155 	.db #0x44	; 68	'D'
   3039 4B                  156 	.db #0x4b	; 75	'K'
                            157 ;src/main.c:78: void initMain()
                            158 ;	---------------------------------
                            159 ; Function initMain
                            160 ; ---------------------------------
   303A                     161 _initMain::
                            162 ;src/main.c:84: cpct_setVideoMode(0);
   303A 2E 00         [ 7]  163 	ld	l, #0x00
   303C CD 8D 2D      [17]  164 	call	_cpct_setVideoMode
                            165 ;src/main.c:85: cpct_setPalette(sp_palette0, 16);
   303F 21 10 00      [10]  166 	ld	hl, #0x0010
   3042 E5            [11]  167 	push	hl
   3043 21 2A 30      [10]  168 	ld	hl, #_sp_palette0
   3046 E5            [11]  169 	push	hl
   3047 CD C9 2B      [17]  170 	call	_cpct_setPalette
                            171 ;src/main.c:86: cpct_setBorder(HW_WHITE);
   304A 21 10 00      [10]  172 	ld	hl, #0x0010
   304D E5            [11]  173 	push	hl
   304E CD E0 2B      [17]  174 	call	_cpct_setPALColour
                            175 ;src/main.c:88: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(3,3), 0x4000);   // Clear de Screen BGCOLOR=Black
   3051 21 03 03      [10]  176 	ld	hl, #0x0303
   3054 E5            [11]  177 	push	hl
   3055 CD A3 2D      [17]  178 	call	_cpct_px2byteM0
   3058 45            [ 4]  179 	ld	b, l
   3059 21 00 40      [10]  180 	ld	hl, #0x4000
   305C E5            [11]  181 	push	hl
   305D C5            [11]  182 	push	bc
   305E 33            [ 6]  183 	inc	sp
   305F 26 C0         [ 7]  184 	ld	h, #0xc0
   3061 E5            [11]  185 	push	hl
   3062 CD BF 2D      [17]  186 	call	_cpct_memset
                            187 ;src/main.c:93: vmem = cpct_getScreenPtr (CPCT_VMEM_START, 12, 32);
   3065 21 0C 20      [10]  188 	ld	hl, #0x200c
   3068 E5            [11]  189 	push	hl
   3069 21 00 C0      [10]  190 	ld	hl, #0xc000
   306C E5            [11]  191 	push	hl
   306D CD 02 2F      [17]  192 	call	_cpct_getScreenPtr
                            193 ;src/main.c:98: drawWindow2(10,60,60,60);
   3070 21 3C 3C      [10]  194 	ld	hl, #0x3c3c
   3073 E5            [11]  195 	push	hl
   3074 2E 0A         [ 7]  196 	ld	l, #0x0a
   3076 E5            [11]  197 	push	hl
   3077 CD A5 21      [17]  198 	call	_drawWindow2
   307A F1            [10]  199 	pop	af
   307B F1            [10]  200 	pop	af
                            201 ;src/main.c:101: drawText2("GEMQUEST IS READY!!", 20, 82,  COLORTXT_WHITE, NORMALHEIGHT, OPAQUE);
   307C 21 01 00      [10]  202 	ld	hl, #0x0001
   307F E5            [11]  203 	push	hl
   3080 2E 52         [ 7]  204 	ld	l, #0x52
   3082 E5            [11]  205 	push	hl
   3083 3E 14         [ 7]  206 	ld	a, #0x14
   3085 F5            [11]  207 	push	af
   3086 33            [ 6]  208 	inc	sp
   3087 21 C8 30      [10]  209 	ld	hl, #___str_0
   308A E5            [11]  210 	push	hl
   308B CD B6 26      [17]  211 	call	_drawText2
   308E 21 07 00      [10]  212 	ld	hl, #7
   3091 39            [11]  213 	add	hl, sp
   3092 F9            [ 6]  214 	ld	sp, hl
                            215 ;src/main.c:102: drawText2("Press any key to continue", 15, 102,  COLORTXT_YELLOW, NORMALHEIGHT, OPAQUE);
   3093 21 01 00      [10]  216 	ld	hl, #0x0001
   3096 E5            [11]  217 	push	hl
   3097 21 66 01      [10]  218 	ld	hl, #0x0166
   309A E5            [11]  219 	push	hl
   309B 3E 0F         [ 7]  220 	ld	a, #0x0f
   309D F5            [11]  221 	push	af
   309E 33            [ 6]  222 	inc	sp
   309F 21 DC 30      [10]  223 	ld	hl, #___str_1
   30A2 E5            [11]  224 	push	hl
   30A3 CD B6 26      [17]  225 	call	_drawText2
   30A6 21 07 00      [10]  226 	ld	hl, #7
   30A9 39            [11]  227 	add	hl, sp
   30AA F9            [ 6]  228 	ld	sp, hl
                            229 ;src/main.c:104: seed = wait4UserKeypress();
   30AB CD C6 1C      [17]  230 	call	_wait4UserKeypress
                            231 ;src/main.c:106: if (!seed)
   30AE 7A            [ 4]  232 	ld	a, d
   30AF B3            [ 4]  233 	or	a, e
   30B0 B4            [ 4]  234 	or	a, h
   30B1 B5            [ 4]  235 	or	a,l
   30B2 20 0A         [12]  236 	jr	NZ,00102$
                            237 ;src/main.c:107: seed++;
   30B4 2C            [ 4]  238 	inc	l
   30B5 20 07         [12]  239 	jr	NZ,00109$
   30B7 24            [ 4]  240 	inc	h
   30B8 20 04         [12]  241 	jr	NZ,00109$
   30BA 1C            [ 4]  242 	inc	e
   30BB 20 01         [12]  243 	jr	NZ,00109$
   30BD 14            [ 4]  244 	inc	d
   30BE                     245 00109$:
   30BE                     246 00102$:
                            247 ;src/main.c:108: cpct_srand(seed);
   30BE CD 9B 2C      [17]  248 	call	_cpct_setSeed_mxor
   30C1 CD A3 2C      [17]  249 	call	_cpct_restoreState_mxor_u8
                            250 ;src/main.c:114: initKeys();
   30C4 CD 9B 1C      [17]  251 	call	_initKeys
   30C7 C9            [10]  252 	ret
   30C8                     253 ___str_0:
   30C8 47 45 4D 51 55 45   254 	.ascii "GEMQUEST IS READY!!"
        53 54 20 49 53 20
        52 45 41 44 59 21
        21
   30DB 00                  255 	.db 0x00
   30DC                     256 ___str_1:
   30DC 50 72 65 73 73 20   257 	.ascii "Press any key to continue"
        61 6E 79 20 6B 65
        79 20 74 6F 20 63
        6F 6E 74 69 6E 75
        65
   30F5 00                  258 	.db 0x00
                            259 ;src/main.c:118: void main(void) {
                            260 ;	---------------------------------
                            261 ; Function main
                            262 ; ---------------------------------
   30F6                     263 _main::
                            264 ;src/main.c:120: cpct_setStackLocation(NEW_STACK_LOCATION);
   30F6 21 00 01      [10]  265 	ld	hl, #0x0100
   30F9 CD CE 2C      [17]  266 	call	_cpct_setStackLocation
                            267 ;src/main.c:122: cpct_disableFirmware();
   30FC CD CD 2D      [17]  268 	call	_cpct_disableFirmware
                            269 ;src/main.c:124: cpct_setInterruptHandler( myInterruptHandler );
   30FF 21 03 30      [10]  270 	ld	hl, #_myInterruptHandler
   3102 CD 6A 2F      [17]  271 	call	_cpct_setInterruptHandler
                            272 ;src/main.c:126: initMain();
   3105 CD 3A 30      [17]  273 	call	_initMain
                            274 ;src/main.c:127: initGame();
   3108 CD 78 1C      [17]  275 	call	_initGame
                            276 ;src/main.c:128: playGame();
   310B CD 8D 1C      [17]  277 	call	_playGame
                            278 ;src/main.c:131: cpct_memset(CPCT_VMEM_START, cpct_px2byteM0(3,3), 0x4000);   // Clear de Screen BGCOLOR=Black
   310E 21 03 03      [10]  279 	ld	hl, #0x0303
   3111 E5            [11]  280 	push	hl
   3112 CD A3 2D      [17]  281 	call	_cpct_px2byteM0
   3115 45            [ 4]  282 	ld	b, l
   3116 21 00 40      [10]  283 	ld	hl, #0x4000
   3119 E5            [11]  284 	push	hl
   311A C5            [11]  285 	push	bc
   311B 33            [ 6]  286 	inc	sp
   311C 26 C0         [ 7]  287 	ld	h, #0xc0
   311E E5            [11]  288 	push	hl
   311F CD BF 2D      [17]  289 	call	_cpct_memset
                            290 ;src/main.c:133: drawWindow();
   3122 CD EA 20      [17]  291 	call	_drawWindow
                            292 ;src/main.c:134: drawText2("PRESS ANY KEY TO END", 18, 98,  COLORTXT_YELLOW, NORMALHEIGHT, OPAQUE);
   3125 21 01 00      [10]  293 	ld	hl, #0x0001
   3128 E5            [11]  294 	push	hl
   3129 21 62 01      [10]  295 	ld	hl, #0x0162
   312C E5            [11]  296 	push	hl
   312D 3E 12         [ 7]  297 	ld	a, #0x12
   312F F5            [11]  298 	push	af
   3130 33            [ 6]  299 	inc	sp
   3131 21 44 31      [10]  300 	ld	hl, #___str_2
   3134 E5            [11]  301 	push	hl
   3135 CD B6 26      [17]  302 	call	_drawText2
   3138 21 07 00      [10]  303 	ld	hl, #7
   313B 39            [11]  304 	add	hl, sp
   313C F9            [ 6]  305 	ld	sp, hl
                            306 ;src/main.c:135: wait4OneKey();
   313D CD BD 1C      [17]  307 	call	_wait4OneKey
                            308 ;src/main.c:136: reset_cpc();
   3140 CD F9 2A      [17]  309 	call	_reset_cpc
   3143 C9            [10]  310 	ret
   3144                     311 ___str_2:
   3144 50 52 45 53 53 20   312 	.ascii "PRESS ANY KEY TO END"
        41 4E 59 20 4B 45
        59 20 54 4F 20 45
        4E 44
   3158 00                  313 	.db 0x00
                            314 	.area _CODE
                            315 	.area _INITIALIZER
                            316 	.area _CABS (ABS)
