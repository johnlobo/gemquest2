ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;*************************************
                              2 ; RESET
                              3 ;*************************************
                              4 
                              5 .globl _reset_cpc
   2AF9                       6 _reset_cpc::
   2AF9 CD 00 00      [17]    7 	call #0000
   2AFC C9            [10]    8 	ret
                              9 
                             10 
                             11 ;*************************************
                             12 ; FAST ABS
                             13 ;
                             14 ; Returns the absolute value of a given u1 number
                             15 ;*************************************
                             16 
                             17 .globl _fast_abs
   2AFD                      18 _fast_abs::
   2AFD CB 7C         [ 8]   19      bit 7,h
   2AFF C8            [11]   20      ret z
   2B00 AF            [ 4]   21      xor a 
   2B01 95            [ 4]   22      sub l  
   2B02 6F            [ 4]   23      ld l,a
   2B03 9F            [ 4]   24      sbc a,a  
   2B04 94            [ 4]   25      sub h  
   2B05 67            [ 4]   26      ld h,a
   2B06 C9            [10]   27      ret
                             28 
                             29 ;******************************
                             30 ; 	unsigned char fastCollision(unsigned char x1,unsigned char y1,unsigned char w1,unsigned char h1,unsigned char x2,unsigned char y2,unsigned char w2,unsigned char h2){
                             31 ; 	Descripción:	Devuelve 1 si se ha producido una colisión y 0 en caso contrario
                             32 ;	Entrada:	- Coordenada x objeto 1
                             33 ;				- Coordenada y objeto 1
                             34 ;				- Ancho objeto 1
                             35 ;				- Alto objeto 1
                             36 ;				- Coordenada x objeto 1
                             37 ;				- Coordenada y objeto 1
                             38 ;				- Ancho objeto 1
                             39 ;				- Alto objeto 1
                             40 ;	Salida:		- HL = 1 si se ha producido una colisión, HL = 0 en caso contrario
                             41 ;	Modificados: 
                             42 ;
                             43 ; @ 
                             44 ;******************************
                             45 .globl _fast_collision
   2B07                      46 _fast_collision::	
                             47 
   2B07 DD E5         [15]   48 	push ix
                             49 
                             50 ;	ld ix,#2
   2B09 DD 21 04 00   [14]   51 	ld ix,#4
   2B0D DD 39         [15]   52 	add ix,sp
                             53 	
   2B0F DD 7E 00      [19]   54 	ld a,0 (ix)				;recupero la coordenada x1
   2B12 67            [ 4]   55 	ld h,a
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



   2B13 DD 7E 02      [19]   56 	ld a,2 (ix)				;recupero el ancho 1
   2B16 84            [ 4]   57 	add a,h
   2B17 6F            [ 4]   58 	ld l,a
   2B18 DD 7E 04      [19]   59 	ld a,4 (ix)				;recupero la coordenada x2
   2B1B 47            [ 4]   60 	ld b,a
   2B1C DD 7E 06      [19]   61 	ld a,6 (ix)				;recupero el ancho 2
   2B1F 80            [ 4]   62 	add a,b
   2B20 4F            [ 4]   63 	ld c,a
   2B21 CD 4B 2B      [17]   64 	call #solseg
   2B24 30 1E         [12]   65 	jr nc, no_choca
   2B26 DD 7E 01      [19]   66 	ld a,1 (ix)				;recupero la coordenada y1
   2B29 67            [ 4]   67 	ld h,a
   2B2A DD 7E 03      [19]   68 	ld a,3 (ix)				;recupero el alto 1
   2B2D 84            [ 4]   69 	add a,h
   2B2E 6F            [ 4]   70 	ld l,a
   2B2F DD 7E 05      [19]   71 	ld a,5 (ix)				;recupero la coordenada y2
   2B32 47            [ 4]   72 	ld b,a
   2B33 DD 7E 07      [19]   73 	ld a,7 (ix)				;recupero el alto 2
   2B36 80            [ 4]   74 	add a,b
   2B37 4F            [ 4]   75 	ld c,a
   2B38 CD 4B 2B      [17]   76 	call #solseg
   2B3B 30 07         [12]   77 	jr nc, no_choca
   2B3D 26 00         [ 7]   78 	ld h,#0
   2B3F 2E 01         [ 7]   79 	ld l,#1
                             80 
   2B41 DD E1         [14]   81 	pop ix
                             82 
   2B43 C9            [10]   83 	ret
   2B44                      84 no_choca:
   2B44 26 00         [ 7]   85 	ld h,#0
   2B46 2E 00         [ 7]   86 	ld l,#0
                             87 
   2B48 DD E1         [14]   88 	pop ix
                             89 
   2B4A C9            [10]   90 	ret
                             91 
   2B4B                      92 solseg:
   2B4B 79            [ 4]   93 	ld a,c					;solapamaiento
   2B4C BC            [ 4]   94 	cp h
   2B4D 38 02         [12]   95 	jr c, #solseg1			;no hay colisión continua
   2B4F 7D            [ 4]   96 	ld a,l
   2B50 B8            [ 4]   97 	cp b
   2B51                      98 solseg1:
   2B51 3F            [ 4]   99 	ccf						;complemento carry
   2B52 C9            [10]  100 	ret
