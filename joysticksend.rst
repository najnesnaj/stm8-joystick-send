                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Mon Feb  5 13:04:22 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module joysticksend
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _SE8R01_Init
                                     14 	.globl _SE8R01_Analog_Init
                                     15 	.globl _SE8R01_Calibration
                                     16 	.globl _rf_switch_bank
                                     17 	.globl _init_io
                                     18 	.globl _delay
                                     19 	.globl _InitializeSystemClock
                                     20 	.globl _InitializeSPI
                                     21 	.globl _read_spi_buf
                                     22 	.globl _write_spi_buf
                                     23 	.globl _read_spi_reg
                                     24 	.globl _write_spi_reg
                                     25 	.globl _write_spi
                                     26 	.globl _delayTenMicro
                                     27 	.globl _memset
                                     28 	.globl _tx_buf
                                     29 	.globl _rx_buf
                                     30 	.globl _ADDRESS0
                                     31 	.globl _ADDRESS1
                                     32 	.globl _ADDRESS5
                                     33 	.globl _ADDRESS4
                                     34 	.globl _ADDRESS3
                                     35 	.globl _ADDRESS2
                                     36 	.globl _TX_ADDRESS
                                     37 	.globl _status
                                     38 	.globl _pip
                                     39 	.globl _signal_lv
                                     40 	.globl _newdata
                                     41 	.globl _pload_width_now
                                     42 	.globl _SE8R01_DR_500K
                                     43 	.globl _SE8R01_DR_1M
                                     44 	.globl _SE8R01_DR_2M
                                     45 	.globl _myData_pip4
                                     46 	.globl _myData_pip5
                                     47 	.globl _gtemp
                                     48 ;--------------------------------------------------------
                                     49 ; ram data
                                     50 ;--------------------------------------------------------
                                     51 	.area DATA
      000001                         52 _gtemp::
      000001                         53 	.ds 5
      000006                         54 _myData_pip5::
      000006                         55 	.ds 5
      00000B                         56 _myData_pip4::
      00000B                         57 	.ds 5
                                     58 ;--------------------------------------------------------
                                     59 ; ram data
                                     60 ;--------------------------------------------------------
                                     61 	.area INITIALIZED
      000010                         62 _SE8R01_DR_2M::
      000010                         63 	.ds 2
      000012                         64 _SE8R01_DR_1M::
      000012                         65 	.ds 2
      000014                         66 _SE8R01_DR_500K::
      000014                         67 	.ds 2
      000016                         68 _pload_width_now::
      000016                         69 	.ds 2
      000018                         70 _newdata::
      000018                         71 	.ds 2
      00001A                         72 _signal_lv::
      00001A                         73 	.ds 1
      00001B                         74 _pip::
      00001B                         75 	.ds 2
      00001D                         76 _status::
      00001D                         77 	.ds 1
      00001E                         78 _TX_ADDRESS::
      00001E                         79 	.ds 4
      000022                         80 _ADDRESS2::
      000022                         81 	.ds 1
      000023                         82 _ADDRESS3::
      000023                         83 	.ds 1
      000024                         84 _ADDRESS4::
      000024                         85 	.ds 1
      000025                         86 _ADDRESS5::
      000025                         87 	.ds 1
      000026                         88 _ADDRESS1::
      000026                         89 	.ds 4
      00002A                         90 _ADDRESS0::
      00002A                         91 	.ds 4
      00002E                         92 _rx_buf::
      00002E                         93 	.ds 32
      00004E                         94 _tx_buf::
      00004E                         95 	.ds 32
                                     96 ;--------------------------------------------------------
                                     97 ; Stack segment in internal ram 
                                     98 ;--------------------------------------------------------
                                     99 	.area	SSEG
      000000                        100 __start__stack:
      000000                        101 	.ds	1
                                    102 
                                    103 ;--------------------------------------------------------
                                    104 ; absolute external ram data
                                    105 ;--------------------------------------------------------
                                    106 	.area DABS (ABS)
                                    107 ;--------------------------------------------------------
                                    108 ; interrupt vector 
                                    109 ;--------------------------------------------------------
                                    110 	.area HOME
      008000                        111 __interrupt_vect:
      008000 82 00 80 83            112 	int s_GSINIT ;reset
      008004 82 00 00 00            113 	int 0x0000 ;trap
      008008 82 00 00 00            114 	int 0x0000 ;int0
      00800C 82 00 00 00            115 	int 0x0000 ;int1
      008010 82 00 00 00            116 	int 0x0000 ;int2
      008014 82 00 00 00            117 	int 0x0000 ;int3
      008018 82 00 00 00            118 	int 0x0000 ;int4
      00801C 82 00 00 00            119 	int 0x0000 ;int5
      008020 82 00 00 00            120 	int 0x0000 ;int6
      008024 82 00 00 00            121 	int 0x0000 ;int7
      008028 82 00 00 00            122 	int 0x0000 ;int8
      00802C 82 00 00 00            123 	int 0x0000 ;int9
      008030 82 00 00 00            124 	int 0x0000 ;int10
      008034 82 00 00 00            125 	int 0x0000 ;int11
      008038 82 00 00 00            126 	int 0x0000 ;int12
      00803C 82 00 00 00            127 	int 0x0000 ;int13
      008040 82 00 00 00            128 	int 0x0000 ;int14
      008044 82 00 00 00            129 	int 0x0000 ;int15
      008048 82 00 00 00            130 	int 0x0000 ;int16
      00804C 82 00 00 00            131 	int 0x0000 ;int17
      008050 82 00 00 00            132 	int 0x0000 ;int18
      008054 82 00 00 00            133 	int 0x0000 ;int19
      008058 82 00 00 00            134 	int 0x0000 ;int20
      00805C 82 00 00 00            135 	int 0x0000 ;int21
      008060 82 00 00 00            136 	int 0x0000 ;int22
      008064 82 00 00 00            137 	int 0x0000 ;int23
      008068 82 00 00 00            138 	int 0x0000 ;int24
      00806C 82 00 00 00            139 	int 0x0000 ;int25
      008070 82 00 00 00            140 	int 0x0000 ;int26
      008074 82 00 00 00            141 	int 0x0000 ;int27
      008078 82 00 00 00            142 	int 0x0000 ;int28
      00807C 82 00 00 00            143 	int 0x0000 ;int29
                                    144 ;--------------------------------------------------------
                                    145 ; global & static initialisations
                                    146 ;--------------------------------------------------------
                                    147 	.area HOME
                                    148 	.area GSINIT
                                    149 	.area GSFINAL
                                    150 	.area GSINIT
      008083                        151 __sdcc_gs_init_startup:
      008083                        152 __sdcc_init_data:
                                    153 ; stm8_genXINIT() start
      008083 AE 00 0F         [ 2]  154 	ldw x, #l_DATA
      008086 27 07            [ 1]  155 	jreq	00002$
      008088                        156 00001$:
      008088 72 4F 00 00      [ 1]  157 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  158 	decw x
      00808D 26 F9            [ 1]  159 	jrne	00001$
      00808F                        160 00002$:
      00808F AE 00 5E         [ 2]  161 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  162 	jreq	00004$
      008094                        163 00003$:
      008094 D6 88 6A         [ 1]  164 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0F         [ 1]  165 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  166 	decw	x
      00809B 26 F7            [ 1]  167 	jrne	00003$
      00809D                        168 00004$:
                                    169 ; stm8_genXINIT() end
                                    170 	.area GSFINAL
      00809D CC 80 80         [ 2]  171 	jp	__sdcc_program_startup
                                    172 ;--------------------------------------------------------
                                    173 ; Home
                                    174 ;--------------------------------------------------------
                                    175 	.area HOME
                                    176 	.area HOME
      008080                        177 __sdcc_program_startup:
      008080 CC 86 92         [ 2]  178 	jp	_main
                                    179 ;	return from main will return to caller
                                    180 ;--------------------------------------------------------
                                    181 ; code
                                    182 ;--------------------------------------------------------
                                    183 	.area CODE
                                    184 ;	joysticksend.c: 37: void delayTenMicro (void) {
                                    185 ;	-----------------------------------------
                                    186 ;	 function delayTenMicro
                                    187 ;	-----------------------------------------
      0080A0                        188 _delayTenMicro:
                                    189 ;	joysticksend.c: 39: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  190 	ld	a, #0x32
      0080A2                        191 00104$:
                                    192 ;	joysticksend.c: 40: __asm__("nop");
      0080A2 9D               [ 1]  193 	nop
      0080A3 4A               [ 1]  194 	dec	a
                                    195 ;	joysticksend.c: 39: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  196 	tnz	a
      0080A5 26 FB            [ 1]  197 	jrne	00104$
      0080A7 81               [ 4]  198 	ret
                                    199 ;	joysticksend.c: 42: UCHAR write_spi (UCHAR value) {
                                    200 ;	-----------------------------------------
                                    201 ;	 function write_spi
                                    202 ;	-----------------------------------------
      0080A8                        203 _write_spi:
                                    204 ;	joysticksend.c: 44: delayTenMicro ();
      0080A8 CD 80 A0         [ 4]  205 	call	_delayTenMicro
                                    206 ;	joysticksend.c: 45: SPI_DR = value;
      0080AB AE 52 04         [ 2]  207 	ldw	x, #0x5204
      0080AE 7B 03            [ 1]  208 	ld	a, (0x03, sp)
      0080B0 F7               [ 1]  209 	ld	(x), a
                                    210 ;	joysticksend.c: 46: delayTenMicro ();
      0080B1 CD 80 A0         [ 4]  211 	call	_delayTenMicro
                                    212 ;	joysticksend.c: 47: while ((SPI_SR & TXE) == 0);
      0080B4                        213 00101$:
      0080B4 AE 52 03         [ 2]  214 	ldw	x, #0x5203
      0080B7 F6               [ 1]  215 	ld	a, (x)
      0080B8 A5 02            [ 1]  216 	bcp	a, #0x02
      0080BA 27 F8            [ 1]  217 	jreq	00101$
                                    218 ;	joysticksend.c: 48: delayTenMicro ();
      0080BC CD 80 A0         [ 4]  219 	call	_delayTenMicro
                                    220 ;	joysticksend.c: 49: while ((SPI_SR & RXNE) == 0);
      0080BF                        221 00104$:
      0080BF AE 52 03         [ 2]  222 	ldw	x, #0x5203
      0080C2 F6               [ 1]  223 	ld	a, (x)
      0080C3 44               [ 1]  224 	srl	a
      0080C4 24 F9            [ 1]  225 	jrnc	00104$
                                    226 ;	joysticksend.c: 50: delayTenMicro ();
      0080C6 CD 80 A0         [ 4]  227 	call	_delayTenMicro
                                    228 ;	joysticksend.c: 51: ret = SPI_DR;
      0080C9 AE 52 04         [ 2]  229 	ldw	x, #0x5204
      0080CC F6               [ 1]  230 	ld	a, (x)
                                    231 ;	joysticksend.c: 52: return (ret);
      0080CD 81               [ 4]  232 	ret
                                    233 ;	joysticksend.c: 54: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
                                    234 ;	-----------------------------------------
                                    235 ;	 function write_spi_reg
                                    236 ;	-----------------------------------------
      0080CE                        237 _write_spi_reg:
      0080CE 88               [ 1]  238 	push	a
                                    239 ;	joysticksend.c: 56: PC_ODR &= ~(1 << CSN);
      0080CF AE 50 0A         [ 2]  240 	ldw	x, #0x500a
      0080D2 F6               [ 1]  241 	ld	a, (x)
      0080D3 A4 F7            [ 1]  242 	and	a, #0xf7
      0080D5 F7               [ 1]  243 	ld	(x), a
                                    244 ;	joysticksend.c: 57: ret = write_spi (reg);
      0080D6 7B 04            [ 1]  245 	ld	a, (0x04, sp)
      0080D8 88               [ 1]  246 	push	a
      0080D9 CD 80 A8         [ 4]  247 	call	_write_spi
      0080DC 5B 01            [ 2]  248 	addw	sp, #1
      0080DE 6B 01            [ 1]  249 	ld	(0x01, sp), a
                                    250 ;	joysticksend.c: 58: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      0080E0 7B 04            [ 1]  251 	ld	a, (0x04, sp)
      0080E2 A1 FF            [ 1]  252 	cp	a, #0xff
      0080E4 27 15            [ 1]  253 	jreq	00102$
      0080E6 7B 04            [ 1]  254 	ld	a, (0x04, sp)
      0080E8 A1 E2            [ 1]  255 	cp	a, #0xe2
      0080EA 27 0F            [ 1]  256 	jreq	00102$
      0080EC 7B 04            [ 1]  257 	ld	a, (0x04, sp)
      0080EE A1 E1            [ 1]  258 	cp	a, #0xe1
      0080F0 27 09            [ 1]  259 	jreq	00102$
                                    260 ;	joysticksend.c: 59: write_spi (value);
      0080F2 7B 05            [ 1]  261 	ld	a, (0x05, sp)
      0080F4 88               [ 1]  262 	push	a
      0080F5 CD 80 A8         [ 4]  263 	call	_write_spi
      0080F8 84               [ 1]  264 	pop	a
      0080F9 20 03            [ 2]  265 	jra	00103$
      0080FB                        266 00102$:
                                    267 ;	joysticksend.c: 61: delayTenMicro ();
      0080FB CD 80 A0         [ 4]  268 	call	_delayTenMicro
      0080FE                        269 00103$:
                                    270 ;	joysticksend.c: 62: PC_ODR |= (1 << CSN);
      0080FE AE 50 0A         [ 2]  271 	ldw	x, #0x500a
      008101 F6               [ 1]  272 	ld	a, (x)
      008102 AA 08            [ 1]  273 	or	a, #0x08
      008104 F7               [ 1]  274 	ld	(x), a
                                    275 ;	joysticksend.c: 63: return (ret);
      008105 7B 01            [ 1]  276 	ld	a, (0x01, sp)
      008107 5B 01            [ 2]  277 	addw	sp, #1
      008109 81               [ 4]  278 	ret
                                    279 ;	joysticksend.c: 65: UCHAR read_spi_reg (UCHAR reg) {
                                    280 ;	-----------------------------------------
                                    281 ;	 function read_spi_reg
                                    282 ;	-----------------------------------------
      00810A                        283 _read_spi_reg:
      00810A 88               [ 1]  284 	push	a
                                    285 ;	joysticksend.c: 67: PC_ODR &= ~(1 << CSN);
      00810B AE 50 0A         [ 2]  286 	ldw	x, #0x500a
      00810E F6               [ 1]  287 	ld	a, (x)
      00810F A4 F7            [ 1]  288 	and	a, #0xf7
      008111 F7               [ 1]  289 	ld	(x), a
                                    290 ;	joysticksend.c: 68: ret = write_spi (reg);
      008112 7B 04            [ 1]  291 	ld	a, (0x04, sp)
      008114 88               [ 1]  292 	push	a
      008115 CD 80 A8         [ 4]  293 	call	_write_spi
      008118 5B 01            [ 2]  294 	addw	sp, #1
      00811A 6B 01            [ 1]  295 	ld	(0x01, sp), a
                                    296 ;	joysticksend.c: 69: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      00811C 7B 04            [ 1]  297 	ld	a, (0x04, sp)
      00811E A1 FF            [ 1]  298 	cp	a, #0xff
      008120 27 17            [ 1]  299 	jreq	00102$
      008122 7B 04            [ 1]  300 	ld	a, (0x04, sp)
      008124 A1 E2            [ 1]  301 	cp	a, #0xe2
      008126 27 11            [ 1]  302 	jreq	00102$
      008128 7B 04            [ 1]  303 	ld	a, (0x04, sp)
      00812A A1 E1            [ 1]  304 	cp	a, #0xe1
      00812C 27 0B            [ 1]  305 	jreq	00102$
                                    306 ;	joysticksend.c: 70: ret = write_spi (NOP);
      00812E 4B FF            [ 1]  307 	push	#0xff
      008130 CD 80 A8         [ 4]  308 	call	_write_spi
      008133 5B 01            [ 2]  309 	addw	sp, #1
      008135 6B 01            [ 1]  310 	ld	(0x01, sp), a
      008137 20 03            [ 2]  311 	jra	00103$
      008139                        312 00102$:
                                    313 ;	joysticksend.c: 72: delayTenMicro ();
      008139 CD 80 A0         [ 4]  314 	call	_delayTenMicro
      00813C                        315 00103$:
                                    316 ;	joysticksend.c: 73: PC_ODR |= (1 << CSN);
      00813C AE 50 0A         [ 2]  317 	ldw	x, #0x500a
      00813F F6               [ 1]  318 	ld	a, (x)
      008140 AA 08            [ 1]  319 	or	a, #0x08
      008142 F7               [ 1]  320 	ld	(x), a
                                    321 ;	joysticksend.c: 74: return (ret);
      008143 7B 01            [ 1]  322 	ld	a, (0x01, sp)
      008145 5B 01            [ 2]  323 	addw	sp, #1
      008147 81               [ 4]  324 	ret
                                    325 ;	joysticksend.c: 76: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    326 ;	-----------------------------------------
                                    327 ;	 function write_spi_buf
                                    328 ;	-----------------------------------------
      008148                        329 _write_spi_buf:
      008148 52 02            [ 2]  330 	sub	sp, #2
                                    331 ;	joysticksend.c: 78: PC_ODR &= ~(1 << CSN);
      00814A AE 50 0A         [ 2]  332 	ldw	x, #0x500a
      00814D F6               [ 1]  333 	ld	a, (x)
      00814E A4 F7            [ 1]  334 	and	a, #0xf7
      008150 F7               [ 1]  335 	ld	(x), a
                                    336 ;	joysticksend.c: 79: ret = write_spi (reg);
      008151 7B 05            [ 1]  337 	ld	a, (0x05, sp)
      008153 88               [ 1]  338 	push	a
      008154 CD 80 A8         [ 4]  339 	call	_write_spi
      008157 5B 01            [ 2]  340 	addw	sp, #1
      008159 6B 02            [ 1]  341 	ld	(0x02, sp), a
                                    342 ;	joysticksend.c: 80: for (n = 0; n < len; ++n)
      00815B 0F 01            [ 1]  343 	clr	(0x01, sp)
      00815D                        344 00103$:
      00815D 7B 01            [ 1]  345 	ld	a, (0x01, sp)
      00815F 11 08            [ 1]  346 	cp	a, (0x08, sp)
      008161 24 11            [ 1]  347 	jrnc	00101$
                                    348 ;	joysticksend.c: 81: write_spi (array[n]);
      008163 5F               [ 1]  349 	clrw	x
      008164 7B 01            [ 1]  350 	ld	a, (0x01, sp)
      008166 97               [ 1]  351 	ld	xl, a
      008167 72 FB 06         [ 2]  352 	addw	x, (0x06, sp)
      00816A F6               [ 1]  353 	ld	a, (x)
      00816B 88               [ 1]  354 	push	a
      00816C CD 80 A8         [ 4]  355 	call	_write_spi
      00816F 84               [ 1]  356 	pop	a
                                    357 ;	joysticksend.c: 80: for (n = 0; n < len; ++n)
      008170 0C 01            [ 1]  358 	inc	(0x01, sp)
      008172 20 E9            [ 2]  359 	jra	00103$
      008174                        360 00101$:
                                    361 ;	joysticksend.c: 82: PC_ODR |= (1 << CSN);
      008174 AE 50 0A         [ 2]  362 	ldw	x, #0x500a
      008177 F6               [ 1]  363 	ld	a, (x)
      008178 AA 08            [ 1]  364 	or	a, #0x08
      00817A F7               [ 1]  365 	ld	(x), a
                                    366 ;	joysticksend.c: 83: return (ret);
      00817B 7B 02            [ 1]  367 	ld	a, (0x02, sp)
      00817D 5B 02            [ 2]  368 	addw	sp, #2
      00817F 81               [ 4]  369 	ret
                                    370 ;	joysticksend.c: 85: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    371 ;	-----------------------------------------
                                    372 ;	 function read_spi_buf
                                    373 ;	-----------------------------------------
      008180                        374 _read_spi_buf:
      008180 52 02            [ 2]  375 	sub	sp, #2
                                    376 ;	joysticksend.c: 87: PC_ODR &= ~(1 << CSN);
      008182 AE 50 0A         [ 2]  377 	ldw	x, #0x500a
      008185 F6               [ 1]  378 	ld	a, (x)
      008186 A4 F7            [ 1]  379 	and	a, #0xf7
      008188 F7               [ 1]  380 	ld	(x), a
                                    381 ;	joysticksend.c: 88: ret = write_spi (reg);
      008189 7B 05            [ 1]  382 	ld	a, (0x05, sp)
      00818B 88               [ 1]  383 	push	a
      00818C CD 80 A8         [ 4]  384 	call	_write_spi
      00818F 5B 01            [ 2]  385 	addw	sp, #1
      008191 6B 01            [ 1]  386 	ld	(0x01, sp), a
                                    387 ;	joysticksend.c: 89: for (n = 0; n < len; ++n)
      008193 0F 02            [ 1]  388 	clr	(0x02, sp)
      008195                        389 00103$:
      008195 7B 02            [ 1]  390 	ld	a, (0x02, sp)
      008197 11 08            [ 1]  391 	cp	a, (0x08, sp)
      008199 24 15            [ 1]  392 	jrnc	00101$
                                    393 ;	joysticksend.c: 90: array[n] = write_spi (NOP);
      00819B 5F               [ 1]  394 	clrw	x
      00819C 7B 02            [ 1]  395 	ld	a, (0x02, sp)
      00819E 97               [ 1]  396 	ld	xl, a
      00819F 72 FB 06         [ 2]  397 	addw	x, (0x06, sp)
      0081A2 89               [ 2]  398 	pushw	x
      0081A3 4B FF            [ 1]  399 	push	#0xff
      0081A5 CD 80 A8         [ 4]  400 	call	_write_spi
      0081A8 5B 01            [ 2]  401 	addw	sp, #1
      0081AA 85               [ 2]  402 	popw	x
      0081AB F7               [ 1]  403 	ld	(x), a
                                    404 ;	joysticksend.c: 89: for (n = 0; n < len; ++n)
      0081AC 0C 02            [ 1]  405 	inc	(0x02, sp)
      0081AE 20 E5            [ 2]  406 	jra	00103$
      0081B0                        407 00101$:
                                    408 ;	joysticksend.c: 91: PC_ODR |= (1 << CSN);
      0081B0 AE 50 0A         [ 2]  409 	ldw	x, #0x500a
      0081B3 F6               [ 1]  410 	ld	a, (x)
      0081B4 AA 08            [ 1]  411 	or	a, #0x08
      0081B6 F7               [ 1]  412 	ld	(x), a
                                    413 ;	joysticksend.c: 92: return (ret);
      0081B7 7B 01            [ 1]  414 	ld	a, (0x01, sp)
      0081B9 5B 02            [ 2]  415 	addw	sp, #2
      0081BB 81               [ 4]  416 	ret
                                    417 ;	joysticksend.c: 94: void InitializeSPI () {
                                    418 ;	-----------------------------------------
                                    419 ;	 function InitializeSPI
                                    420 ;	-----------------------------------------
      0081BC                        421 _InitializeSPI:
                                    422 ;	joysticksend.c: 95: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
      0081BC AE 52 00         [ 2]  423 	ldw	x, #0x5200
      0081BF A6 7C            [ 1]  424 	ld	a, #0x7c
      0081C1 F7               [ 1]  425 	ld	(x), a
                                    426 ;	joysticksend.c: 96: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
      0081C2 AE 52 01         [ 2]  427 	ldw	x, #0x5201
      0081C5 7F               [ 1]  428 	clr	(x)
                                    429 ;	joysticksend.c: 97: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
      0081C6 AE 52 02         [ 2]  430 	ldw	x, #0x5202
      0081C9 7F               [ 1]  431 	clr	(x)
                                    432 ;	joysticksend.c: 98: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
      0081CA AE 50 0C         [ 2]  433 	ldw	x, #0x500c
      0081CD A6 18            [ 1]  434 	ld	a, #0x18
      0081CF F7               [ 1]  435 	ld	(x), a
                                    436 ;	joysticksend.c: 99: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
      0081D0 AE 50 0D         [ 2]  437 	ldw	x, #0x500d
      0081D3 A6 18            [ 1]  438 	ld	a, #0x18
      0081D5 F7               [ 1]  439 	ld	(x), a
                                    440 ;	joysticksend.c: 100: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
      0081D6 AE 50 0E         [ 2]  441 	ldw	x, #0x500e
      0081D9 A6 18            [ 1]  442 	ld	a, #0x18
      0081DB F7               [ 1]  443 	ld	(x), a
                                    444 ;	joysticksend.c: 102: PC_ODR &= ~(1 << CE);
      0081DC AE 50 0A         [ 2]  445 	ldw	x, #0x500a
      0081DF F6               [ 1]  446 	ld	a, (x)
      0081E0 A4 EF            [ 1]  447 	and	a, #0xef
      0081E2 F7               [ 1]  448 	ld	(x), a
      0081E3 81               [ 4]  449 	ret
                                    450 ;	joysticksend.c: 104: void InitializeSystemClock() {
                                    451 ;	-----------------------------------------
                                    452 ;	 function InitializeSystemClock
                                    453 ;	-----------------------------------------
      0081E4                        454 _InitializeSystemClock:
                                    455 ;	joysticksend.c: 105: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0081E4 AE 50 C0         [ 2]  456 	ldw	x, #0x50c0
      0081E7 7F               [ 1]  457 	clr	(x)
                                    458 ;	joysticksend.c: 106: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0081E8 AE 50 C0         [ 2]  459 	ldw	x, #0x50c0
      0081EB A6 01            [ 1]  460 	ld	a, #0x01
      0081ED F7               [ 1]  461 	ld	(x), a
                                    462 ;	joysticksend.c: 107: CLK_ECKR = 0;                       //  Disable the external clock.
      0081EE AE 50 C1         [ 2]  463 	ldw	x, #0x50c1
      0081F1 7F               [ 1]  464 	clr	(x)
                                    465 ;	joysticksend.c: 108: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0081F2                        466 00101$:
      0081F2 AE 50 C0         [ 2]  467 	ldw	x, #0x50c0
      0081F5 F6               [ 1]  468 	ld	a, (x)
      0081F6 A5 02            [ 1]  469 	bcp	a, #0x02
      0081F8 27 F8            [ 1]  470 	jreq	00101$
                                    471 ;	joysticksend.c: 109: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0081FA AE 50 C6         [ 2]  472 	ldw	x, #0x50c6
      0081FD 7F               [ 1]  473 	clr	(x)
                                    474 ;	joysticksend.c: 110: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0081FE AE 50 C7         [ 2]  475 	ldw	x, #0x50c7
      008201 A6 FF            [ 1]  476 	ld	a, #0xff
      008203 F7               [ 1]  477 	ld	(x), a
                                    478 ;	joysticksend.c: 111: CLK_PCKENR2 = 0xff;                 //  Ditto.
      008204 AE 50 CA         [ 2]  479 	ldw	x, #0x50ca
      008207 A6 FF            [ 1]  480 	ld	a, #0xff
      008209 F7               [ 1]  481 	ld	(x), a
                                    482 ;	joysticksend.c: 112: CLK_CCOR = 0;                       //  Turn off CCO.
      00820A AE 50 C9         [ 2]  483 	ldw	x, #0x50c9
      00820D 7F               [ 1]  484 	clr	(x)
                                    485 ;	joysticksend.c: 113: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      00820E AE 50 CC         [ 2]  486 	ldw	x, #0x50cc
      008211 7F               [ 1]  487 	clr	(x)
                                    488 ;	joysticksend.c: 114: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      008212 AE 50 CD         [ 2]  489 	ldw	x, #0x50cd
      008215 7F               [ 1]  490 	clr	(x)
                                    491 ;	joysticksend.c: 115: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      008216 AE 50 C4         [ 2]  492 	ldw	x, #0x50c4
      008219 A6 E1            [ 1]  493 	ld	a, #0xe1
      00821B F7               [ 1]  494 	ld	(x), a
                                    495 ;	joysticksend.c: 116: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      00821C AE 50 C5         [ 2]  496 	ldw	x, #0x50c5
      00821F 7F               [ 1]  497 	clr	(x)
                                    498 ;	joysticksend.c: 117: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      008220 AE 50 C5         [ 2]  499 	ldw	x, #0x50c5
      008223 A6 02            [ 1]  500 	ld	a, #0x02
      008225 F7               [ 1]  501 	ld	(x), a
                                    502 ;	joysticksend.c: 118: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      008226                        503 00104$:
      008226 AE 50 C5         [ 2]  504 	ldw	x, #0x50c5
      008229 F6               [ 1]  505 	ld	a, (x)
      00822A 44               [ 1]  506 	srl	a
      00822B 25 F9            [ 1]  507 	jrc	00104$
      00822D 81               [ 4]  508 	ret
                                    509 ;	joysticksend.c: 120: void delay (int time_ms) {
                                    510 ;	-----------------------------------------
                                    511 ;	 function delay
                                    512 ;	-----------------------------------------
      00822E                        513 _delay:
      00822E 52 0A            [ 2]  514 	sub	sp, #10
                                    515 ;	joysticksend.c: 122: for (x = 0; x < 1036*time_ms; ++x)
      008230 5F               [ 1]  516 	clrw	x
      008231 1F 03            [ 2]  517 	ldw	(0x03, sp), x
      008233 1F 01            [ 2]  518 	ldw	(0x01, sp), x
      008235 1E 0D            [ 2]  519 	ldw	x, (0x0d, sp)
      008237 89               [ 2]  520 	pushw	x
      008238 4B 0C            [ 1]  521 	push	#0x0c
      00823A 4B 04            [ 1]  522 	push	#0x04
      00823C CD 87 F6         [ 4]  523 	call	__mulint
      00823F 5B 04            [ 2]  524 	addw	sp, #4
      008241 1F 05            [ 2]  525 	ldw	(0x05, sp), x
      008243                        526 00103$:
      008243 16 05            [ 2]  527 	ldw	y, (0x05, sp)
      008245 17 09            [ 2]  528 	ldw	(0x09, sp), y
      008247 7B 09            [ 1]  529 	ld	a, (0x09, sp)
      008249 49               [ 1]  530 	rlc	a
      00824A 4F               [ 1]  531 	clr	a
      00824B A2 00            [ 1]  532 	sbc	a, #0x00
      00824D 6B 08            [ 1]  533 	ld	(0x08, sp), a
      00824F 6B 07            [ 1]  534 	ld	(0x07, sp), a
      008251 1E 03            [ 2]  535 	ldw	x, (0x03, sp)
      008253 13 09            [ 2]  536 	cpw	x, (0x09, sp)
      008255 7B 02            [ 1]  537 	ld	a, (0x02, sp)
      008257 12 08            [ 1]  538 	sbc	a, (0x08, sp)
      008259 7B 01            [ 1]  539 	ld	a, (0x01, sp)
      00825B 12 07            [ 1]  540 	sbc	a, (0x07, sp)
      00825D 2E 17            [ 1]  541 	jrsge	00105$
                                    542 ;	joysticksend.c: 123: __asm__("nop");
      00825F 9D               [ 1]  543 	nop
                                    544 ;	joysticksend.c: 122: for (x = 0; x < 1036*time_ms; ++x)
      008260 16 03            [ 2]  545 	ldw	y, (0x03, sp)
      008262 72 A9 00 01      [ 2]  546 	addw	y, #0x0001
      008266 7B 02            [ 1]  547 	ld	a, (0x02, sp)
      008268 A9 00            [ 1]  548 	adc	a, #0x00
      00826A 97               [ 1]  549 	ld	xl, a
      00826B 7B 01            [ 1]  550 	ld	a, (0x01, sp)
      00826D A9 00            [ 1]  551 	adc	a, #0x00
      00826F 95               [ 1]  552 	ld	xh, a
      008270 17 03            [ 2]  553 	ldw	(0x03, sp), y
      008272 1F 01            [ 2]  554 	ldw	(0x01, sp), x
      008274 20 CD            [ 2]  555 	jra	00103$
      008276                        556 00105$:
      008276 5B 0A            [ 2]  557 	addw	sp, #10
      008278 81               [ 4]  558 	ret
                                    559 ;	joysticksend.c: 197: void init_io(void)
                                    560 ;	-----------------------------------------
                                    561 ;	 function init_io
                                    562 ;	-----------------------------------------
      008279                        563 _init_io:
                                    564 ;	joysticksend.c: 206: PC_ODR &= ~(1 << CE);
      008279 AE 50 0A         [ 2]  565 	ldw	x, #0x500a
      00827C F6               [ 1]  566 	ld	a, (x)
      00827D A4 EF            [ 1]  567 	and	a, #0xef
      00827F F7               [ 1]  568 	ld	(x), a
                                    569 ;	joysticksend.c: 208: PC_ODR |= (1 << CSN);
      008280 AE 50 0A         [ 2]  570 	ldw	x, #0x500a
      008283 F6               [ 1]  571 	ld	a, (x)
      008284 AA 08            [ 1]  572 	or	a, #0x08
      008286 F7               [ 1]  573 	ld	(x), a
      008287 81               [ 4]  574 	ret
                                    575 ;	joysticksend.c: 214: void rf_switch_bank(unsigned char bankindex)
                                    576 ;	-----------------------------------------
                                    577 ;	 function rf_switch_bank
                                    578 ;	-----------------------------------------
      008288                        579 _rf_switch_bank:
      008288 88               [ 1]  580 	push	a
                                    581 ;	joysticksend.c: 217: temp1 = bankindex;
      008289 7B 04            [ 1]  582 	ld	a, (0x04, sp)
      00828B 6B 01            [ 1]  583 	ld	(0x01, sp), a
                                    584 ;	joysticksend.c: 219: temp0 = write_spi(iRF_BANK0_STATUS);
      00828D 4B 07            [ 1]  585 	push	#0x07
      00828F CD 80 A8         [ 4]  586 	call	_write_spi
      008292 5B 01            [ 2]  587 	addw	sp, #1
                                    588 ;	joysticksend.c: 221: if((temp0&0x80)!=temp1)
      008294 A4 80            [ 1]  589 	and	a, #0x80
      008296 11 01            [ 1]  590 	cp	a, (0x01, sp)
      008298 27 09            [ 1]  591 	jreq	00103$
                                    592 ;	joysticksend.c: 223: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
      00829A 4B 53            [ 1]  593 	push	#0x53
      00829C 4B 50            [ 1]  594 	push	#0x50
      00829E CD 80 CE         [ 4]  595 	call	_write_spi_reg
      0082A1 5B 02            [ 2]  596 	addw	sp, #2
      0082A3                        597 00103$:
      0082A3 84               [ 1]  598 	pop	a
      0082A4 81               [ 4]  599 	ret
                                    600 ;	joysticksend.c: 230: void SE8R01_Calibration()
                                    601 ;	-----------------------------------------
                                    602 ;	 function SE8R01_Calibration
                                    603 ;	-----------------------------------------
      0082A5                        604 _SE8R01_Calibration:
      0082A5 52 0D            [ 2]  605 	sub	sp, #13
                                    606 ;	joysticksend.c: 233: rf_switch_bank(iBANK0);
      0082A7 4B 00            [ 1]  607 	push	#0x00
      0082A9 CD 82 88         [ 4]  608 	call	_rf_switch_bank
      0082AC 84               [ 1]  609 	pop	a
                                    610 ;	joysticksend.c: 234: temp[0]=0x03;
      0082AD 96               [ 1]  611 	ldw	x, sp
      0082AE 5C               [ 2]  612 	incw	x
      0082AF 1F 0C            [ 2]  613 	ldw	(0x0c, sp), x
      0082B1 1E 0C            [ 2]  614 	ldw	x, (0x0c, sp)
      0082B3 A6 03            [ 1]  615 	ld	a, #0x03
      0082B5 F7               [ 1]  616 	ld	(x), a
                                    617 ;	joysticksend.c: 235: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
      0082B6 1E 0C            [ 2]  618 	ldw	x, (0x0c, sp)
      0082B8 4B 01            [ 1]  619 	push	#0x01
      0082BA 89               [ 2]  620 	pushw	x
      0082BB 4B 20            [ 1]  621 	push	#0x20
      0082BD CD 81 48         [ 4]  622 	call	_write_spi_buf
      0082C0 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	joysticksend.c: 237: temp[0]=0x32;
      0082C2 1E 0C            [ 2]  625 	ldw	x, (0x0c, sp)
      0082C4 A6 32            [ 1]  626 	ld	a, #0x32
      0082C6 F7               [ 1]  627 	ld	(x), a
                                    628 ;	joysticksend.c: 239: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
      0082C7 1E 0C            [ 2]  629 	ldw	x, (0x0c, sp)
      0082C9 4B 01            [ 1]  630 	push	#0x01
      0082CB 89               [ 2]  631 	pushw	x
      0082CC 4B 25            [ 1]  632 	push	#0x25
      0082CE CD 81 48         [ 4]  633 	call	_write_spi_buf
      0082D1 5B 04            [ 2]  634 	addw	sp, #4
                                    635 ;	joysticksend.c: 243: if (SE8R01_DR_2M==1)
      0082D3 CE 00 10         [ 2]  636 	ldw	x, _SE8R01_DR_2M+0
      0082D6 A3 00 01         [ 2]  637 	cpw	x, #0x0001
      0082D9 26 07            [ 1]  638 	jrne	00105$
                                    639 ;	joysticksend.c: 244: {temp[0]=0x48;}
      0082DB 1E 0C            [ 2]  640 	ldw	x, (0x0c, sp)
      0082DD A6 48            [ 1]  641 	ld	a, #0x48
      0082DF F7               [ 1]  642 	ld	(x), a
      0082E0 20 14            [ 2]  643 	jra	00106$
      0082E2                        644 00105$:
                                    645 ;	joysticksend.c: 245: else if (SE8R01_DR_1M==1)
      0082E2 CE 00 12         [ 2]  646 	ldw	x, _SE8R01_DR_1M+0
      0082E5 A3 00 01         [ 2]  647 	cpw	x, #0x0001
      0082E8 26 07            [ 1]  648 	jrne	00102$
                                    649 ;	joysticksend.c: 246: {temp[0]=0x40;}
      0082EA 1E 0C            [ 2]  650 	ldw	x, (0x0c, sp)
      0082EC A6 40            [ 1]  651 	ld	a, #0x40
      0082EE F7               [ 1]  652 	ld	(x), a
      0082EF 20 05            [ 2]  653 	jra	00106$
      0082F1                        654 00102$:
                                    655 ;	joysticksend.c: 248: {temp[0]=0x68;}   
      0082F1 1E 0C            [ 2]  656 	ldw	x, (0x0c, sp)
      0082F3 A6 68            [ 1]  657 	ld	a, #0x68
      0082F5 F7               [ 1]  658 	ld	(x), a
      0082F6                        659 00106$:
                                    660 ;	joysticksend.c: 250: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0082F6 1E 0C            [ 2]  661 	ldw	x, (0x0c, sp)
      0082F8 4B 01            [ 1]  662 	push	#0x01
      0082FA 89               [ 2]  663 	pushw	x
      0082FB 4B 26            [ 1]  664 	push	#0x26
      0082FD CD 81 48         [ 4]  665 	call	_write_spi_buf
      008300 5B 04            [ 2]  666 	addw	sp, #4
                                    667 ;	joysticksend.c: 251: temp[0]=0x77;
      008302 1E 0C            [ 2]  668 	ldw	x, (0x0c, sp)
      008304 A6 77            [ 1]  669 	ld	a, #0x77
      008306 F7               [ 1]  670 	ld	(x), a
                                    671 ;	joysticksend.c: 252: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
      008307 1E 0C            [ 2]  672 	ldw	x, (0x0c, sp)
      008309 4B 01            [ 1]  673 	push	#0x01
      00830B 89               [ 2]  674 	pushw	x
      00830C 4B 3F            [ 1]  675 	push	#0x3f
      00830E CD 81 48         [ 4]  676 	call	_write_spi_buf
      008311 5B 04            [ 2]  677 	addw	sp, #4
                                    678 ;	joysticksend.c: 254: rf_switch_bank(iBANK1);
      008313 4B 80            [ 1]  679 	push	#0x80
      008315 CD 82 88         [ 4]  680 	call	_rf_switch_bank
      008318 84               [ 1]  681 	pop	a
                                    682 ;	joysticksend.c: 255: temp[0]=0x40;
      008319 1E 0C            [ 2]  683 	ldw	x, (0x0c, sp)
      00831B A6 40            [ 1]  684 	ld	a, #0x40
      00831D F7               [ 1]  685 	ld	(x), a
                                    686 ;	joysticksend.c: 256: temp[1]=0x00;
      00831E 1E 0C            [ 2]  687 	ldw	x, (0x0c, sp)
      008320 5C               [ 2]  688 	incw	x
      008321 1F 0A            [ 2]  689 	ldw	(0x0a, sp), x
      008323 1E 0A            [ 2]  690 	ldw	x, (0x0a, sp)
      008325 7F               [ 1]  691 	clr	(x)
                                    692 ;	joysticksend.c: 257: temp[2]=0x10;
      008326 1E 0C            [ 2]  693 	ldw	x, (0x0c, sp)
      008328 5C               [ 2]  694 	incw	x
      008329 5C               [ 2]  695 	incw	x
      00832A 1F 08            [ 2]  696 	ldw	(0x08, sp), x
      00832C 1E 08            [ 2]  697 	ldw	x, (0x08, sp)
      00832E A6 10            [ 1]  698 	ld	a, #0x10
      008330 F7               [ 1]  699 	ld	(x), a
                                    700 ;	joysticksend.c: 259: {temp[3]=0xE6;}
      008331 1E 0C            [ 2]  701 	ldw	x, (0x0c, sp)
      008333 1C 00 03         [ 2]  702 	addw	x, #0x0003
      008336 1F 06            [ 2]  703 	ldw	(0x06, sp), x
                                    704 ;	joysticksend.c: 258: if (SE8R01_DR_2M==1)
      008338 CE 00 10         [ 2]  705 	ldw	x, _SE8R01_DR_2M+0
      00833B A3 00 01         [ 2]  706 	cpw	x, #0x0001
      00833E 26 07            [ 1]  707 	jrne	00108$
                                    708 ;	joysticksend.c: 259: {temp[3]=0xE6;}
      008340 1E 06            [ 2]  709 	ldw	x, (0x06, sp)
      008342 A6 E6            [ 1]  710 	ld	a, #0xe6
      008344 F7               [ 1]  711 	ld	(x), a
      008345 20 05            [ 2]  712 	jra	00109$
      008347                        713 00108$:
                                    714 ;	joysticksend.c: 261: {temp[3]=0xE4;}
      008347 1E 06            [ 2]  715 	ldw	x, (0x06, sp)
      008349 A6 E4            [ 1]  716 	ld	a, #0xe4
      00834B F7               [ 1]  717 	ld	(x), a
      00834C                        718 00109$:
                                    719 ;	joysticksend.c: 263: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
      00834C 1E 0C            [ 2]  720 	ldw	x, (0x0c, sp)
      00834E 4B 04            [ 1]  721 	push	#0x04
      008350 89               [ 2]  722 	pushw	x
      008351 4B 21            [ 1]  723 	push	#0x21
      008353 CD 81 48         [ 4]  724 	call	_write_spi_buf
      008356 5B 04            [ 2]  725 	addw	sp, #4
                                    726 ;	joysticksend.c: 265: temp[0]=0x20;
      008358 1E 0C            [ 2]  727 	ldw	x, (0x0c, sp)
      00835A A6 20            [ 1]  728 	ld	a, #0x20
      00835C F7               [ 1]  729 	ld	(x), a
                                    730 ;	joysticksend.c: 266: temp[1]=0x08;
      00835D 1E 0A            [ 2]  731 	ldw	x, (0x0a, sp)
      00835F A6 08            [ 1]  732 	ld	a, #0x08
      008361 F7               [ 1]  733 	ld	(x), a
                                    734 ;	joysticksend.c: 267: temp[2]=0x50;
      008362 1E 08            [ 2]  735 	ldw	x, (0x08, sp)
      008364 A6 50            [ 1]  736 	ld	a, #0x50
      008366 F7               [ 1]  737 	ld	(x), a
                                    738 ;	joysticksend.c: 268: temp[3]=0x40;
      008367 1E 06            [ 2]  739 	ldw	x, (0x06, sp)
      008369 A6 40            [ 1]  740 	ld	a, #0x40
      00836B F7               [ 1]  741 	ld	(x), a
                                    742 ;	joysticksend.c: 269: temp[4]=0x50;
      00836C 1E 0C            [ 2]  743 	ldw	x, (0x0c, sp)
      00836E A6 50            [ 1]  744 	ld	a, #0x50
      008370 E7 04            [ 1]  745 	ld	(0x0004, x), a
                                    746 ;	joysticksend.c: 270: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
      008372 1E 0C            [ 2]  747 	ldw	x, (0x0c, sp)
      008374 4B 05            [ 1]  748 	push	#0x05
      008376 89               [ 2]  749 	pushw	x
      008377 4B 23            [ 1]  750 	push	#0x23
      008379 CD 81 48         [ 4]  751 	call	_write_spi_buf
      00837C 5B 04            [ 2]  752 	addw	sp, #4
                                    753 ;	joysticksend.c: 272: temp[0]=0x00;
      00837E 1E 0C            [ 2]  754 	ldw	x, (0x0c, sp)
      008380 7F               [ 1]  755 	clr	(x)
                                    756 ;	joysticksend.c: 273: temp[1]=0x00;
      008381 1E 0A            [ 2]  757 	ldw	x, (0x0a, sp)
      008383 7F               [ 1]  758 	clr	(x)
                                    759 ;	joysticksend.c: 274: if (SE8R01_DR_2M==1)
      008384 CE 00 10         [ 2]  760 	ldw	x, _SE8R01_DR_2M+0
      008387 A3 00 01         [ 2]  761 	cpw	x, #0x0001
      00838A 26 07            [ 1]  762 	jrne	00111$
                                    763 ;	joysticksend.c: 275: { temp[2]=0x1E;}
      00838C 1E 08            [ 2]  764 	ldw	x, (0x08, sp)
      00838E A6 1E            [ 1]  765 	ld	a, #0x1e
      008390 F7               [ 1]  766 	ld	(x), a
      008391 20 05            [ 2]  767 	jra	00112$
      008393                        768 00111$:
                                    769 ;	joysticksend.c: 277: { temp[2]=0x1F;}
      008393 1E 08            [ 2]  770 	ldw	x, (0x08, sp)
      008395 A6 1F            [ 1]  771 	ld	a, #0x1f
      008397 F7               [ 1]  772 	ld	(x), a
      008398                        773 00112$:
                                    774 ;	joysticksend.c: 279: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
      008398 1E 0C            [ 2]  775 	ldw	x, (0x0c, sp)
      00839A 4B 03            [ 1]  776 	push	#0x03
      00839C 89               [ 2]  777 	pushw	x
      00839D 4B 2A            [ 1]  778 	push	#0x2a
      00839F CD 81 48         [ 4]  779 	call	_write_spi_buf
      0083A2 5B 04            [ 2]  780 	addw	sp, #4
                                    781 ;	joysticksend.c: 281: if (SE8R01_DR_2M==1)
      0083A4 CE 00 10         [ 2]  782 	ldw	x, _SE8R01_DR_2M+0
      0083A7 A3 00 01         [ 2]  783 	cpw	x, #0x0001
      0083AA 26 07            [ 1]  784 	jrne	00114$
                                    785 ;	joysticksend.c: 282: { temp[0]=0x29;}
      0083AC 1E 0C            [ 2]  786 	ldw	x, (0x0c, sp)
      0083AE A6 29            [ 1]  787 	ld	a, #0x29
      0083B0 F7               [ 1]  788 	ld	(x), a
      0083B1 20 05            [ 2]  789 	jra	00115$
      0083B3                        790 00114$:
                                    791 ;	joysticksend.c: 284: { temp[0]=0x14;}
      0083B3 1E 0C            [ 2]  792 	ldw	x, (0x0c, sp)
      0083B5 A6 14            [ 1]  793 	ld	a, #0x14
      0083B7 F7               [ 1]  794 	ld	(x), a
      0083B8                        795 00115$:
                                    796 ;	joysticksend.c: 286: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
      0083B8 1E 0C            [ 2]  797 	ldw	x, (0x0c, sp)
      0083BA 4B 01            [ 1]  798 	push	#0x01
      0083BC 89               [ 2]  799 	pushw	x
      0083BD 4B 2C            [ 1]  800 	push	#0x2c
      0083BF CD 81 48         [ 4]  801 	call	_write_spi_buf
      0083C2 5B 04            [ 2]  802 	addw	sp, #4
                                    803 ;	joysticksend.c: 288: temp[0]=0x00;
      0083C4 1E 0C            [ 2]  804 	ldw	x, (0x0c, sp)
      0083C6 7F               [ 1]  805 	clr	(x)
                                    806 ;	joysticksend.c: 289: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
      0083C7 1E 0C            [ 2]  807 	ldw	x, (0x0c, sp)
      0083C9 4B 01            [ 1]  808 	push	#0x01
      0083CB 89               [ 2]  809 	pushw	x
      0083CC 4B 37            [ 1]  810 	push	#0x37
      0083CE CD 81 48         [ 4]  811 	call	_write_spi_buf
      0083D1 5B 04            [ 2]  812 	addw	sp, #4
                                    813 ;	joysticksend.c: 291: temp[0]=0x7F;
      0083D3 1E 0C            [ 2]  814 	ldw	x, (0x0c, sp)
      0083D5 A6 7F            [ 1]  815 	ld	a, #0x7f
      0083D7 F7               [ 1]  816 	ld	(x), a
                                    817 ;	joysticksend.c: 292: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
      0083D8 1E 0C            [ 2]  818 	ldw	x, (0x0c, sp)
      0083DA 4B 01            [ 1]  819 	push	#0x01
      0083DC 89               [ 2]  820 	pushw	x
      0083DD 4B 38            [ 1]  821 	push	#0x38
      0083DF CD 81 48         [ 4]  822 	call	_write_spi_buf
      0083E2 5B 04            [ 2]  823 	addw	sp, #4
                                    824 ;	joysticksend.c: 294: temp[0]=0x02;
      0083E4 1E 0C            [ 2]  825 	ldw	x, (0x0c, sp)
      0083E6 A6 02            [ 1]  826 	ld	a, #0x02
      0083E8 F7               [ 1]  827 	ld	(x), a
                                    828 ;	joysticksend.c: 295: temp[1]=0xC1;
      0083E9 1E 0A            [ 2]  829 	ldw	x, (0x0a, sp)
      0083EB A6 C1            [ 1]  830 	ld	a, #0xc1
      0083ED F7               [ 1]  831 	ld	(x), a
                                    832 ;	joysticksend.c: 296: temp[2]=0xEB;            
      0083EE 1E 08            [ 2]  833 	ldw	x, (0x08, sp)
      0083F0 A6 EB            [ 1]  834 	ld	a, #0xeb
      0083F2 F7               [ 1]  835 	ld	(x), a
                                    836 ;	joysticksend.c: 297: temp[3]=0x1C;
      0083F3 1E 06            [ 2]  837 	ldw	x, (0x06, sp)
      0083F5 A6 1C            [ 1]  838 	ld	a, #0x1c
      0083F7 F7               [ 1]  839 	ld	(x), a
                                    840 ;	joysticksend.c: 298: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      0083F8 1E 0C            [ 2]  841 	ldw	x, (0x0c, sp)
      0083FA 4B 04            [ 1]  842 	push	#0x04
      0083FC 89               [ 2]  843 	pushw	x
      0083FD 4B 3D            [ 1]  844 	push	#0x3d
      0083FF CD 81 48         [ 4]  845 	call	_write_spi_buf
      008402 5B 04            [ 2]  846 	addw	sp, #4
                                    847 ;	joysticksend.c: 300: temp[0]=0x97;
      008404 1E 0C            [ 2]  848 	ldw	x, (0x0c, sp)
      008406 A6 97            [ 1]  849 	ld	a, #0x97
      008408 F7               [ 1]  850 	ld	(x), a
                                    851 ;	joysticksend.c: 301: temp[1]=0x64;
      008409 1E 0A            [ 2]  852 	ldw	x, (0x0a, sp)
      00840B A6 64            [ 1]  853 	ld	a, #0x64
      00840D F7               [ 1]  854 	ld	(x), a
                                    855 ;	joysticksend.c: 302: temp[2]=0x00;
      00840E 1E 08            [ 2]  856 	ldw	x, (0x08, sp)
      008410 7F               [ 1]  857 	clr	(x)
                                    858 ;	joysticksend.c: 303: temp[3]=0x81;
      008411 1E 06            [ 2]  859 	ldw	x, (0x06, sp)
      008413 A6 81            [ 1]  860 	ld	a, #0x81
      008415 F7               [ 1]  861 	ld	(x), a
                                    862 ;	joysticksend.c: 304: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
      008416 1E 0C            [ 2]  863 	ldw	x, (0x0c, sp)
      008418 4B 04            [ 1]  864 	push	#0x04
      00841A 89               [ 2]  865 	pushw	x
      00841B 4B 3E            [ 1]  866 	push	#0x3e
      00841D CD 81 48         [ 4]  867 	call	_write_spi_buf
      008420 5B 04            [ 2]  868 	addw	sp, #4
                                    869 ;	joysticksend.c: 305: rf_switch_bank(iBANK0);
      008422 4B 00            [ 1]  870 	push	#0x00
      008424 CD 82 88         [ 4]  871 	call	_rf_switch_bank
      008427 84               [ 1]  872 	pop	a
                                    873 ;	joysticksend.c: 310: delayTenMicro();
      008428 CD 80 A0         [ 4]  874 	call	_delayTenMicro
                                    875 ;	joysticksend.c: 311: PC_ODR |= (1 << CE);
      00842B AE 50 0A         [ 2]  876 	ldw	x, #0x500a
      00842E F6               [ 1]  877 	ld	a, (x)
      00842F AA 10            [ 1]  878 	or	a, #0x10
      008431 F7               [ 1]  879 	ld	(x), a
                                    880 ;	joysticksend.c: 312: delayTenMicro();
      008432 CD 80 A0         [ 4]  881 	call	_delayTenMicro
                                    882 ;	joysticksend.c: 313: delayTenMicro();
      008435 CD 80 A0         [ 4]  883 	call	_delayTenMicro
                                    884 ;	joysticksend.c: 314: delayTenMicro();
      008438 CD 80 A0         [ 4]  885 	call	_delayTenMicro
                                    886 ;	joysticksend.c: 315: PC_ODR &= ~(1 << CE);
      00843B AE 50 0A         [ 2]  887 	ldw	x, #0x500a
      00843E F6               [ 1]  888 	ld	a, (x)
      00843F A4 EF            [ 1]  889 	and	a, #0xef
      008441 F7               [ 1]  890 	ld	(x), a
                                    891 ;	joysticksend.c: 316: delay(50);                            // delay 50ms waitting for calibaration.
      008442 4B 32            [ 1]  892 	push	#0x32
      008444 4B 00            [ 1]  893 	push	#0x00
      008446 CD 82 2E         [ 4]  894 	call	_delay
      008449 5B 02            [ 2]  895 	addw	sp, #2
                                    896 ;	joysticksend.c: 321: delayTenMicro();
      00844B CD 80 A0         [ 4]  897 	call	_delayTenMicro
                                    898 ;	joysticksend.c: 322: PC_ODR |= (1 << CE);
      00844E AE 50 0A         [ 2]  899 	ldw	x, #0x500a
      008451 F6               [ 1]  900 	ld	a, (x)
      008452 AA 10            [ 1]  901 	or	a, #0x10
      008454 F7               [ 1]  902 	ld	(x), a
                                    903 ;	joysticksend.c: 323: delayTenMicro();
      008455 CD 80 A0         [ 4]  904 	call	_delayTenMicro
                                    905 ;	joysticksend.c: 324: delayTenMicro();
      008458 CD 80 A0         [ 4]  906 	call	_delayTenMicro
                                    907 ;	joysticksend.c: 325: delayTenMicro();
      00845B CD 80 A0         [ 4]  908 	call	_delayTenMicro
                                    909 ;	joysticksend.c: 326: PC_ODR &= ~(1 << CE);
      00845E AE 50 0A         [ 2]  910 	ldw	x, #0x500a
      008461 F6               [ 1]  911 	ld	a, (x)
      008462 A4 EF            [ 1]  912 	and	a, #0xef
      008464 F7               [ 1]  913 	ld	(x), a
                                    914 ;	joysticksend.c: 327: delay(50);                            // delay 50ms waitting for calibaration.
      008465 4B 32            [ 1]  915 	push	#0x32
      008467 4B 00            [ 1]  916 	push	#0x00
      008469 CD 82 2E         [ 4]  917 	call	_delay
      00846C 5B 02            [ 2]  918 	addw	sp, #2
      00846E 5B 0D            [ 2]  919 	addw	sp, #13
      008470 81               [ 4]  920 	ret
                                    921 ;	joysticksend.c: 331: void SE8R01_Analog_Init()           //SE8R01 初始化
                                    922 ;	-----------------------------------------
                                    923 ;	 function SE8R01_Analog_Init
                                    924 ;	-----------------------------------------
      008471                        925 _SE8R01_Analog_Init:
      008471 52 15            [ 2]  926 	sub	sp, #21
                                    927 ;	joysticksend.c: 336: gtemp[0]=0x28;
      008473 AE 00 01         [ 2]  928 	ldw	x, #_gtemp+0
      008476 1F 14            [ 2]  929 	ldw	(0x14, sp), x
      008478 1E 14            [ 2]  930 	ldw	x, (0x14, sp)
      00847A A6 28            [ 1]  931 	ld	a, #0x28
      00847C F7               [ 1]  932 	ld	(x), a
                                    933 ;	joysticksend.c: 337: gtemp[1]=0x32;
      00847D 1E 14            [ 2]  934 	ldw	x, (0x14, sp)
      00847F 5C               [ 2]  935 	incw	x
      008480 1F 12            [ 2]  936 	ldw	(0x12, sp), x
      008482 1E 12            [ 2]  937 	ldw	x, (0x12, sp)
      008484 A6 32            [ 1]  938 	ld	a, #0x32
      008486 F7               [ 1]  939 	ld	(x), a
                                    940 ;	joysticksend.c: 338: gtemp[2]=0x80;
      008487 1E 14            [ 2]  941 	ldw	x, (0x14, sp)
      008489 5C               [ 2]  942 	incw	x
      00848A 5C               [ 2]  943 	incw	x
      00848B 1F 10            [ 2]  944 	ldw	(0x10, sp), x
      00848D 1E 10            [ 2]  945 	ldw	x, (0x10, sp)
      00848F A6 80            [ 1]  946 	ld	a, #0x80
      008491 F7               [ 1]  947 	ld	(x), a
                                    948 ;	joysticksend.c: 339: gtemp[3]=0x90;
      008492 1E 14            [ 2]  949 	ldw	x, (0x14, sp)
      008494 1C 00 03         [ 2]  950 	addw	x, #0x0003
      008497 1F 0E            [ 2]  951 	ldw	(0x0e, sp), x
      008499 1E 0E            [ 2]  952 	ldw	x, (0x0e, sp)
      00849B A6 90            [ 1]  953 	ld	a, #0x90
      00849D F7               [ 1]  954 	ld	(x), a
                                    955 ;	joysticksend.c: 340: gtemp[4]=0x00;
      00849E 1E 14            [ 2]  956 	ldw	x, (0x14, sp)
      0084A0 1C 00 04         [ 2]  957 	addw	x, #0x0004
      0084A3 7F               [ 1]  958 	clr	(x)
                                    959 ;	joysticksend.c: 341: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
      0084A4 1E 14            [ 2]  960 	ldw	x, (0x14, sp)
      0084A6 4B 05            [ 1]  961 	push	#0x05
      0084A8 89               [ 2]  962 	pushw	x
      0084A9 4B 3E            [ 1]  963 	push	#0x3e
      0084AB CD 81 48         [ 4]  964 	call	_write_spi_buf
      0084AE 5B 04            [ 2]  965 	addw	sp, #4
                                    966 ;	joysticksend.c: 342: delay(2);
      0084B0 4B 02            [ 1]  967 	push	#0x02
      0084B2 4B 00            [ 1]  968 	push	#0x00
      0084B4 CD 82 2E         [ 4]  969 	call	_delay
      0084B7 5B 02            [ 2]  970 	addw	sp, #2
                                    971 ;	joysticksend.c: 345: rf_switch_bank(iBANK1);
      0084B9 4B 80            [ 1]  972 	push	#0x80
      0084BB CD 82 88         [ 4]  973 	call	_rf_switch_bank
      0084BE 84               [ 1]  974 	pop	a
                                    975 ;	joysticksend.c: 347: temp[0]=0x40;
      0084BF 96               [ 1]  976 	ldw	x, sp
      0084C0 5C               [ 2]  977 	incw	x
      0084C1 1F 0C            [ 2]  978 	ldw	(0x0c, sp), x
      0084C3 1E 0C            [ 2]  979 	ldw	x, (0x0c, sp)
      0084C5 A6 40            [ 1]  980 	ld	a, #0x40
      0084C7 F7               [ 1]  981 	ld	(x), a
                                    982 ;	joysticksend.c: 348: temp[1]=0x01;               
      0084C8 1E 0C            [ 2]  983 	ldw	x, (0x0c, sp)
      0084CA 5C               [ 2]  984 	incw	x
      0084CB 1F 0A            [ 2]  985 	ldw	(0x0a, sp), x
      0084CD 1E 0A            [ 2]  986 	ldw	x, (0x0a, sp)
      0084CF A6 01            [ 1]  987 	ld	a, #0x01
      0084D1 F7               [ 1]  988 	ld	(x), a
                                    989 ;	joysticksend.c: 349: temp[2]=0x30;               
      0084D2 1E 0C            [ 2]  990 	ldw	x, (0x0c, sp)
      0084D4 5C               [ 2]  991 	incw	x
      0084D5 5C               [ 2]  992 	incw	x
      0084D6 1F 08            [ 2]  993 	ldw	(0x08, sp), x
      0084D8 1E 08            [ 2]  994 	ldw	x, (0x08, sp)
      0084DA A6 30            [ 1]  995 	ld	a, #0x30
      0084DC F7               [ 1]  996 	ld	(x), a
                                    997 ;	joysticksend.c: 351: { temp[3]=0xE2; }              
      0084DD 1E 0C            [ 2]  998 	ldw	x, (0x0c, sp)
      0084DF 1C 00 03         [ 2]  999 	addw	x, #0x0003
      0084E2 1F 06            [ 2] 1000 	ldw	(0x06, sp), x
                                   1001 ;	joysticksend.c: 350: if (SE8R01_DR_2M==1)
      0084E4 CE 00 10         [ 2] 1002 	ldw	x, _SE8R01_DR_2M+0
      0084E7 A3 00 01         [ 2] 1003 	cpw	x, #0x0001
      0084EA 26 07            [ 1] 1004 	jrne	00102$
                                   1005 ;	joysticksend.c: 351: { temp[3]=0xE2; }              
      0084EC 1E 06            [ 2] 1006 	ldw	x, (0x06, sp)
      0084EE A6 E2            [ 1] 1007 	ld	a, #0xe2
      0084F0 F7               [ 1] 1008 	ld	(x), a
      0084F1 20 05            [ 2] 1009 	jra	00103$
      0084F3                       1010 00102$:
                                   1011 ;	joysticksend.c: 353: { temp[3]=0xE0;}
      0084F3 1E 06            [ 2] 1012 	ldw	x, (0x06, sp)
      0084F5 A6 E0            [ 1] 1013 	ld	a, #0xe0
      0084F7 F7               [ 1] 1014 	ld	(x), a
      0084F8                       1015 00103$:
                                   1016 ;	joysticksend.c: 355: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
      0084F8 1E 0C            [ 2] 1017 	ldw	x, (0x0c, sp)
      0084FA 4B 04            [ 1] 1018 	push	#0x04
      0084FC 89               [ 2] 1019 	pushw	x
      0084FD 4B 21            [ 1] 1020 	push	#0x21
      0084FF CD 81 48         [ 4] 1021 	call	_write_spi_buf
      008502 5B 04            [ 2] 1022 	addw	sp, #4
                                   1023 ;	joysticksend.c: 357: temp[0]=0x29;
      008504 1E 0C            [ 2] 1024 	ldw	x, (0x0c, sp)
      008506 A6 29            [ 1] 1025 	ld	a, #0x29
      008508 F7               [ 1] 1026 	ld	(x), a
                                   1027 ;	joysticksend.c: 358: temp[1]=0x89;
      008509 1E 0A            [ 2] 1028 	ldw	x, (0x0a, sp)
      00850B A6 89            [ 1] 1029 	ld	a, #0x89
      00850D F7               [ 1] 1030 	ld	(x), a
                                   1031 ;	joysticksend.c: 359: temp[2]=0x55;                     
      00850E 1E 08            [ 2] 1032 	ldw	x, (0x08, sp)
      008510 A6 55            [ 1] 1033 	ld	a, #0x55
      008512 F7               [ 1] 1034 	ld	(x), a
                                   1035 ;	joysticksend.c: 360: temp[3]=0x40;
      008513 1E 06            [ 2] 1036 	ldw	x, (0x06, sp)
      008515 A6 40            [ 1] 1037 	ld	a, #0x40
      008517 F7               [ 1] 1038 	ld	(x), a
                                   1039 ;	joysticksend.c: 361: temp[4]=0x50;
      008518 1E 0C            [ 2] 1040 	ldw	x, (0x0c, sp)
      00851A A6 50            [ 1] 1041 	ld	a, #0x50
      00851C E7 04            [ 1] 1042 	ld	(0x0004, x), a
                                   1043 ;	joysticksend.c: 362: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
      00851E 1E 0C            [ 2] 1044 	ldw	x, (0x0c, sp)
      008520 4B 05            [ 1] 1045 	push	#0x05
      008522 89               [ 2] 1046 	pushw	x
      008523 4B 23            [ 1] 1047 	push	#0x23
      008525 CD 81 48         [ 4] 1048 	call	_write_spi_buf
      008528 5B 04            [ 2] 1049 	addw	sp, #4
                                   1050 ;	joysticksend.c: 364: if (SE8R01_DR_2M==1)
      00852A CE 00 10         [ 2] 1051 	ldw	x, _SE8R01_DR_2M+0
      00852D A3 00 01         [ 2] 1052 	cpw	x, #0x0001
      008530 26 07            [ 1] 1053 	jrne	00105$
                                   1054 ;	joysticksend.c: 365: { temp[0]=0x29;}
      008532 1E 0C            [ 2] 1055 	ldw	x, (0x0c, sp)
      008534 A6 29            [ 1] 1056 	ld	a, #0x29
      008536 F7               [ 1] 1057 	ld	(x), a
      008537 20 05            [ 2] 1058 	jra	00106$
      008539                       1059 00105$:
                                   1060 ;	joysticksend.c: 367: { temp[0]=0x14;}
      008539 1E 0C            [ 2] 1061 	ldw	x, (0x0c, sp)
      00853B A6 14            [ 1] 1062 	ld	a, #0x14
      00853D F7               [ 1] 1063 	ld	(x), a
      00853E                       1064 00106$:
                                   1065 ;	joysticksend.c: 369: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
      00853E 1E 0C            [ 2] 1066 	ldw	x, (0x0c, sp)
      008540 4B 01            [ 1] 1067 	push	#0x01
      008542 89               [ 2] 1068 	pushw	x
      008543 4B 2C            [ 1] 1069 	push	#0x2c
      008545 CD 81 48         [ 4] 1070 	call	_write_spi_buf
      008548 5B 04            [ 2] 1071 	addw	sp, #4
                                   1072 ;	joysticksend.c: 371: temp[0]=0x55;
      00854A 1E 0C            [ 2] 1073 	ldw	x, (0x0c, sp)
      00854C A6 55            [ 1] 1074 	ld	a, #0x55
      00854E F7               [ 1] 1075 	ld	(x), a
                                   1076 ;	joysticksend.c: 372: temp[1]=0xC2;
      00854F 1E 0A            [ 2] 1077 	ldw	x, (0x0a, sp)
      008551 A6 C2            [ 1] 1078 	ld	a, #0xc2
      008553 F7               [ 1] 1079 	ld	(x), a
                                   1080 ;	joysticksend.c: 373: temp[2]=0x09;
      008554 1E 08            [ 2] 1081 	ldw	x, (0x08, sp)
      008556 A6 09            [ 1] 1082 	ld	a, #0x09
      008558 F7               [ 1] 1083 	ld	(x), a
                                   1084 ;	joysticksend.c: 374: temp[3]=0xAC;  
      008559 1E 06            [ 2] 1085 	ldw	x, (0x06, sp)
      00855B A6 AC            [ 1] 1086 	ld	a, #0xac
      00855D F7               [ 1] 1087 	ld	(x), a
                                   1088 ;	joysticksend.c: 375: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
      00855E 1E 0C            [ 2] 1089 	ldw	x, (0x0c, sp)
      008560 4B 04            [ 1] 1090 	push	#0x04
      008562 89               [ 2] 1091 	pushw	x
      008563 4B 31            [ 1] 1092 	push	#0x31
      008565 CD 81 48         [ 4] 1093 	call	_write_spi_buf
      008568 5B 04            [ 2] 1094 	addw	sp, #4
                                   1095 ;	joysticksend.c: 377: temp[0]=0x00;
      00856A 1E 0C            [ 2] 1096 	ldw	x, (0x0c, sp)
      00856C 7F               [ 1] 1097 	clr	(x)
                                   1098 ;	joysticksend.c: 378: temp[1]=0x14;
      00856D 1E 0A            [ 2] 1099 	ldw	x, (0x0a, sp)
      00856F A6 14            [ 1] 1100 	ld	a, #0x14
      008571 F7               [ 1] 1101 	ld	(x), a
                                   1102 ;	joysticksend.c: 379: temp[2]=0x08;   
      008572 1E 08            [ 2] 1103 	ldw	x, (0x08, sp)
      008574 A6 08            [ 1] 1104 	ld	a, #0x08
      008576 F7               [ 1] 1105 	ld	(x), a
                                   1106 ;	joysticksend.c: 380: temp[3]=0x29;
      008577 1E 06            [ 2] 1107 	ldw	x, (0x06, sp)
      008579 A6 29            [ 1] 1108 	ld	a, #0x29
      00857B F7               [ 1] 1109 	ld	(x), a
                                   1110 ;	joysticksend.c: 381: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
      00857C 1E 0C            [ 2] 1111 	ldw	x, (0x0c, sp)
      00857E 4B 04            [ 1] 1112 	push	#0x04
      008580 89               [ 2] 1113 	pushw	x
      008581 4B 33            [ 1] 1114 	push	#0x33
      008583 CD 81 48         [ 4] 1115 	call	_write_spi_buf
      008586 5B 04            [ 2] 1116 	addw	sp, #4
                                   1117 ;	joysticksend.c: 383: temp[0]=0x02;
      008588 1E 0C            [ 2] 1118 	ldw	x, (0x0c, sp)
      00858A A6 02            [ 1] 1119 	ld	a, #0x02
      00858C F7               [ 1] 1120 	ld	(x), a
                                   1121 ;	joysticksend.c: 384: temp[1]=0xC1;
      00858D 1E 0A            [ 2] 1122 	ldw	x, (0x0a, sp)
      00858F A6 C1            [ 1] 1123 	ld	a, #0xc1
      008591 F7               [ 1] 1124 	ld	(x), a
                                   1125 ;	joysticksend.c: 385: temp[2]=0xCB;  
      008592 1E 08            [ 2] 1126 	ldw	x, (0x08, sp)
      008594 A6 CB            [ 1] 1127 	ld	a, #0xcb
      008596 F7               [ 1] 1128 	ld	(x), a
                                   1129 ;	joysticksend.c: 386: temp[3]=0x1C;
      008597 1E 06            [ 2] 1130 	ldw	x, (0x06, sp)
      008599 A6 1C            [ 1] 1131 	ld	a, #0x1c
      00859B F7               [ 1] 1132 	ld	(x), a
                                   1133 ;	joysticksend.c: 387: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      00859C 1E 0C            [ 2] 1134 	ldw	x, (0x0c, sp)
      00859E 4B 04            [ 1] 1135 	push	#0x04
      0085A0 89               [ 2] 1136 	pushw	x
      0085A1 4B 3D            [ 1] 1137 	push	#0x3d
      0085A3 CD 81 48         [ 4] 1138 	call	_write_spi_buf
      0085A6 5B 04            [ 2] 1139 	addw	sp, #4
                                   1140 ;	joysticksend.c: 389: temp[0]=0x97;
      0085A8 1E 0C            [ 2] 1141 	ldw	x, (0x0c, sp)
      0085AA A6 97            [ 1] 1142 	ld	a, #0x97
      0085AC F7               [ 1] 1143 	ld	(x), a
                                   1144 ;	joysticksend.c: 390: temp[1]=0x64;
      0085AD 1E 0A            [ 2] 1145 	ldw	x, (0x0a, sp)
      0085AF A6 64            [ 1] 1146 	ld	a, #0x64
      0085B1 F7               [ 1] 1147 	ld	(x), a
                                   1148 ;	joysticksend.c: 391: temp[2]=0x00;
      0085B2 1E 08            [ 2] 1149 	ldw	x, (0x08, sp)
      0085B4 7F               [ 1] 1150 	clr	(x)
                                   1151 ;	joysticksend.c: 392: temp[3]=0x01;
      0085B5 1E 06            [ 2] 1152 	ldw	x, (0x06, sp)
      0085B7 A6 01            [ 1] 1153 	ld	a, #0x01
      0085B9 F7               [ 1] 1154 	ld	(x), a
                                   1155 ;	joysticksend.c: 393: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
      0085BA 1E 0C            [ 2] 1156 	ldw	x, (0x0c, sp)
      0085BC 4B 04            [ 1] 1157 	push	#0x04
      0085BE 89               [ 2] 1158 	pushw	x
      0085BF 4B 3E            [ 1] 1159 	push	#0x3e
      0085C1 CD 81 48         [ 4] 1160 	call	_write_spi_buf
      0085C4 5B 04            [ 2] 1161 	addw	sp, #4
                                   1162 ;	joysticksend.c: 395: gtemp[0]=0x2A;
      0085C6 1E 14            [ 2] 1163 	ldw	x, (0x14, sp)
      0085C8 A6 2A            [ 1] 1164 	ld	a, #0x2a
      0085CA F7               [ 1] 1165 	ld	(x), a
                                   1166 ;	joysticksend.c: 396: gtemp[1]=0x04;
      0085CB 1E 12            [ 2] 1167 	ldw	x, (0x12, sp)
      0085CD A6 04            [ 1] 1168 	ld	a, #0x04
      0085CF F7               [ 1] 1169 	ld	(x), a
                                   1170 ;	joysticksend.c: 397: gtemp[2]=0x00;
      0085D0 1E 10            [ 2] 1171 	ldw	x, (0x10, sp)
      0085D2 7F               [ 1] 1172 	clr	(x)
                                   1173 ;	joysticksend.c: 398: gtemp[3]=0x7D;
      0085D3 1E 0E            [ 2] 1174 	ldw	x, (0x0e, sp)
      0085D5 A6 7D            [ 1] 1175 	ld	a, #0x7d
      0085D7 F7               [ 1] 1176 	ld	(x), a
                                   1177 ;	joysticksend.c: 399: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
      0085D8 1E 14            [ 2] 1178 	ldw	x, (0x14, sp)
      0085DA 4B 04            [ 1] 1179 	push	#0x04
      0085DC 89               [ 2] 1180 	pushw	x
      0085DD 4B 3F            [ 1] 1181 	push	#0x3f
      0085DF CD 81 48         [ 4] 1182 	call	_write_spi_buf
      0085E2 5B 04            [ 2] 1183 	addw	sp, #4
                                   1184 ;	joysticksend.c: 401: rf_switch_bank(iBANK0);
      0085E4 4B 00            [ 1] 1185 	push	#0x00
      0085E6 CD 82 88         [ 4] 1186 	call	_rf_switch_bank
      0085E9 84               [ 1] 1187 	pop	a
      0085EA 5B 15            [ 2] 1188 	addw	sp, #21
      0085EC 81               [ 4] 1189 	ret
                                   1190 ;	joysticksend.c: 404: void SE8R01_Init()  
                                   1191 ;	-----------------------------------------
                                   1192 ;	 function SE8R01_Init
                                   1193 ;	-----------------------------------------
      0085ED                       1194 _SE8R01_Init:
      0085ED 52 05            [ 2] 1195 	sub	sp, #5
                                   1196 ;	joysticksend.c: 407: SE8R01_Calibration();   
      0085EF CD 82 A5         [ 4] 1197 	call	_SE8R01_Calibration
                                   1198 ;	joysticksend.c: 408: SE8R01_Analog_Init();   
      0085F2 CD 84 71         [ 4] 1199 	call	_SE8R01_Analog_Init
                                   1200 ;	joysticksend.c: 412: if (SE8R01_DR_2M==1)
      0085F5 CE 00 10         [ 2] 1201 	ldw	x, _SE8R01_DR_2M+0
      0085F8 A3 00 01         [ 2] 1202 	cpw	x, #0x0001
      0085FB 26 07            [ 1] 1203 	jrne	00105$
                                   1204 ;	joysticksend.c: 413: {  temp[0]=0b01001111; }     //2MHz,+5dbm
      0085FD 96               [ 1] 1205 	ldw	x, sp
      0085FE 5C               [ 2] 1206 	incw	x
      0085FF A6 4F            [ 1] 1207 	ld	a, #0x4f
      008601 F7               [ 1] 1208 	ld	(x), a
      008602 20 14            [ 2] 1209 	jra	00106$
      008604                       1210 00105$:
                                   1211 ;	joysticksend.c: 414: else if  (SE8R01_DR_1M==1)
      008604 CE 00 12         [ 2] 1212 	ldw	x, _SE8R01_DR_1M+0
      008607 A3 00 01         [ 2] 1213 	cpw	x, #0x0001
      00860A 26 07            [ 1] 1214 	jrne	00102$
                                   1215 ;	joysticksend.c: 415: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
      00860C 96               [ 1] 1216 	ldw	x, sp
      00860D 5C               [ 2] 1217 	incw	x
      00860E A6 47            [ 1] 1218 	ld	a, #0x47
      008610 F7               [ 1] 1219 	ld	(x), a
      008611 20 05            [ 2] 1220 	jra	00106$
      008613                       1221 00102$:
                                   1222 ;	joysticksend.c: 417: {temp[0]=0b01101111;  }     //500K,+5dbm
      008613 96               [ 1] 1223 	ldw	x, sp
      008614 5C               [ 2] 1224 	incw	x
      008615 A6 6F            [ 1] 1225 	ld	a, #0x6f
      008617 F7               [ 1] 1226 	ld	(x), a
      008618                       1227 00106$:
                                   1228 ;	joysticksend.c: 419: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      008618 96               [ 1] 1229 	ldw	x, sp
      008619 5C               [ 2] 1230 	incw	x
      00861A 4B 01            [ 1] 1231 	push	#0x01
      00861C 89               [ 2] 1232 	pushw	x
      00861D 4B 26            [ 1] 1233 	push	#0x26
      00861F CD 81 48         [ 4] 1234 	call	_write_spi_buf
      008622 5B 04            [ 2] 1235 	addw	sp, #4
                                   1236 ;	joysticksend.c: 421: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0x01);          //enable auto acc on pip 1
      008624 4B 01            [ 1] 1237 	push	#0x01
      008626 4B 21            [ 1] 1238 	push	#0x21
      008628 CD 80 CE         [ 4] 1239 	call	_write_spi_reg
      00862B 5B 02            [ 2] 1240 	addw	sp, #2
                                   1241 ;	joysticksend.c: 422: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0x01);      //enable pip 1
      00862D 4B 01            [ 1] 1242 	push	#0x01
      00862F 4B 22            [ 1] 1243 	push	#0x22
      008631 CD 80 CE         [ 4] 1244 	call	_write_spi_reg
      008634 5B 02            [ 2] 1245 	addw	sp, #2
                                   1246 ;	joysticksend.c: 423: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);        //4 byte adress
      008636 4B 02            [ 1] 1247 	push	#0x02
      008638 4B 23            [ 1] 1248 	push	#0x23
      00863A CD 80 CE         [ 4] 1249 	call	_write_spi_reg
      00863D 5B 02            [ 2] 1250 	addw	sp, #2
                                   1251 ;	joysticksend.c: 424: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_RETR, 0x08);        //lowest 4 bits 0-15 rt transmisston higest 4 bits 256-4096us Auto Retransmit Delay
      00863F 4B 08            [ 1] 1252 	push	#0x08
      008641 4B 24            [ 1] 1253 	push	#0x24
      008643 CD 80 CE         [ 4] 1254 	call	_write_spi_reg
      008646 5B 02            [ 2] 1255 	addw	sp, #2
                                   1256 ;	joysticksend.c: 425: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
      008648 4B 28            [ 1] 1257 	push	#0x28
      00864A 4B 25            [ 1] 1258 	push	#0x25
      00864C CD 80 CE         [ 4] 1259 	call	_write_spi_reg
      00864F 5B 02            [ 2] 1260 	addw	sp, #2
                                   1261 ;	joysticksend.c: 426: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0x01);          //pipe0 pipe1 enable dynamic payload length data
      008651 4B 01            [ 1] 1262 	push	#0x01
      008653 4B 3C            [ 1] 1263 	push	#0x3c
      008655 CD 80 CE         [ 4] 1264 	call	_write_spi_reg
      008658 5B 02            [ 2] 1265 	addw	sp, #2
                                   1266 ;	joysticksend.c: 427: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
      00865A 4B 07            [ 1] 1267 	push	#0x07
      00865C 4B 3D            [ 1] 1268 	push	#0x3d
      00865E CD 80 CE         [ 4] 1269 	call	_write_spi_reg
      008661 5B 02            [ 2] 1270 	addw	sp, #2
                                   1271 ;	joysticksend.c: 428: write_spi_reg(WRITE_REG + CONFIG, 0x3E);
      008663 4B 3E            [ 1] 1272 	push	#0x3e
      008665 4B 20            [ 1] 1273 	push	#0x20
      008667 CD 80 CE         [ 4] 1274 	call	_write_spi_reg
      00866A 5B 02            [ 2] 1275 	addw	sp, #2
                                   1276 ;	joysticksend.c: 429: write_spi_buf(WRITE_REG + TX_ADDR, TX_ADDRESS, ADR_WIDTH);  //from tx
      00866C AE 00 1E         [ 2] 1277 	ldw	x, #_TX_ADDRESS+0
      00866F 90 93            [ 1] 1278 	ldw	y, x
      008671 89               [ 2] 1279 	pushw	x
      008672 4B 04            [ 1] 1280 	push	#0x04
      008674 90 89            [ 2] 1281 	pushw	y
      008676 4B 30            [ 1] 1282 	push	#0x30
      008678 CD 81 48         [ 4] 1283 	call	_write_spi_buf
      00867B 5B 04            [ 2] 1284 	addw	sp, #4
      00867D 85               [ 2] 1285 	popw	x
                                   1286 ;	joysticksend.c: 431: write_spi_buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Use the same address on the RX device as the TX device write_spi_reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
      00867E 4B 04            [ 1] 1287 	push	#0x04
      008680 89               [ 2] 1288 	pushw	x
      008681 4B 2A            [ 1] 1289 	push	#0x2a
      008683 CD 81 48         [ 4] 1290 	call	_write_spi_buf
      008686 5B 04            [ 2] 1291 	addw	sp, #4
                                   1292 ;	joysticksend.c: 434: PC_ODR |= (1 << CE);
      008688 AE 50 0A         [ 2] 1293 	ldw	x, #0x500a
      00868B F6               [ 1] 1294 	ld	a, (x)
      00868C AA 10            [ 1] 1295 	or	a, #0x10
      00868E F7               [ 1] 1296 	ld	(x), a
      00868F 5B 05            [ 2] 1297 	addw	sp, #5
      008691 81               [ 4] 1298 	ret
                                   1299 ;	joysticksend.c: 440: int main () {
                                   1300 ;	-----------------------------------------
                                   1301 ;	 function main
                                   1302 ;	-----------------------------------------
      008692                       1303 _main:
      008692 52 3B            [ 2] 1304 	sub	sp, #59
                                   1305 ;	joysticksend.c: 447: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
      008694 90 96            [ 1] 1306 	ldw	y, sp
      008696 72 A9 00 2D      [ 2] 1307 	addw	y, #45
      00869A A6 D2            [ 1] 1308 	ld	a, #0xd2
      00869C 90 F7            [ 1] 1309 	ld	(y), a
      00869E 93               [ 1] 1310 	ldw	x, y
      00869F 5C               [ 2] 1311 	incw	x
      0086A0 A6 F0            [ 1] 1312 	ld	a, #0xf0
      0086A2 F7               [ 1] 1313 	ld	(x), a
      0086A3 93               [ 1] 1314 	ldw	x, y
      0086A4 5C               [ 2] 1315 	incw	x
      0086A5 5C               [ 2] 1316 	incw	x
      0086A6 A6 F0            [ 1] 1317 	ld	a, #0xf0
      0086A8 F7               [ 1] 1318 	ld	(x), a
      0086A9 93               [ 1] 1319 	ldw	x, y
      0086AA A6 F0            [ 1] 1320 	ld	a, #0xf0
      0086AC E7 03            [ 1] 1321 	ld	(0x0003, x), a
      0086AE 93               [ 1] 1322 	ldw	x, y
      0086AF A6 F0            [ 1] 1323 	ld	a, #0xf0
      0086B1 E7 04            [ 1] 1324 	ld	(0x0004, x), a
                                   1325 ;	joysticksend.c: 448: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
      0086B3 90 96            [ 1] 1326 	ldw	y, sp
      0086B5 72 A9 00 28      [ 2] 1327 	addw	y, #40
      0086B9 A6 E1            [ 1] 1328 	ld	a, #0xe1
      0086BB 90 F7            [ 1] 1329 	ld	(y), a
      0086BD 93               [ 1] 1330 	ldw	x, y
      0086BE 5C               [ 2] 1331 	incw	x
      0086BF A6 F0            [ 1] 1332 	ld	a, #0xf0
      0086C1 F7               [ 1] 1333 	ld	(x), a
      0086C2 93               [ 1] 1334 	ldw	x, y
      0086C3 5C               [ 2] 1335 	incw	x
      0086C4 5C               [ 2] 1336 	incw	x
      0086C5 A6 F0            [ 1] 1337 	ld	a, #0xf0
      0086C7 F7               [ 1] 1338 	ld	(x), a
      0086C8 93               [ 1] 1339 	ldw	x, y
      0086C9 A6 F0            [ 1] 1340 	ld	a, #0xf0
      0086CB E7 03            [ 1] 1341 	ld	(0x0003, x), a
      0086CD 93               [ 1] 1342 	ldw	x, y
      0086CE 1C 00 04         [ 2] 1343 	addw	x, #0x0004
      0086D1 A6 F0            [ 1] 1344 	ld	a, #0xf0
      0086D3 F7               [ 1] 1345 	ld	(x), a
                                   1346 ;	joysticksend.c: 451: InitializeSystemClock();
      0086D4 CD 81 E4         [ 4] 1347 	call	_InitializeSystemClock
                                   1348 ;	joysticksend.c: 454: InitializeSPI ();
      0086D7 CD 81 BC         [ 4] 1349 	call	_InitializeSPI
                                   1350 ;	joysticksend.c: 457: memset (tx_payload, 0, sizeof(tx_payload));
      0086DA 96               [ 1] 1351 	ldw	x, sp
      0086DB 1C 00 07         [ 2] 1352 	addw	x, #7
      0086DE 1F 3A            [ 2] 1353 	ldw	(0x3a, sp), x
      0086E0 16 3A            [ 2] 1354 	ldw	y, (0x3a, sp)
      0086E2 4B 21            [ 1] 1355 	push	#0x21
      0086E4 4B 00            [ 1] 1356 	push	#0x00
      0086E6 5F               [ 1] 1357 	clrw	x
      0086E7 89               [ 2] 1358 	pushw	x
      0086E8 90 89            [ 2] 1359 	pushw	y
      0086EA CD 88 4C         [ 4] 1360 	call	_memset
      0086ED 5B 06            [ 2] 1361 	addw	sp, #6
                                   1362 ;	joysticksend.c: 460: init_io();                        // Initialize IO port
      0086EF CD 82 79         [ 4] 1363 	call	_init_io
                                   1364 ;	joysticksend.c: 461: write_spi_reg(FLUSH_TX,0); // transmit -- send data 
      0086F2 4B 00            [ 1] 1365 	push	#0x00
      0086F4 4B E1            [ 1] 1366 	push	#0xe1
      0086F6 CD 80 CE         [ 4] 1367 	call	_write_spi_reg
      0086F9 5B 02            [ 2] 1368 	addw	sp, #2
                                   1369 ;	joysticksend.c: 462: readstatus = read_spi_reg(CONFIG);
      0086FB 4B 00            [ 1] 1370 	push	#0x00
      0086FD CD 81 0A         [ 4] 1371 	call	_read_spi_reg
      008700 84               [ 1] 1372 	pop	a
                                   1373 ;	joysticksend.c: 463: readstatus = read_spi_reg(STATUS);
      008701 4B 07            [ 1] 1374 	push	#0x07
      008703 CD 81 0A         [ 4] 1375 	call	_read_spi_reg
      008706 84               [ 1] 1376 	pop	a
                                   1377 ;	joysticksend.c: 465: SE8R01_Init();
      008707 CD 85 ED         [ 4] 1378 	call	_SE8R01_Init
                                   1379 ;	joysticksend.c: 469: while (1) {
      00870A                       1380 00110$:
                                   1381 ;	joysticksend.c: 471: gemiddeld=0;
      00870A 5F               [ 1] 1382 	clrw	x
      00870B 1F 01            [ 2] 1383 	ldw	(0x01, sp), x
                                   1384 ;	joysticksend.c: 472: ampere=0;
      00870D 5F               [ 1] 1385 	clrw	x
      00870E 1F 38            [ 2] 1386 	ldw	(0x38, sp), x
                                   1387 ;	joysticksend.c: 473: for(samples=0;samples<100000;samples++)
      008710 5F               [ 1] 1388 	clrw	x
      008711 1F 05            [ 2] 1389 	ldw	(0x05, sp), x
      008713 1F 03            [ 2] 1390 	ldw	(0x03, sp), x
      008715                       1391 00112$:
                                   1392 ;	joysticksend.c: 476: ADC_CSR |= ((0x0F)&4); // select channel = 4 = PD3
      008715 AE 54 00         [ 2] 1393 	ldw	x, #0x5400
      008718 F6               [ 1] 1394 	ld	a, (x)
      008719 AA 04            [ 1] 1395 	or	a, #0x04
      00871B F7               [ 1] 1396 	ld	(x), a
                                   1397 ;	joysticksend.c: 477: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      00871C AE 54 02         [ 2] 1398 	ldw	x, #0x5402
      00871F F6               [ 1] 1399 	ld	a, (x)
      008720 AA 08            [ 1] 1400 	or	a, #0x08
      008722 F7               [ 1] 1401 	ld	(x), a
                                   1402 ;	joysticksend.c: 478: ADC_CR1 |= ADC_ADON; // ADC ON
      008723 72 10 54 01      [ 1] 1403 	bset	0x5401, #0
                                   1404 ;	joysticksend.c: 479: ADC_CR1 |= ADC_ADON; // start conversion 
      008727 72 10 54 01      [ 1] 1405 	bset	0x5401, #0
                                   1406 ;	joysticksend.c: 480: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      00872B                       1407 00101$:
      00872B AE 54 00         [ 2] 1408 	ldw	x, #0x5400
      00872E F6               [ 1] 1409 	ld	a, (x)
      00872F 48               [ 1] 1410 	sll	a
      008730 24 F9            [ 1] 1411 	jrnc	00101$
                                   1412 ;	joysticksend.c: 482: ampere |= (unsigned int)ADC_DRL;
      008732 AE 54 05         [ 2] 1413 	ldw	x, #0x5405
      008735 F6               [ 1] 1414 	ld	a, (x)
      008736 02               [ 1] 1415 	rlwa	x
      008737 4F               [ 1] 1416 	clr	a
      008738 01               [ 1] 1417 	rrwa	x
      008739 16 38            [ 2] 1418 	ldw	y, (0x38, sp)
      00873B 17 36            [ 2] 1419 	ldw	(0x36, sp), y
      00873D 1A 37            [ 1] 1420 	or	a, (0x37, sp)
      00873F 90 97            [ 1] 1421 	ld	yl, a
      008741 9E               [ 1] 1422 	ld	a, xh
      008742 1A 36            [ 1] 1423 	or	a, (0x36, sp)
      008744 90 95            [ 1] 1424 	ld	yh, a
                                   1425 ;	joysticksend.c: 483: ampere |= (unsigned int)ADC_DRH<<8;
      008746 AE 54 04         [ 2] 1426 	ldw	x, #0x5404
      008749 F6               [ 1] 1427 	ld	a, (x)
      00874A 5F               [ 1] 1428 	clrw	x
      00874B 97               [ 1] 1429 	ld	xl, a
      00874C 58               [ 2] 1430 	sllw	x
      00874D 58               [ 2] 1431 	sllw	x
      00874E 58               [ 2] 1432 	sllw	x
      00874F 58               [ 2] 1433 	sllw	x
      008750 58               [ 2] 1434 	sllw	x
      008751 58               [ 2] 1435 	sllw	x
      008752 58               [ 2] 1436 	sllw	x
      008753 58               [ 2] 1437 	sllw	x
      008754 17 34            [ 2] 1438 	ldw	(0x34, sp), y
      008756 9F               [ 1] 1439 	ld	a, xl
      008757 1A 35            [ 1] 1440 	or	a, (0x35, sp)
      008759 90 97            [ 1] 1441 	ld	yl, a
      00875B 9E               [ 1] 1442 	ld	a, xh
      00875C 1A 34            [ 1] 1443 	or	a, (0x34, sp)
      00875E 90 95            [ 1] 1444 	ld	yh, a
                                   1445 ;	joysticksend.c: 485: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      008760 AE 54 01         [ 2] 1446 	ldw	x, #0x5401
      008763 F6               [ 1] 1447 	ld	a, (x)
      008764 A4 FE            [ 1] 1448 	and	a, #0xfe
      008766 F7               [ 1] 1449 	ld	(x), a
                                   1450 ;	joysticksend.c: 486: ampere &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
      008767 90 9E            [ 1] 1451 	ld	a, yh
      008769 A4 03            [ 1] 1452 	and	a, #0x03
      00876B 90 95            [ 1] 1453 	ld	yh, a
      00876D 17 38            [ 2] 1454 	ldw	(0x38, sp), y
                                   1455 ;	joysticksend.c: 487: if (ampere > gemiddeld) gemiddeld=ampere;
      00876F 1E 38            [ 2] 1456 	ldw	x, (0x38, sp)
      008771 13 01            [ 2] 1457 	cpw	x, (0x01, sp)
      008773 2D 04            [ 1] 1458 	jrsle	00113$
      008775 16 38            [ 2] 1459 	ldw	y, (0x38, sp)
      008777 17 01            [ 2] 1460 	ldw	(0x01, sp), y
      008779                       1461 00113$:
                                   1462 ;	joysticksend.c: 473: for(samples=0;samples<100000;samples++)
      008779 1E 05            [ 2] 1463 	ldw	x, (0x05, sp)
      00877B 1C 00 01         [ 2] 1464 	addw	x, #0x0001
      00877E 1F 05            [ 2] 1465 	ldw	(0x05, sp), x
      008780 7B 04            [ 1] 1466 	ld	a, (0x04, sp)
      008782 A9 00            [ 1] 1467 	adc	a, #0x00
      008784 6B 04            [ 1] 1468 	ld	(0x04, sp), a
      008786 7B 03            [ 1] 1469 	ld	a, (0x03, sp)
      008788 A9 00            [ 1] 1470 	adc	a, #0x00
      00878A 6B 03            [ 1] 1471 	ld	(0x03, sp), a
      00878C 1E 05            [ 2] 1472 	ldw	x, (0x05, sp)
      00878E A3 86 A0         [ 2] 1473 	cpw	x, #0x86a0
      008791 7B 04            [ 1] 1474 	ld	a, (0x04, sp)
      008793 A2 01            [ 1] 1475 	sbc	a, #0x01
      008795 7B 03            [ 1] 1476 	ld	a, (0x03, sp)
      008797 A2 00            [ 1] 1477 	sbc	a, #0x00
      008799 2E 03            [ 1] 1478 	jrsge	00147$
      00879B CC 87 15         [ 2] 1479 	jp	00112$
      00879E                       1480 00147$:
                                   1481 ;	joysticksend.c: 490: if (gemiddeld < 0x001f) gemiddeld=0; //remove unwanted mini measurements
      00879E 1E 01            [ 2] 1482 	ldw	x, (0x01, sp)
      0087A0 A3 00 1F         [ 2] 1483 	cpw	x, #0x001f
      0087A3 2E 03            [ 1] 1484 	jrsge	00108$
      0087A5 5F               [ 1] 1485 	clrw	x
      0087A6 1F 01            [ 2] 1486 	ldw	(0x01, sp), x
      0087A8                       1487 00108$:
                                   1488 ;	joysticksend.c: 491: tx_payload[0] = 0xac; //first two is unique ID for this current sensor
      0087A8 1E 3A            [ 2] 1489 	ldw	x, (0x3a, sp)
      0087AA A6 AC            [ 1] 1490 	ld	a, #0xac
      0087AC F7               [ 1] 1491 	ld	(x), a
                                   1492 ;	joysticksend.c: 492: tx_payload[1] = 0xcc;
      0087AD 1E 3A            [ 2] 1493 	ldw	x, (0x3a, sp)
      0087AF 5C               [ 2] 1494 	incw	x
      0087B0 A6 CC            [ 1] 1495 	ld	a, #0xcc
      0087B2 F7               [ 1] 1496 	ld	(x), a
                                   1497 ;	joysticksend.c: 493: tx_payload[2] = gemiddeld>>8;
      0087B3 16 3A            [ 2] 1498 	ldw	y, (0x3a, sp)
      0087B5 72 A9 00 02      [ 2] 1499 	addw	y, #0x0002
      0087B9 1E 01            [ 2] 1500 	ldw	x, (0x01, sp)
      0087BB 57               [ 2] 1501 	sraw	x
      0087BC 57               [ 2] 1502 	sraw	x
      0087BD 57               [ 2] 1503 	sraw	x
      0087BE 57               [ 2] 1504 	sraw	x
      0087BF 57               [ 2] 1505 	sraw	x
      0087C0 57               [ 2] 1506 	sraw	x
      0087C1 57               [ 2] 1507 	sraw	x
      0087C2 57               [ 2] 1508 	sraw	x
      0087C3 9F               [ 1] 1509 	ld	a, xl
      0087C4 90 F7            [ 1] 1510 	ld	(y), a
                                   1511 ;	joysticksend.c: 494: tx_payload[3] = gemiddeld & 0x00ff; 
      0087C6 1E 3A            [ 2] 1512 	ldw	x, (0x3a, sp)
      0087C8 1C 00 03         [ 2] 1513 	addw	x, #0x0003
      0087CB 7B 02            [ 1] 1514 	ld	a, (0x02, sp)
      0087CD 88               [ 1] 1515 	push	a
      0087CE 0F 33            [ 1] 1516 	clr	(0x33, sp)
      0087D0 84               [ 1] 1517 	pop	a
      0087D1 F7               [ 1] 1518 	ld	(x), a
                                   1519 ;	joysticksend.c: 495: write_spi_buf(iRF_CMD_WR_TX_PLOAD, tx_payload, 4);
      0087D2 1E 3A            [ 2] 1520 	ldw	x, (0x3a, sp)
      0087D4 4B 04            [ 1] 1521 	push	#0x04
      0087D6 89               [ 2] 1522 	pushw	x
      0087D7 4B A0            [ 1] 1523 	push	#0xa0
      0087D9 CD 81 48         [ 4] 1524 	call	_write_spi_buf
      0087DC 5B 04            [ 2] 1525 	addw	sp, #4
                                   1526 ;	joysticksend.c: 496: write_spi_reg(WRITE_REG+STATUS, 0xff);
      0087DE 4B FF            [ 1] 1527 	push	#0xff
      0087E0 4B 27            [ 1] 1528 	push	#0x27
      0087E2 CD 80 CE         [ 4] 1529 	call	_write_spi_reg
      0087E5 5B 02            [ 2] 1530 	addw	sp, #2
                                   1531 ;	joysticksend.c: 503: delay(4);
      0087E7 4B 04            [ 1] 1532 	push	#0x04
      0087E9 4B 00            [ 1] 1533 	push	#0x00
      0087EB CD 82 2E         [ 4] 1534 	call	_delay
      0087EE 5B 02            [ 2] 1535 	addw	sp, #2
      0087F0 CC 87 0A         [ 2] 1536 	jp	00110$
      0087F3 5B 3B            [ 2] 1537 	addw	sp, #59
      0087F5 81               [ 4] 1538 	ret
                                   1539 	.area CODE
                                   1540 	.area INITIALIZER
      00886B                       1541 __xinit__SE8R01_DR_2M:
      00886B 00 00                 1542 	.dw #0x0000
      00886D                       1543 __xinit__SE8R01_DR_1M:
      00886D 00 00                 1544 	.dw #0x0000
      00886F                       1545 __xinit__SE8R01_DR_500K:
      00886F 00 01                 1546 	.dw #0x0001
      008871                       1547 __xinit__pload_width_now:
      008871 00 00                 1548 	.dw #0x0000
      008873                       1549 __xinit__newdata:
      008873 00 00                 1550 	.dw #0x0000
      008875                       1551 __xinit__signal_lv:
      008875 00                    1552 	.db #0x00	;  0
      008876                       1553 __xinit__pip:
      008876 00 00                 1554 	.dw #0x0000
      008878                       1555 __xinit__status:
      008878 00                    1556 	.db #0x00	; 0
      008879                       1557 __xinit__TX_ADDRESS:
      008879 B3                    1558 	.db #0xB3	; 179
      00887A 43                    1559 	.db #0x43	; 67	'C'
      00887B 10                    1560 	.db #0x10	; 16
      00887C 10                    1561 	.db #0x10	; 16
      00887D                       1562 __xinit__ADDRESS2:
      00887D B1                    1563 	.db #0xB1	; 177
      00887E                       1564 __xinit__ADDRESS3:
      00887E B2                    1565 	.db #0xB2	; 178
      00887F                       1566 __xinit__ADDRESS4:
      00887F B3                    1567 	.db #0xB3	; 179
      008880                       1568 __xinit__ADDRESS5:
      008880 B4                    1569 	.db #0xB4	; 180
      008881                       1570 __xinit__ADDRESS1:
      008881 B0                    1571 	.db #0xB0	; 176
      008882 43                    1572 	.db #0x43	; 67	'C'
      008883 10                    1573 	.db #0x10	; 16
      008884 10                    1574 	.db #0x10	; 16
      008885                       1575 __xinit__ADDRESS0:
      008885 34                    1576 	.db #0x34	; 52	'4'
      008886 43                    1577 	.db #0x43	; 67	'C'
      008887 10                    1578 	.db #0x10	; 16
      008888 10                    1579 	.db #0x10	; 16
      008889                       1580 __xinit__rx_buf:
      008889 00                    1581 	.db #0x00	; 0
      00888A 00                    1582 	.db 0x00
      00888B 00                    1583 	.db 0x00
      00888C 00                    1584 	.db 0x00
      00888D 00                    1585 	.db 0x00
      00888E 00                    1586 	.db 0x00
      00888F 00                    1587 	.db 0x00
      008890 00                    1588 	.db 0x00
      008891 00                    1589 	.db 0x00
      008892 00                    1590 	.db 0x00
      008893 00                    1591 	.db 0x00
      008894 00                    1592 	.db 0x00
      008895 00                    1593 	.db 0x00
      008896 00                    1594 	.db 0x00
      008897 00                    1595 	.db 0x00
      008898 00                    1596 	.db 0x00
      008899 00                    1597 	.db 0x00
      00889A 00                    1598 	.db 0x00
      00889B 00                    1599 	.db 0x00
      00889C 00                    1600 	.db 0x00
      00889D 00                    1601 	.db 0x00
      00889E 00                    1602 	.db 0x00
      00889F 00                    1603 	.db 0x00
      0088A0 00                    1604 	.db 0x00
      0088A1 00                    1605 	.db 0x00
      0088A2 00                    1606 	.db 0x00
      0088A3 00                    1607 	.db 0x00
      0088A4 00                    1608 	.db 0x00
      0088A5 00                    1609 	.db 0x00
      0088A6 00                    1610 	.db 0x00
      0088A7 00                    1611 	.db 0x00
      0088A8 00                    1612 	.db 0x00
      0088A9                       1613 __xinit__tx_buf:
      0088A9 00                    1614 	.db #0x00	; 0
      0088AA 00                    1615 	.db 0x00
      0088AB 00                    1616 	.db 0x00
      0088AC 00                    1617 	.db 0x00
      0088AD 00                    1618 	.db 0x00
      0088AE 00                    1619 	.db 0x00
      0088AF 00                    1620 	.db 0x00
      0088B0 00                    1621 	.db 0x00
      0088B1 00                    1622 	.db 0x00
      0088B2 00                    1623 	.db 0x00
      0088B3 00                    1624 	.db 0x00
      0088B4 00                    1625 	.db 0x00
      0088B5 00                    1626 	.db 0x00
      0088B6 00                    1627 	.db 0x00
      0088B7 00                    1628 	.db 0x00
      0088B8 00                    1629 	.db 0x00
      0088B9 00                    1630 	.db 0x00
      0088BA 00                    1631 	.db 0x00
      0088BB 00                    1632 	.db 0x00
      0088BC 00                    1633 	.db 0x00
      0088BD 00                    1634 	.db 0x00
      0088BE 00                    1635 	.db 0x00
      0088BF 00                    1636 	.db 0x00
      0088C0 00                    1637 	.db 0x00
      0088C1 00                    1638 	.db 0x00
      0088C2 00                    1639 	.db 0x00
      0088C3 00                    1640 	.db 0x00
      0088C4 00                    1641 	.db 0x00
      0088C5 00                    1642 	.db 0x00
      0088C6 00                    1643 	.db 0x00
      0088C7 00                    1644 	.db 0x00
      0088C8 00                    1645 	.db 0x00
                                   1646 	.area CABS (ABS)
