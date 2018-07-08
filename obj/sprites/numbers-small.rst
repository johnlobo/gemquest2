                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module numbers_small
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _g_numbers_small_14
                             12 	.globl _g_numbers_small_13
                             13 	.globl _g_numbers_small_12
                             14 	.globl _g_numbers_small_11
                             15 	.globl _g_numbers_small_10
                             16 	.globl _g_numbers_small_09
                             17 	.globl _g_numbers_small_08
                             18 	.globl _g_numbers_small_07
                             19 	.globl _g_numbers_small_06
                             20 	.globl _g_numbers_small_05
                             21 	.globl _g_numbers_small_04
                             22 	.globl _g_numbers_small_03
                             23 	.globl _g_numbers_small_02
                             24 	.globl _g_numbers_small_01
                             25 	.globl _g_numbers_small_00
                             26 ;--------------------------------------------------------
                             27 ; special function registers
                             28 ;--------------------------------------------------------
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DATA
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 	.area _CODE
   13CA                      58 _g_numbers_small_00:
   13CA 00                   59 	.db #0x00	; 0
   13CB 00                   60 	.db #0x00	; 0
   13CC 00                   61 	.db #0x00	; 0
   13CD 00                   62 	.db #0x00	; 0
   13CE 00                   63 	.db #0x00	; 0
   13CF 00                   64 	.db #0x00	; 0
   13D0 00                   65 	.db #0x00	; 0
   13D1 AA                   66 	.db #0xaa	; 170
   13D2 55                   67 	.db #0x55	; 85	'U'
   13D3 00                   68 	.db #0x00	; 0
   13D4                      69 _g_numbers_small_01:
   13D4 00                   70 	.db #0x00	; 0
   13D5 00                   71 	.db #0x00	; 0
   13D6 00                   72 	.db #0x00	; 0
   13D7 00                   73 	.db #0x00	; 0
   13D8 55                   74 	.db #0x55	; 85	'U'
   13D9 AA                   75 	.db #0xaa	; 170
   13DA 00                   76 	.db #0x00	; 0
   13DB 00                   77 	.db #0x00	; 0
   13DC 00                   78 	.db #0x00	; 0
   13DD 00                   79 	.db #0x00	; 0
   13DE                      80 _g_numbers_small_02:
   13DE 00                   81 	.db #0x00	; 0
   13DF 00                   82 	.db #0x00	; 0
   13E0 00                   83 	.db #0x00	; 0
   13E1 00                   84 	.db #0x00	; 0
   13E2 00                   85 	.db #0x00	; 0
   13E3 00                   86 	.db #0x00	; 0
   13E4 00                   87 	.db #0x00	; 0
   13E5 00                   88 	.db #0x00	; 0
   13E6 55                   89 	.db #0x55	; 85	'U'
   13E7 00                   90 	.db #0x00	; 0
   13E8                      91 _g_numbers_small_03:
   13E8 00                   92 	.db #0x00	; 0
   13E9 AA                   93 	.db #0xaa	; 170
   13EA 00                   94 	.db #0x00	; 0
   13EB AA                   95 	.db #0xaa	; 170
   13EC 55                   96 	.db #0x55	; 85	'U'
   13ED 00                   97 	.db #0x00	; 0
   13EE AA                   98 	.db #0xaa	; 170
   13EF 00                   99 	.db #0x00	; 0
   13F0 AA                  100 	.db #0xaa	; 170
   13F1 00                  101 	.db #0x00	; 0
   13F2                     102 _g_numbers_small_04:
   13F2 55                  103 	.db #0x55	; 85	'U'
   13F3 00                  104 	.db #0x00	; 0
   13F4 AA                  105 	.db #0xaa	; 170
   13F5 AA                  106 	.db #0xaa	; 170
   13F6 AA                  107 	.db #0xaa	; 170
   13F7 AA                  108 	.db #0xaa	; 170
   13F8 AA                  109 	.db #0xaa	; 170
   13F9 AA                  110 	.db #0xaa	; 170
   13FA 55                  111 	.db #0x55	; 85	'U'
   13FB 00                  112 	.db #0x00	; 0
   13FC                     113 _g_numbers_small_05:
   13FC 00                  114 	.db #0x00	; 0
   13FD AA                  115 	.db #0xaa	; 170
   13FE 55                  116 	.db #0x55	; 85	'U'
   13FF AA                  117 	.db #0xaa	; 170
   1400 00                  118 	.db #0x00	; 0
   1401 AA                  119 	.db #0xaa	; 170
   1402 00                  120 	.db #0x00	; 0
   1403 AA                  121 	.db #0xaa	; 170
   1404 00                  122 	.db #0x00	; 0
   1405 AA                  123 	.db #0xaa	; 170
   1406                     124 _g_numbers_small_06:
   1406 FF                  125 	.db #0xff	; 255
   1407 AA                  126 	.db #0xaa	; 170
   1408 00                  127 	.db #0x00	; 0
   1409 AA                  128 	.db #0xaa	; 170
   140A 55                  129 	.db #0x55	; 85	'U'
   140B 00                  130 	.db #0x00	; 0
   140C AA                  131 	.db #0xaa	; 170
   140D 00                  132 	.db #0x00	; 0
   140E FF                  133 	.db #0xff	; 255
   140F AA                  134 	.db #0xaa	; 170
   1410                     135 _g_numbers_small_07:
   1410 FF                  136 	.db #0xff	; 255
   1411 AA                  137 	.db #0xaa	; 170
   1412 00                  138 	.db #0x00	; 0
   1413 AA                  139 	.db #0xaa	; 170
   1414 55                  140 	.db #0x55	; 85	'U'
   1415 AA                  141 	.db #0xaa	; 170
   1416 00                  142 	.db #0x00	; 0
   1417 AA                  143 	.db #0xaa	; 170
   1418 FF                  144 	.db #0xff	; 255
   1419 AA                  145 	.db #0xaa	; 170
   141A                     146 _g_numbers_small_08:
   141A AA                  147 	.db #0xaa	; 170
   141B AA                  148 	.db #0xaa	; 170
   141C AA                  149 	.db #0xaa	; 170
   141D AA                  150 	.db #0xaa	; 170
   141E FF                  151 	.db #0xff	; 255
   141F AA                  152 	.db #0xaa	; 170
   1420 00                  153 	.db #0x00	; 0
   1421 AA                  154 	.db #0xaa	; 170
   1422 00                  155 	.db #0x00	; 0
   1423 AA                  156 	.db #0xaa	; 170
   1424                     157 _g_numbers_small_09:
   1424 FF                  158 	.db #0xff	; 255
   1425 AA                  159 	.db #0xaa	; 170
   1426 AA                  160 	.db #0xaa	; 170
   1427 00                  161 	.db #0x00	; 0
   1428 FF                  162 	.db #0xff	; 255
   1429 AA                  163 	.db #0xaa	; 170
   142A 00                  164 	.db #0x00	; 0
   142B AA                  165 	.db #0xaa	; 170
   142C FF                  166 	.db #0xff	; 255
   142D AA                  167 	.db #0xaa	; 170
   142E                     168 _g_numbers_small_10:
   142E 55                  169 	.db #0x55	; 85	'U'
   142F 00                  170 	.db #0x00	; 0
   1430 AA                  171 	.db #0xaa	; 170
   1431 00                  172 	.db #0x00	; 0
   1432 FF                  173 	.db #0xff	; 255
   1433 AA                  174 	.db #0xaa	; 170
   1434 AA                  175 	.db #0xaa	; 170
   1435 AA                  176 	.db #0xaa	; 170
   1436 55                  177 	.db #0x55	; 85	'U'
   1437 00                  178 	.db #0x00	; 0
   1438                     179 _g_numbers_small_11:
   1438 FF                  180 	.db #0xff	; 255
   1439 AA                  181 	.db #0xaa	; 170
   143A 00                  182 	.db #0x00	; 0
   143B AA                  183 	.db #0xaa	; 170
   143C 55                  184 	.db #0x55	; 85	'U'
   143D 00                  185 	.db #0x00	; 0
   143E 55                  186 	.db #0x55	; 85	'U'
   143F 00                  187 	.db #0x00	; 0
   1440 55                  188 	.db #0x55	; 85	'U'
   1441 00                  189 	.db #0x00	; 0
   1442                     190 _g_numbers_small_12:
   1442 55                  191 	.db #0x55	; 85	'U'
   1443 00                  192 	.db #0x00	; 0
   1444 AA                  193 	.db #0xaa	; 170
   1445 AA                  194 	.db #0xaa	; 170
   1446 55                  195 	.db #0x55	; 85	'U'
   1447 00                  196 	.db #0x00	; 0
   1448 AA                  197 	.db #0xaa	; 170
   1449 AA                  198 	.db #0xaa	; 170
   144A 55                  199 	.db #0x55	; 85	'U'
   144B 00                  200 	.db #0x00	; 0
   144C                     201 _g_numbers_small_13:
   144C 55                  202 	.db #0x55	; 85	'U'
   144D 00                  203 	.db #0x00	; 0
   144E AA                  204 	.db #0xaa	; 170
   144F AA                  205 	.db #0xaa	; 170
   1450 55                  206 	.db #0x55	; 85	'U'
   1451 AA                  207 	.db #0xaa	; 170
   1452 00                  208 	.db #0x00	; 0
   1453 AA                  209 	.db #0xaa	; 170
   1454 00                  210 	.db #0x00	; 0
   1455 AA                  211 	.db #0xaa	; 170
   1456                     212 _g_numbers_small_14:
   1456 00                  213 	.db #0x00	; 0
   1457 00                  214 	.db #0x00	; 0
   1458 55                  215 	.db #0x55	; 85	'U'
   1459 00                  216 	.db #0x00	; 0
   145A 00                  217 	.db #0x00	; 0
   145B 00                  218 	.db #0x00	; 0
   145C 55                  219 	.db #0x55	; 85	'U'
   145D 00                  220 	.db #0x00	; 0
   145E 00                  221 	.db #0x00	; 0
   145F 00                  222 	.db #0x00	; 0
                            223 	.area _INITIALIZER
                            224 	.area _CABS (ABS)
