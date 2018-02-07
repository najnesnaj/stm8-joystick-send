                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Wed Feb  7 12:53:08 2018
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
      008094 D6 88 E6         [ 1]  164 	ld	a, (s_INITIALIZER - 1, x)
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
                                    184 ;	joysticksend.c: 32: void delayTenMicro (void) {
                                    185 ;	-----------------------------------------
                                    186 ;	 function delayTenMicro
                                    187 ;	-----------------------------------------
      0080A0                        188 _delayTenMicro:
                                    189 ;	joysticksend.c: 34: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  190 	ld	a, #0x32
      0080A2                        191 00104$:
                                    192 ;	joysticksend.c: 35: __asm__("nop");
      0080A2 9D               [ 1]  193 	nop
      0080A3 4A               [ 1]  194 	dec	a
                                    195 ;	joysticksend.c: 34: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  196 	tnz	a
      0080A5 26 FB            [ 1]  197 	jrne	00104$
      0080A7 81               [ 4]  198 	ret
                                    199 ;	joysticksend.c: 37: UCHAR write_spi (UCHAR value) {
                                    200 ;	-----------------------------------------
                                    201 ;	 function write_spi
                                    202 ;	-----------------------------------------
      0080A8                        203 _write_spi:
                                    204 ;	joysticksend.c: 39: delayTenMicro ();
      0080A8 CD 80 A0         [ 4]  205 	call	_delayTenMicro
                                    206 ;	joysticksend.c: 40: SPI_DR = value;
      0080AB AE 52 04         [ 2]  207 	ldw	x, #0x5204
      0080AE 7B 03            [ 1]  208 	ld	a, (0x03, sp)
      0080B0 F7               [ 1]  209 	ld	(x), a
                                    210 ;	joysticksend.c: 41: delayTenMicro ();
      0080B1 CD 80 A0         [ 4]  211 	call	_delayTenMicro
                                    212 ;	joysticksend.c: 42: while ((SPI_SR & TXE) == 0);
      0080B4                        213 00101$:
      0080B4 AE 52 03         [ 2]  214 	ldw	x, #0x5203
      0080B7 F6               [ 1]  215 	ld	a, (x)
      0080B8 A5 02            [ 1]  216 	bcp	a, #0x02
      0080BA 27 F8            [ 1]  217 	jreq	00101$
                                    218 ;	joysticksend.c: 43: delayTenMicro ();
      0080BC CD 80 A0         [ 4]  219 	call	_delayTenMicro
                                    220 ;	joysticksend.c: 44: while ((SPI_SR & RXNE) == 0);
      0080BF                        221 00104$:
      0080BF AE 52 03         [ 2]  222 	ldw	x, #0x5203
      0080C2 F6               [ 1]  223 	ld	a, (x)
      0080C3 44               [ 1]  224 	srl	a
      0080C4 24 F9            [ 1]  225 	jrnc	00104$
                                    226 ;	joysticksend.c: 45: delayTenMicro ();
      0080C6 CD 80 A0         [ 4]  227 	call	_delayTenMicro
                                    228 ;	joysticksend.c: 46: ret = SPI_DR;
      0080C9 AE 52 04         [ 2]  229 	ldw	x, #0x5204
      0080CC F6               [ 1]  230 	ld	a, (x)
                                    231 ;	joysticksend.c: 47: return (ret);
      0080CD 81               [ 4]  232 	ret
                                    233 ;	joysticksend.c: 49: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
                                    234 ;	-----------------------------------------
                                    235 ;	 function write_spi_reg
                                    236 ;	-----------------------------------------
      0080CE                        237 _write_spi_reg:
      0080CE 88               [ 1]  238 	push	a
                                    239 ;	joysticksend.c: 51: PC_ODR &= ~(1 << CSN);
      0080CF AE 50 0A         [ 2]  240 	ldw	x, #0x500a
      0080D2 F6               [ 1]  241 	ld	a, (x)
      0080D3 A4 F7            [ 1]  242 	and	a, #0xf7
      0080D5 F7               [ 1]  243 	ld	(x), a
                                    244 ;	joysticksend.c: 52: ret = write_spi (reg);
      0080D6 7B 04            [ 1]  245 	ld	a, (0x04, sp)
      0080D8 88               [ 1]  246 	push	a
      0080D9 CD 80 A8         [ 4]  247 	call	_write_spi
      0080DC 5B 01            [ 2]  248 	addw	sp, #1
      0080DE 6B 01            [ 1]  249 	ld	(0x01, sp), a
                                    250 ;	joysticksend.c: 53: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      0080E0 7B 04            [ 1]  251 	ld	a, (0x04, sp)
      0080E2 A1 FF            [ 1]  252 	cp	a, #0xff
      0080E4 27 15            [ 1]  253 	jreq	00102$
      0080E6 7B 04            [ 1]  254 	ld	a, (0x04, sp)
      0080E8 A1 E2            [ 1]  255 	cp	a, #0xe2
      0080EA 27 0F            [ 1]  256 	jreq	00102$
      0080EC 7B 04            [ 1]  257 	ld	a, (0x04, sp)
      0080EE A1 E1            [ 1]  258 	cp	a, #0xe1
      0080F0 27 09            [ 1]  259 	jreq	00102$
                                    260 ;	joysticksend.c: 54: write_spi (value);
      0080F2 7B 05            [ 1]  261 	ld	a, (0x05, sp)
      0080F4 88               [ 1]  262 	push	a
      0080F5 CD 80 A8         [ 4]  263 	call	_write_spi
      0080F8 84               [ 1]  264 	pop	a
      0080F9 20 03            [ 2]  265 	jra	00103$
      0080FB                        266 00102$:
                                    267 ;	joysticksend.c: 56: delayTenMicro ();
      0080FB CD 80 A0         [ 4]  268 	call	_delayTenMicro
      0080FE                        269 00103$:
                                    270 ;	joysticksend.c: 57: PC_ODR |= (1 << CSN);
      0080FE AE 50 0A         [ 2]  271 	ldw	x, #0x500a
      008101 F6               [ 1]  272 	ld	a, (x)
      008102 AA 08            [ 1]  273 	or	a, #0x08
      008104 F7               [ 1]  274 	ld	(x), a
                                    275 ;	joysticksend.c: 58: return (ret);
      008105 7B 01            [ 1]  276 	ld	a, (0x01, sp)
      008107 5B 01            [ 2]  277 	addw	sp, #1
      008109 81               [ 4]  278 	ret
                                    279 ;	joysticksend.c: 60: UCHAR read_spi_reg (UCHAR reg) {
                                    280 ;	-----------------------------------------
                                    281 ;	 function read_spi_reg
                                    282 ;	-----------------------------------------
      00810A                        283 _read_spi_reg:
      00810A 88               [ 1]  284 	push	a
                                    285 ;	joysticksend.c: 62: PC_ODR &= ~(1 << CSN);
      00810B AE 50 0A         [ 2]  286 	ldw	x, #0x500a
      00810E F6               [ 1]  287 	ld	a, (x)
      00810F A4 F7            [ 1]  288 	and	a, #0xf7
      008111 F7               [ 1]  289 	ld	(x), a
                                    290 ;	joysticksend.c: 63: ret = write_spi (reg);
      008112 7B 04            [ 1]  291 	ld	a, (0x04, sp)
      008114 88               [ 1]  292 	push	a
      008115 CD 80 A8         [ 4]  293 	call	_write_spi
      008118 5B 01            [ 2]  294 	addw	sp, #1
      00811A 6B 01            [ 1]  295 	ld	(0x01, sp), a
                                    296 ;	joysticksend.c: 64: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      00811C 7B 04            [ 1]  297 	ld	a, (0x04, sp)
      00811E A1 FF            [ 1]  298 	cp	a, #0xff
      008120 27 17            [ 1]  299 	jreq	00102$
      008122 7B 04            [ 1]  300 	ld	a, (0x04, sp)
      008124 A1 E2            [ 1]  301 	cp	a, #0xe2
      008126 27 11            [ 1]  302 	jreq	00102$
      008128 7B 04            [ 1]  303 	ld	a, (0x04, sp)
      00812A A1 E1            [ 1]  304 	cp	a, #0xe1
      00812C 27 0B            [ 1]  305 	jreq	00102$
                                    306 ;	joysticksend.c: 65: ret = write_spi (NOP);
      00812E 4B FF            [ 1]  307 	push	#0xff
      008130 CD 80 A8         [ 4]  308 	call	_write_spi
      008133 5B 01            [ 2]  309 	addw	sp, #1
      008135 6B 01            [ 1]  310 	ld	(0x01, sp), a
      008137 20 03            [ 2]  311 	jra	00103$
      008139                        312 00102$:
                                    313 ;	joysticksend.c: 67: delayTenMicro ();
      008139 CD 80 A0         [ 4]  314 	call	_delayTenMicro
      00813C                        315 00103$:
                                    316 ;	joysticksend.c: 68: PC_ODR |= (1 << CSN);
      00813C AE 50 0A         [ 2]  317 	ldw	x, #0x500a
      00813F F6               [ 1]  318 	ld	a, (x)
      008140 AA 08            [ 1]  319 	or	a, #0x08
      008142 F7               [ 1]  320 	ld	(x), a
                                    321 ;	joysticksend.c: 69: return (ret);
      008143 7B 01            [ 1]  322 	ld	a, (0x01, sp)
      008145 5B 01            [ 2]  323 	addw	sp, #1
      008147 81               [ 4]  324 	ret
                                    325 ;	joysticksend.c: 71: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    326 ;	-----------------------------------------
                                    327 ;	 function write_spi_buf
                                    328 ;	-----------------------------------------
      008148                        329 _write_spi_buf:
      008148 52 02            [ 2]  330 	sub	sp, #2
                                    331 ;	joysticksend.c: 73: PC_ODR &= ~(1 << CSN);
      00814A AE 50 0A         [ 2]  332 	ldw	x, #0x500a
      00814D F6               [ 1]  333 	ld	a, (x)
      00814E A4 F7            [ 1]  334 	and	a, #0xf7
      008150 F7               [ 1]  335 	ld	(x), a
                                    336 ;	joysticksend.c: 74: ret = write_spi (reg);
      008151 7B 05            [ 1]  337 	ld	a, (0x05, sp)
      008153 88               [ 1]  338 	push	a
      008154 CD 80 A8         [ 4]  339 	call	_write_spi
      008157 5B 01            [ 2]  340 	addw	sp, #1
      008159 6B 02            [ 1]  341 	ld	(0x02, sp), a
                                    342 ;	joysticksend.c: 75: for (n = 0; n < len; ++n)
      00815B 0F 01            [ 1]  343 	clr	(0x01, sp)
      00815D                        344 00103$:
      00815D 7B 01            [ 1]  345 	ld	a, (0x01, sp)
      00815F 11 08            [ 1]  346 	cp	a, (0x08, sp)
      008161 24 11            [ 1]  347 	jrnc	00101$
                                    348 ;	joysticksend.c: 76: write_spi (array[n]);
      008163 5F               [ 1]  349 	clrw	x
      008164 7B 01            [ 1]  350 	ld	a, (0x01, sp)
      008166 97               [ 1]  351 	ld	xl, a
      008167 72 FB 06         [ 2]  352 	addw	x, (0x06, sp)
      00816A F6               [ 1]  353 	ld	a, (x)
      00816B 88               [ 1]  354 	push	a
      00816C CD 80 A8         [ 4]  355 	call	_write_spi
      00816F 84               [ 1]  356 	pop	a
                                    357 ;	joysticksend.c: 75: for (n = 0; n < len; ++n)
      008170 0C 01            [ 1]  358 	inc	(0x01, sp)
      008172 20 E9            [ 2]  359 	jra	00103$
      008174                        360 00101$:
                                    361 ;	joysticksend.c: 77: PC_ODR |= (1 << CSN);
      008174 AE 50 0A         [ 2]  362 	ldw	x, #0x500a
      008177 F6               [ 1]  363 	ld	a, (x)
      008178 AA 08            [ 1]  364 	or	a, #0x08
      00817A F7               [ 1]  365 	ld	(x), a
                                    366 ;	joysticksend.c: 78: return (ret);
      00817B 7B 02            [ 1]  367 	ld	a, (0x02, sp)
      00817D 5B 02            [ 2]  368 	addw	sp, #2
      00817F 81               [ 4]  369 	ret
                                    370 ;	joysticksend.c: 80: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    371 ;	-----------------------------------------
                                    372 ;	 function read_spi_buf
                                    373 ;	-----------------------------------------
      008180                        374 _read_spi_buf:
      008180 52 02            [ 2]  375 	sub	sp, #2
                                    376 ;	joysticksend.c: 82: PC_ODR &= ~(1 << CSN);
      008182 AE 50 0A         [ 2]  377 	ldw	x, #0x500a
      008185 F6               [ 1]  378 	ld	a, (x)
      008186 A4 F7            [ 1]  379 	and	a, #0xf7
      008188 F7               [ 1]  380 	ld	(x), a
                                    381 ;	joysticksend.c: 83: ret = write_spi (reg);
      008189 7B 05            [ 1]  382 	ld	a, (0x05, sp)
      00818B 88               [ 1]  383 	push	a
      00818C CD 80 A8         [ 4]  384 	call	_write_spi
      00818F 5B 01            [ 2]  385 	addw	sp, #1
      008191 6B 01            [ 1]  386 	ld	(0x01, sp), a
                                    387 ;	joysticksend.c: 84: for (n = 0; n < len; ++n)
      008193 0F 02            [ 1]  388 	clr	(0x02, sp)
      008195                        389 00103$:
      008195 7B 02            [ 1]  390 	ld	a, (0x02, sp)
      008197 11 08            [ 1]  391 	cp	a, (0x08, sp)
      008199 24 15            [ 1]  392 	jrnc	00101$
                                    393 ;	joysticksend.c: 85: array[n] = write_spi (NOP);
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
                                    404 ;	joysticksend.c: 84: for (n = 0; n < len; ++n)
      0081AC 0C 02            [ 1]  405 	inc	(0x02, sp)
      0081AE 20 E5            [ 2]  406 	jra	00103$
      0081B0                        407 00101$:
                                    408 ;	joysticksend.c: 86: PC_ODR |= (1 << CSN);
      0081B0 AE 50 0A         [ 2]  409 	ldw	x, #0x500a
      0081B3 F6               [ 1]  410 	ld	a, (x)
      0081B4 AA 08            [ 1]  411 	or	a, #0x08
      0081B6 F7               [ 1]  412 	ld	(x), a
                                    413 ;	joysticksend.c: 87: return (ret);
      0081B7 7B 01            [ 1]  414 	ld	a, (0x01, sp)
      0081B9 5B 02            [ 2]  415 	addw	sp, #2
      0081BB 81               [ 4]  416 	ret
                                    417 ;	joysticksend.c: 89: void InitializeSPI () {
                                    418 ;	-----------------------------------------
                                    419 ;	 function InitializeSPI
                                    420 ;	-----------------------------------------
      0081BC                        421 _InitializeSPI:
                                    422 ;	joysticksend.c: 90: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
      0081BC AE 52 00         [ 2]  423 	ldw	x, #0x5200
      0081BF A6 7C            [ 1]  424 	ld	a, #0x7c
      0081C1 F7               [ 1]  425 	ld	(x), a
                                    426 ;	joysticksend.c: 91: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
      0081C2 AE 52 01         [ 2]  427 	ldw	x, #0x5201
      0081C5 7F               [ 1]  428 	clr	(x)
                                    429 ;	joysticksend.c: 92: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
      0081C6 AE 52 02         [ 2]  430 	ldw	x, #0x5202
      0081C9 7F               [ 1]  431 	clr	(x)
                                    432 ;	joysticksend.c: 93: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
      0081CA AE 50 0C         [ 2]  433 	ldw	x, #0x500c
      0081CD A6 18            [ 1]  434 	ld	a, #0x18
      0081CF F7               [ 1]  435 	ld	(x), a
                                    436 ;	joysticksend.c: 94: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
      0081D0 AE 50 0D         [ 2]  437 	ldw	x, #0x500d
      0081D3 A6 18            [ 1]  438 	ld	a, #0x18
      0081D5 F7               [ 1]  439 	ld	(x), a
                                    440 ;	joysticksend.c: 95: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
      0081D6 AE 50 0E         [ 2]  441 	ldw	x, #0x500e
      0081D9 A6 18            [ 1]  442 	ld	a, #0x18
      0081DB F7               [ 1]  443 	ld	(x), a
                                    444 ;	joysticksend.c: 97: PC_ODR &= ~(1 << CE);
      0081DC AE 50 0A         [ 2]  445 	ldw	x, #0x500a
      0081DF F6               [ 1]  446 	ld	a, (x)
      0081E0 A4 EF            [ 1]  447 	and	a, #0xef
      0081E2 F7               [ 1]  448 	ld	(x), a
      0081E3 81               [ 4]  449 	ret
                                    450 ;	joysticksend.c: 99: void InitializeSystemClock() {
                                    451 ;	-----------------------------------------
                                    452 ;	 function InitializeSystemClock
                                    453 ;	-----------------------------------------
      0081E4                        454 _InitializeSystemClock:
                                    455 ;	joysticksend.c: 100: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0081E4 AE 50 C0         [ 2]  456 	ldw	x, #0x50c0
      0081E7 7F               [ 1]  457 	clr	(x)
                                    458 ;	joysticksend.c: 101: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0081E8 AE 50 C0         [ 2]  459 	ldw	x, #0x50c0
      0081EB A6 01            [ 1]  460 	ld	a, #0x01
      0081ED F7               [ 1]  461 	ld	(x), a
                                    462 ;	joysticksend.c: 102: CLK_ECKR = 0;                       //  Disable the external clock.
      0081EE AE 50 C1         [ 2]  463 	ldw	x, #0x50c1
      0081F1 7F               [ 1]  464 	clr	(x)
                                    465 ;	joysticksend.c: 103: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0081F2                        466 00101$:
      0081F2 AE 50 C0         [ 2]  467 	ldw	x, #0x50c0
      0081F5 F6               [ 1]  468 	ld	a, (x)
      0081F6 A5 02            [ 1]  469 	bcp	a, #0x02
      0081F8 27 F8            [ 1]  470 	jreq	00101$
                                    471 ;	joysticksend.c: 104: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0081FA AE 50 C6         [ 2]  472 	ldw	x, #0x50c6
      0081FD 7F               [ 1]  473 	clr	(x)
                                    474 ;	joysticksend.c: 105: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0081FE AE 50 C7         [ 2]  475 	ldw	x, #0x50c7
      008201 A6 FF            [ 1]  476 	ld	a, #0xff
      008203 F7               [ 1]  477 	ld	(x), a
                                    478 ;	joysticksend.c: 106: CLK_PCKENR2 = 0xff;                 //  Ditto.
      008204 AE 50 CA         [ 2]  479 	ldw	x, #0x50ca
      008207 A6 FF            [ 1]  480 	ld	a, #0xff
      008209 F7               [ 1]  481 	ld	(x), a
                                    482 ;	joysticksend.c: 107: CLK_CCOR = 0;                       //  Turn off CCO.
      00820A AE 50 C9         [ 2]  483 	ldw	x, #0x50c9
      00820D 7F               [ 1]  484 	clr	(x)
                                    485 ;	joysticksend.c: 108: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      00820E AE 50 CC         [ 2]  486 	ldw	x, #0x50cc
      008211 7F               [ 1]  487 	clr	(x)
                                    488 ;	joysticksend.c: 109: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      008212 AE 50 CD         [ 2]  489 	ldw	x, #0x50cd
      008215 7F               [ 1]  490 	clr	(x)
                                    491 ;	joysticksend.c: 110: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      008216 AE 50 C4         [ 2]  492 	ldw	x, #0x50c4
      008219 A6 E1            [ 1]  493 	ld	a, #0xe1
      00821B F7               [ 1]  494 	ld	(x), a
                                    495 ;	joysticksend.c: 111: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      00821C AE 50 C5         [ 2]  496 	ldw	x, #0x50c5
      00821F 7F               [ 1]  497 	clr	(x)
                                    498 ;	joysticksend.c: 112: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      008220 AE 50 C5         [ 2]  499 	ldw	x, #0x50c5
      008223 A6 02            [ 1]  500 	ld	a, #0x02
      008225 F7               [ 1]  501 	ld	(x), a
                                    502 ;	joysticksend.c: 113: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      008226                        503 00104$:
      008226 AE 50 C5         [ 2]  504 	ldw	x, #0x50c5
      008229 F6               [ 1]  505 	ld	a, (x)
      00822A 44               [ 1]  506 	srl	a
      00822B 25 F9            [ 1]  507 	jrc	00104$
      00822D 81               [ 4]  508 	ret
                                    509 ;	joysticksend.c: 115: void delay (int time_ms) {
                                    510 ;	-----------------------------------------
                                    511 ;	 function delay
                                    512 ;	-----------------------------------------
      00822E                        513 _delay:
      00822E 52 0A            [ 2]  514 	sub	sp, #10
                                    515 ;	joysticksend.c: 117: for (x = 0; x < 1036*time_ms; ++x)
      008230 5F               [ 1]  516 	clrw	x
      008231 1F 03            [ 2]  517 	ldw	(0x03, sp), x
      008233 1F 01            [ 2]  518 	ldw	(0x01, sp), x
      008235 1E 0D            [ 2]  519 	ldw	x, (0x0d, sp)
      008237 89               [ 2]  520 	pushw	x
      008238 4B 0C            [ 1]  521 	push	#0x0c
      00823A 4B 04            [ 1]  522 	push	#0x04
      00823C CD 88 72         [ 4]  523 	call	__mulint
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
                                    542 ;	joysticksend.c: 118: __asm__("nop");
      00825F 9D               [ 1]  543 	nop
                                    544 ;	joysticksend.c: 117: for (x = 0; x < 1036*time_ms; ++x)
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
                                    559 ;	joysticksend.c: 192: void init_io(void)
                                    560 ;	-----------------------------------------
                                    561 ;	 function init_io
                                    562 ;	-----------------------------------------
      008279                        563 _init_io:
                                    564 ;	joysticksend.c: 201: PC_ODR &= ~(1 << CE);
      008279 AE 50 0A         [ 2]  565 	ldw	x, #0x500a
      00827C F6               [ 1]  566 	ld	a, (x)
      00827D A4 EF            [ 1]  567 	and	a, #0xef
      00827F F7               [ 1]  568 	ld	(x), a
                                    569 ;	joysticksend.c: 203: PC_ODR |= (1 << CSN);
      008280 AE 50 0A         [ 2]  570 	ldw	x, #0x500a
      008283 F6               [ 1]  571 	ld	a, (x)
      008284 AA 08            [ 1]  572 	or	a, #0x08
      008286 F7               [ 1]  573 	ld	(x), a
      008287 81               [ 4]  574 	ret
                                    575 ;	joysticksend.c: 209: void rf_switch_bank(unsigned char bankindex)
                                    576 ;	-----------------------------------------
                                    577 ;	 function rf_switch_bank
                                    578 ;	-----------------------------------------
      008288                        579 _rf_switch_bank:
      008288 88               [ 1]  580 	push	a
                                    581 ;	joysticksend.c: 212: temp1 = bankindex;
      008289 7B 04            [ 1]  582 	ld	a, (0x04, sp)
      00828B 6B 01            [ 1]  583 	ld	(0x01, sp), a
                                    584 ;	joysticksend.c: 214: temp0 = write_spi(iRF_BANK0_STATUS);
      00828D 4B 07            [ 1]  585 	push	#0x07
      00828F CD 80 A8         [ 4]  586 	call	_write_spi
      008292 5B 01            [ 2]  587 	addw	sp, #1
                                    588 ;	joysticksend.c: 216: if((temp0&0x80)!=temp1)
      008294 A4 80            [ 1]  589 	and	a, #0x80
      008296 11 01            [ 1]  590 	cp	a, (0x01, sp)
      008298 27 09            [ 1]  591 	jreq	00103$
                                    592 ;	joysticksend.c: 218: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
      00829A 4B 53            [ 1]  593 	push	#0x53
      00829C 4B 50            [ 1]  594 	push	#0x50
      00829E CD 80 CE         [ 4]  595 	call	_write_spi_reg
      0082A1 5B 02            [ 2]  596 	addw	sp, #2
      0082A3                        597 00103$:
      0082A3 84               [ 1]  598 	pop	a
      0082A4 81               [ 4]  599 	ret
                                    600 ;	joysticksend.c: 225: void SE8R01_Calibration()
                                    601 ;	-----------------------------------------
                                    602 ;	 function SE8R01_Calibration
                                    603 ;	-----------------------------------------
      0082A5                        604 _SE8R01_Calibration:
      0082A5 52 0D            [ 2]  605 	sub	sp, #13
                                    606 ;	joysticksend.c: 228: rf_switch_bank(iBANK0);
      0082A7 4B 00            [ 1]  607 	push	#0x00
      0082A9 CD 82 88         [ 4]  608 	call	_rf_switch_bank
      0082AC 84               [ 1]  609 	pop	a
                                    610 ;	joysticksend.c: 229: temp[0]=0x03;
      0082AD 96               [ 1]  611 	ldw	x, sp
      0082AE 5C               [ 2]  612 	incw	x
      0082AF 1F 0C            [ 2]  613 	ldw	(0x0c, sp), x
      0082B1 1E 0C            [ 2]  614 	ldw	x, (0x0c, sp)
      0082B3 A6 03            [ 1]  615 	ld	a, #0x03
      0082B5 F7               [ 1]  616 	ld	(x), a
                                    617 ;	joysticksend.c: 230: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
      0082B6 1E 0C            [ 2]  618 	ldw	x, (0x0c, sp)
      0082B8 4B 01            [ 1]  619 	push	#0x01
      0082BA 89               [ 2]  620 	pushw	x
      0082BB 4B 20            [ 1]  621 	push	#0x20
      0082BD CD 81 48         [ 4]  622 	call	_write_spi_buf
      0082C0 5B 04            [ 2]  623 	addw	sp, #4
                                    624 ;	joysticksend.c: 232: temp[0]=0x32;
      0082C2 1E 0C            [ 2]  625 	ldw	x, (0x0c, sp)
      0082C4 A6 32            [ 1]  626 	ld	a, #0x32
      0082C6 F7               [ 1]  627 	ld	(x), a
                                    628 ;	joysticksend.c: 234: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
      0082C7 1E 0C            [ 2]  629 	ldw	x, (0x0c, sp)
      0082C9 4B 01            [ 1]  630 	push	#0x01
      0082CB 89               [ 2]  631 	pushw	x
      0082CC 4B 25            [ 1]  632 	push	#0x25
      0082CE CD 81 48         [ 4]  633 	call	_write_spi_buf
      0082D1 5B 04            [ 2]  634 	addw	sp, #4
                                    635 ;	joysticksend.c: 238: if (SE8R01_DR_2M==1)
      0082D3 CE 00 10         [ 2]  636 	ldw	x, _SE8R01_DR_2M+0
      0082D6 A3 00 01         [ 2]  637 	cpw	x, #0x0001
      0082D9 26 07            [ 1]  638 	jrne	00105$
                                    639 ;	joysticksend.c: 239: {temp[0]=0x48;}
      0082DB 1E 0C            [ 2]  640 	ldw	x, (0x0c, sp)
      0082DD A6 48            [ 1]  641 	ld	a, #0x48
      0082DF F7               [ 1]  642 	ld	(x), a
      0082E0 20 14            [ 2]  643 	jra	00106$
      0082E2                        644 00105$:
                                    645 ;	joysticksend.c: 240: else if (SE8R01_DR_1M==1)
      0082E2 CE 00 12         [ 2]  646 	ldw	x, _SE8R01_DR_1M+0
      0082E5 A3 00 01         [ 2]  647 	cpw	x, #0x0001
      0082E8 26 07            [ 1]  648 	jrne	00102$
                                    649 ;	joysticksend.c: 241: {temp[0]=0x40;}
      0082EA 1E 0C            [ 2]  650 	ldw	x, (0x0c, sp)
      0082EC A6 40            [ 1]  651 	ld	a, #0x40
      0082EE F7               [ 1]  652 	ld	(x), a
      0082EF 20 05            [ 2]  653 	jra	00106$
      0082F1                        654 00102$:
                                    655 ;	joysticksend.c: 243: {temp[0]=0x68;}   
      0082F1 1E 0C            [ 2]  656 	ldw	x, (0x0c, sp)
      0082F3 A6 68            [ 1]  657 	ld	a, #0x68
      0082F5 F7               [ 1]  658 	ld	(x), a
      0082F6                        659 00106$:
                                    660 ;	joysticksend.c: 245: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0082F6 1E 0C            [ 2]  661 	ldw	x, (0x0c, sp)
      0082F8 4B 01            [ 1]  662 	push	#0x01
      0082FA 89               [ 2]  663 	pushw	x
      0082FB 4B 26            [ 1]  664 	push	#0x26
      0082FD CD 81 48         [ 4]  665 	call	_write_spi_buf
      008300 5B 04            [ 2]  666 	addw	sp, #4
                                    667 ;	joysticksend.c: 246: temp[0]=0x77;
      008302 1E 0C            [ 2]  668 	ldw	x, (0x0c, sp)
      008304 A6 77            [ 1]  669 	ld	a, #0x77
      008306 F7               [ 1]  670 	ld	(x), a
                                    671 ;	joysticksend.c: 247: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
      008307 1E 0C            [ 2]  672 	ldw	x, (0x0c, sp)
      008309 4B 01            [ 1]  673 	push	#0x01
      00830B 89               [ 2]  674 	pushw	x
      00830C 4B 3F            [ 1]  675 	push	#0x3f
      00830E CD 81 48         [ 4]  676 	call	_write_spi_buf
      008311 5B 04            [ 2]  677 	addw	sp, #4
                                    678 ;	joysticksend.c: 249: rf_switch_bank(iBANK1);
      008313 4B 80            [ 1]  679 	push	#0x80
      008315 CD 82 88         [ 4]  680 	call	_rf_switch_bank
      008318 84               [ 1]  681 	pop	a
                                    682 ;	joysticksend.c: 250: temp[0]=0x40;
      008319 1E 0C            [ 2]  683 	ldw	x, (0x0c, sp)
      00831B A6 40            [ 1]  684 	ld	a, #0x40
      00831D F7               [ 1]  685 	ld	(x), a
                                    686 ;	joysticksend.c: 251: temp[1]=0x00;
      00831E 1E 0C            [ 2]  687 	ldw	x, (0x0c, sp)
      008320 5C               [ 2]  688 	incw	x
      008321 1F 0A            [ 2]  689 	ldw	(0x0a, sp), x
      008323 1E 0A            [ 2]  690 	ldw	x, (0x0a, sp)
      008325 7F               [ 1]  691 	clr	(x)
                                    692 ;	joysticksend.c: 252: temp[2]=0x10;
      008326 1E 0C            [ 2]  693 	ldw	x, (0x0c, sp)
      008328 5C               [ 2]  694 	incw	x
      008329 5C               [ 2]  695 	incw	x
      00832A 1F 08            [ 2]  696 	ldw	(0x08, sp), x
      00832C 1E 08            [ 2]  697 	ldw	x, (0x08, sp)
      00832E A6 10            [ 1]  698 	ld	a, #0x10
      008330 F7               [ 1]  699 	ld	(x), a
                                    700 ;	joysticksend.c: 254: {temp[3]=0xE6;}
      008331 1E 0C            [ 2]  701 	ldw	x, (0x0c, sp)
      008333 1C 00 03         [ 2]  702 	addw	x, #0x0003
      008336 1F 06            [ 2]  703 	ldw	(0x06, sp), x
                                    704 ;	joysticksend.c: 253: if (SE8R01_DR_2M==1)
      008338 CE 00 10         [ 2]  705 	ldw	x, _SE8R01_DR_2M+0
      00833B A3 00 01         [ 2]  706 	cpw	x, #0x0001
      00833E 26 07            [ 1]  707 	jrne	00108$
                                    708 ;	joysticksend.c: 254: {temp[3]=0xE6;}
      008340 1E 06            [ 2]  709 	ldw	x, (0x06, sp)
      008342 A6 E6            [ 1]  710 	ld	a, #0xe6
      008344 F7               [ 1]  711 	ld	(x), a
      008345 20 05            [ 2]  712 	jra	00109$
      008347                        713 00108$:
                                    714 ;	joysticksend.c: 256: {temp[3]=0xE4;}
      008347 1E 06            [ 2]  715 	ldw	x, (0x06, sp)
      008349 A6 E4            [ 1]  716 	ld	a, #0xe4
      00834B F7               [ 1]  717 	ld	(x), a
      00834C                        718 00109$:
                                    719 ;	joysticksend.c: 258: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
      00834C 1E 0C            [ 2]  720 	ldw	x, (0x0c, sp)
      00834E 4B 04            [ 1]  721 	push	#0x04
      008350 89               [ 2]  722 	pushw	x
      008351 4B 21            [ 1]  723 	push	#0x21
      008353 CD 81 48         [ 4]  724 	call	_write_spi_buf
      008356 5B 04            [ 2]  725 	addw	sp, #4
                                    726 ;	joysticksend.c: 260: temp[0]=0x20;
      008358 1E 0C            [ 2]  727 	ldw	x, (0x0c, sp)
      00835A A6 20            [ 1]  728 	ld	a, #0x20
      00835C F7               [ 1]  729 	ld	(x), a
                                    730 ;	joysticksend.c: 261: temp[1]=0x08;
      00835D 1E 0A            [ 2]  731 	ldw	x, (0x0a, sp)
      00835F A6 08            [ 1]  732 	ld	a, #0x08
      008361 F7               [ 1]  733 	ld	(x), a
                                    734 ;	joysticksend.c: 262: temp[2]=0x50;
      008362 1E 08            [ 2]  735 	ldw	x, (0x08, sp)
      008364 A6 50            [ 1]  736 	ld	a, #0x50
      008366 F7               [ 1]  737 	ld	(x), a
                                    738 ;	joysticksend.c: 263: temp[3]=0x40;
      008367 1E 06            [ 2]  739 	ldw	x, (0x06, sp)
      008369 A6 40            [ 1]  740 	ld	a, #0x40
      00836B F7               [ 1]  741 	ld	(x), a
                                    742 ;	joysticksend.c: 264: temp[4]=0x50;
      00836C 1E 0C            [ 2]  743 	ldw	x, (0x0c, sp)
      00836E A6 50            [ 1]  744 	ld	a, #0x50
      008370 E7 04            [ 1]  745 	ld	(0x0004, x), a
                                    746 ;	joysticksend.c: 265: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
      008372 1E 0C            [ 2]  747 	ldw	x, (0x0c, sp)
      008374 4B 05            [ 1]  748 	push	#0x05
      008376 89               [ 2]  749 	pushw	x
      008377 4B 23            [ 1]  750 	push	#0x23
      008379 CD 81 48         [ 4]  751 	call	_write_spi_buf
      00837C 5B 04            [ 2]  752 	addw	sp, #4
                                    753 ;	joysticksend.c: 267: temp[0]=0x00;
      00837E 1E 0C            [ 2]  754 	ldw	x, (0x0c, sp)
      008380 7F               [ 1]  755 	clr	(x)
                                    756 ;	joysticksend.c: 268: temp[1]=0x00;
      008381 1E 0A            [ 2]  757 	ldw	x, (0x0a, sp)
      008383 7F               [ 1]  758 	clr	(x)
                                    759 ;	joysticksend.c: 269: if (SE8R01_DR_2M==1)
      008384 CE 00 10         [ 2]  760 	ldw	x, _SE8R01_DR_2M+0
      008387 A3 00 01         [ 2]  761 	cpw	x, #0x0001
      00838A 26 07            [ 1]  762 	jrne	00111$
                                    763 ;	joysticksend.c: 270: { temp[2]=0x1E;}
      00838C 1E 08            [ 2]  764 	ldw	x, (0x08, sp)
      00838E A6 1E            [ 1]  765 	ld	a, #0x1e
      008390 F7               [ 1]  766 	ld	(x), a
      008391 20 05            [ 2]  767 	jra	00112$
      008393                        768 00111$:
                                    769 ;	joysticksend.c: 272: { temp[2]=0x1F;}
      008393 1E 08            [ 2]  770 	ldw	x, (0x08, sp)
      008395 A6 1F            [ 1]  771 	ld	a, #0x1f
      008397 F7               [ 1]  772 	ld	(x), a
      008398                        773 00112$:
                                    774 ;	joysticksend.c: 274: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
      008398 1E 0C            [ 2]  775 	ldw	x, (0x0c, sp)
      00839A 4B 03            [ 1]  776 	push	#0x03
      00839C 89               [ 2]  777 	pushw	x
      00839D 4B 2A            [ 1]  778 	push	#0x2a
      00839F CD 81 48         [ 4]  779 	call	_write_spi_buf
      0083A2 5B 04            [ 2]  780 	addw	sp, #4
                                    781 ;	joysticksend.c: 276: if (SE8R01_DR_2M==1)
      0083A4 CE 00 10         [ 2]  782 	ldw	x, _SE8R01_DR_2M+0
      0083A7 A3 00 01         [ 2]  783 	cpw	x, #0x0001
      0083AA 26 07            [ 1]  784 	jrne	00114$
                                    785 ;	joysticksend.c: 277: { temp[0]=0x29;}
      0083AC 1E 0C            [ 2]  786 	ldw	x, (0x0c, sp)
      0083AE A6 29            [ 1]  787 	ld	a, #0x29
      0083B0 F7               [ 1]  788 	ld	(x), a
      0083B1 20 05            [ 2]  789 	jra	00115$
      0083B3                        790 00114$:
                                    791 ;	joysticksend.c: 279: { temp[0]=0x14;}
      0083B3 1E 0C            [ 2]  792 	ldw	x, (0x0c, sp)
      0083B5 A6 14            [ 1]  793 	ld	a, #0x14
      0083B7 F7               [ 1]  794 	ld	(x), a
      0083B8                        795 00115$:
                                    796 ;	joysticksend.c: 281: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
      0083B8 1E 0C            [ 2]  797 	ldw	x, (0x0c, sp)
      0083BA 4B 01            [ 1]  798 	push	#0x01
      0083BC 89               [ 2]  799 	pushw	x
      0083BD 4B 2C            [ 1]  800 	push	#0x2c
      0083BF CD 81 48         [ 4]  801 	call	_write_spi_buf
      0083C2 5B 04            [ 2]  802 	addw	sp, #4
                                    803 ;	joysticksend.c: 283: temp[0]=0x00;
      0083C4 1E 0C            [ 2]  804 	ldw	x, (0x0c, sp)
      0083C6 7F               [ 1]  805 	clr	(x)
                                    806 ;	joysticksend.c: 284: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
      0083C7 1E 0C            [ 2]  807 	ldw	x, (0x0c, sp)
      0083C9 4B 01            [ 1]  808 	push	#0x01
      0083CB 89               [ 2]  809 	pushw	x
      0083CC 4B 37            [ 1]  810 	push	#0x37
      0083CE CD 81 48         [ 4]  811 	call	_write_spi_buf
      0083D1 5B 04            [ 2]  812 	addw	sp, #4
                                    813 ;	joysticksend.c: 286: temp[0]=0x7F;
      0083D3 1E 0C            [ 2]  814 	ldw	x, (0x0c, sp)
      0083D5 A6 7F            [ 1]  815 	ld	a, #0x7f
      0083D7 F7               [ 1]  816 	ld	(x), a
                                    817 ;	joysticksend.c: 287: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
      0083D8 1E 0C            [ 2]  818 	ldw	x, (0x0c, sp)
      0083DA 4B 01            [ 1]  819 	push	#0x01
      0083DC 89               [ 2]  820 	pushw	x
      0083DD 4B 38            [ 1]  821 	push	#0x38
      0083DF CD 81 48         [ 4]  822 	call	_write_spi_buf
      0083E2 5B 04            [ 2]  823 	addw	sp, #4
                                    824 ;	joysticksend.c: 289: temp[0]=0x02;
      0083E4 1E 0C            [ 2]  825 	ldw	x, (0x0c, sp)
      0083E6 A6 02            [ 1]  826 	ld	a, #0x02
      0083E8 F7               [ 1]  827 	ld	(x), a
                                    828 ;	joysticksend.c: 290: temp[1]=0xC1;
      0083E9 1E 0A            [ 2]  829 	ldw	x, (0x0a, sp)
      0083EB A6 C1            [ 1]  830 	ld	a, #0xc1
      0083ED F7               [ 1]  831 	ld	(x), a
                                    832 ;	joysticksend.c: 291: temp[2]=0xEB;            
      0083EE 1E 08            [ 2]  833 	ldw	x, (0x08, sp)
      0083F0 A6 EB            [ 1]  834 	ld	a, #0xeb
      0083F2 F7               [ 1]  835 	ld	(x), a
                                    836 ;	joysticksend.c: 292: temp[3]=0x1C;
      0083F3 1E 06            [ 2]  837 	ldw	x, (0x06, sp)
      0083F5 A6 1C            [ 1]  838 	ld	a, #0x1c
      0083F7 F7               [ 1]  839 	ld	(x), a
                                    840 ;	joysticksend.c: 293: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      0083F8 1E 0C            [ 2]  841 	ldw	x, (0x0c, sp)
      0083FA 4B 04            [ 1]  842 	push	#0x04
      0083FC 89               [ 2]  843 	pushw	x
      0083FD 4B 3D            [ 1]  844 	push	#0x3d
      0083FF CD 81 48         [ 4]  845 	call	_write_spi_buf
      008402 5B 04            [ 2]  846 	addw	sp, #4
                                    847 ;	joysticksend.c: 295: temp[0]=0x97;
      008404 1E 0C            [ 2]  848 	ldw	x, (0x0c, sp)
      008406 A6 97            [ 1]  849 	ld	a, #0x97
      008408 F7               [ 1]  850 	ld	(x), a
                                    851 ;	joysticksend.c: 296: temp[1]=0x64;
      008409 1E 0A            [ 2]  852 	ldw	x, (0x0a, sp)
      00840B A6 64            [ 1]  853 	ld	a, #0x64
      00840D F7               [ 1]  854 	ld	(x), a
                                    855 ;	joysticksend.c: 297: temp[2]=0x00;
      00840E 1E 08            [ 2]  856 	ldw	x, (0x08, sp)
      008410 7F               [ 1]  857 	clr	(x)
                                    858 ;	joysticksend.c: 298: temp[3]=0x81;
      008411 1E 06            [ 2]  859 	ldw	x, (0x06, sp)
      008413 A6 81            [ 1]  860 	ld	a, #0x81
      008415 F7               [ 1]  861 	ld	(x), a
                                    862 ;	joysticksend.c: 299: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
      008416 1E 0C            [ 2]  863 	ldw	x, (0x0c, sp)
      008418 4B 04            [ 1]  864 	push	#0x04
      00841A 89               [ 2]  865 	pushw	x
      00841B 4B 3E            [ 1]  866 	push	#0x3e
      00841D CD 81 48         [ 4]  867 	call	_write_spi_buf
      008420 5B 04            [ 2]  868 	addw	sp, #4
                                    869 ;	joysticksend.c: 300: rf_switch_bank(iBANK0);
      008422 4B 00            [ 1]  870 	push	#0x00
      008424 CD 82 88         [ 4]  871 	call	_rf_switch_bank
      008427 84               [ 1]  872 	pop	a
                                    873 ;	joysticksend.c: 305: delayTenMicro();
      008428 CD 80 A0         [ 4]  874 	call	_delayTenMicro
                                    875 ;	joysticksend.c: 306: PC_ODR |= (1 << CE);
      00842B AE 50 0A         [ 2]  876 	ldw	x, #0x500a
      00842E F6               [ 1]  877 	ld	a, (x)
      00842F AA 10            [ 1]  878 	or	a, #0x10
      008431 F7               [ 1]  879 	ld	(x), a
                                    880 ;	joysticksend.c: 307: delayTenMicro();
      008432 CD 80 A0         [ 4]  881 	call	_delayTenMicro
                                    882 ;	joysticksend.c: 308: delayTenMicro();
      008435 CD 80 A0         [ 4]  883 	call	_delayTenMicro
                                    884 ;	joysticksend.c: 309: delayTenMicro();
      008438 CD 80 A0         [ 4]  885 	call	_delayTenMicro
                                    886 ;	joysticksend.c: 310: PC_ODR &= ~(1 << CE);
      00843B AE 50 0A         [ 2]  887 	ldw	x, #0x500a
      00843E F6               [ 1]  888 	ld	a, (x)
      00843F A4 EF            [ 1]  889 	and	a, #0xef
      008441 F7               [ 1]  890 	ld	(x), a
                                    891 ;	joysticksend.c: 311: delay(50);                            // delay 50ms waitting for calibaration.
      008442 4B 32            [ 1]  892 	push	#0x32
      008444 4B 00            [ 1]  893 	push	#0x00
      008446 CD 82 2E         [ 4]  894 	call	_delay
      008449 5B 02            [ 2]  895 	addw	sp, #2
                                    896 ;	joysticksend.c: 316: delayTenMicro();
      00844B CD 80 A0         [ 4]  897 	call	_delayTenMicro
                                    898 ;	joysticksend.c: 317: PC_ODR |= (1 << CE);
      00844E AE 50 0A         [ 2]  899 	ldw	x, #0x500a
      008451 F6               [ 1]  900 	ld	a, (x)
      008452 AA 10            [ 1]  901 	or	a, #0x10
      008454 F7               [ 1]  902 	ld	(x), a
                                    903 ;	joysticksend.c: 318: delayTenMicro();
      008455 CD 80 A0         [ 4]  904 	call	_delayTenMicro
                                    905 ;	joysticksend.c: 319: delayTenMicro();
      008458 CD 80 A0         [ 4]  906 	call	_delayTenMicro
                                    907 ;	joysticksend.c: 320: delayTenMicro();
      00845B CD 80 A0         [ 4]  908 	call	_delayTenMicro
                                    909 ;	joysticksend.c: 321: PC_ODR &= ~(1 << CE);
      00845E AE 50 0A         [ 2]  910 	ldw	x, #0x500a
      008461 F6               [ 1]  911 	ld	a, (x)
      008462 A4 EF            [ 1]  912 	and	a, #0xef
      008464 F7               [ 1]  913 	ld	(x), a
                                    914 ;	joysticksend.c: 322: delay(50);                            // delay 50ms waitting for calibaration.
      008465 4B 32            [ 1]  915 	push	#0x32
      008467 4B 00            [ 1]  916 	push	#0x00
      008469 CD 82 2E         [ 4]  917 	call	_delay
      00846C 5B 02            [ 2]  918 	addw	sp, #2
      00846E 5B 0D            [ 2]  919 	addw	sp, #13
      008470 81               [ 4]  920 	ret
                                    921 ;	joysticksend.c: 326: void SE8R01_Analog_Init()           //SE8R01 初始化
                                    922 ;	-----------------------------------------
                                    923 ;	 function SE8R01_Analog_Init
                                    924 ;	-----------------------------------------
      008471                        925 _SE8R01_Analog_Init:
      008471 52 15            [ 2]  926 	sub	sp, #21
                                    927 ;	joysticksend.c: 331: gtemp[0]=0x28;
      008473 AE 00 01         [ 2]  928 	ldw	x, #_gtemp+0
      008476 1F 14            [ 2]  929 	ldw	(0x14, sp), x
      008478 1E 14            [ 2]  930 	ldw	x, (0x14, sp)
      00847A A6 28            [ 1]  931 	ld	a, #0x28
      00847C F7               [ 1]  932 	ld	(x), a
                                    933 ;	joysticksend.c: 332: gtemp[1]=0x32;
      00847D 1E 14            [ 2]  934 	ldw	x, (0x14, sp)
      00847F 5C               [ 2]  935 	incw	x
      008480 1F 12            [ 2]  936 	ldw	(0x12, sp), x
      008482 1E 12            [ 2]  937 	ldw	x, (0x12, sp)
      008484 A6 32            [ 1]  938 	ld	a, #0x32
      008486 F7               [ 1]  939 	ld	(x), a
                                    940 ;	joysticksend.c: 333: gtemp[2]=0x80;
      008487 1E 14            [ 2]  941 	ldw	x, (0x14, sp)
      008489 5C               [ 2]  942 	incw	x
      00848A 5C               [ 2]  943 	incw	x
      00848B 1F 10            [ 2]  944 	ldw	(0x10, sp), x
      00848D 1E 10            [ 2]  945 	ldw	x, (0x10, sp)
      00848F A6 80            [ 1]  946 	ld	a, #0x80
      008491 F7               [ 1]  947 	ld	(x), a
                                    948 ;	joysticksend.c: 334: gtemp[3]=0x90;
      008492 1E 14            [ 2]  949 	ldw	x, (0x14, sp)
      008494 1C 00 03         [ 2]  950 	addw	x, #0x0003
      008497 1F 0E            [ 2]  951 	ldw	(0x0e, sp), x
      008499 1E 0E            [ 2]  952 	ldw	x, (0x0e, sp)
      00849B A6 90            [ 1]  953 	ld	a, #0x90
      00849D F7               [ 1]  954 	ld	(x), a
                                    955 ;	joysticksend.c: 335: gtemp[4]=0x00;
      00849E 1E 14            [ 2]  956 	ldw	x, (0x14, sp)
      0084A0 1C 00 04         [ 2]  957 	addw	x, #0x0004
      0084A3 7F               [ 1]  958 	clr	(x)
                                    959 ;	joysticksend.c: 336: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
      0084A4 1E 14            [ 2]  960 	ldw	x, (0x14, sp)
      0084A6 4B 05            [ 1]  961 	push	#0x05
      0084A8 89               [ 2]  962 	pushw	x
      0084A9 4B 3E            [ 1]  963 	push	#0x3e
      0084AB CD 81 48         [ 4]  964 	call	_write_spi_buf
      0084AE 5B 04            [ 2]  965 	addw	sp, #4
                                    966 ;	joysticksend.c: 337: delay(2);
      0084B0 4B 02            [ 1]  967 	push	#0x02
      0084B2 4B 00            [ 1]  968 	push	#0x00
      0084B4 CD 82 2E         [ 4]  969 	call	_delay
      0084B7 5B 02            [ 2]  970 	addw	sp, #2
                                    971 ;	joysticksend.c: 340: rf_switch_bank(iBANK1);
      0084B9 4B 80            [ 1]  972 	push	#0x80
      0084BB CD 82 88         [ 4]  973 	call	_rf_switch_bank
      0084BE 84               [ 1]  974 	pop	a
                                    975 ;	joysticksend.c: 342: temp[0]=0x40;
      0084BF 96               [ 1]  976 	ldw	x, sp
      0084C0 5C               [ 2]  977 	incw	x
      0084C1 1F 0C            [ 2]  978 	ldw	(0x0c, sp), x
      0084C3 1E 0C            [ 2]  979 	ldw	x, (0x0c, sp)
      0084C5 A6 40            [ 1]  980 	ld	a, #0x40
      0084C7 F7               [ 1]  981 	ld	(x), a
                                    982 ;	joysticksend.c: 343: temp[1]=0x01;               
      0084C8 1E 0C            [ 2]  983 	ldw	x, (0x0c, sp)
      0084CA 5C               [ 2]  984 	incw	x
      0084CB 1F 0A            [ 2]  985 	ldw	(0x0a, sp), x
      0084CD 1E 0A            [ 2]  986 	ldw	x, (0x0a, sp)
      0084CF A6 01            [ 1]  987 	ld	a, #0x01
      0084D1 F7               [ 1]  988 	ld	(x), a
                                    989 ;	joysticksend.c: 344: temp[2]=0x30;               
      0084D2 1E 0C            [ 2]  990 	ldw	x, (0x0c, sp)
      0084D4 5C               [ 2]  991 	incw	x
      0084D5 5C               [ 2]  992 	incw	x
      0084D6 1F 08            [ 2]  993 	ldw	(0x08, sp), x
      0084D8 1E 08            [ 2]  994 	ldw	x, (0x08, sp)
      0084DA A6 30            [ 1]  995 	ld	a, #0x30
      0084DC F7               [ 1]  996 	ld	(x), a
                                    997 ;	joysticksend.c: 346: { temp[3]=0xE2; }              
      0084DD 1E 0C            [ 2]  998 	ldw	x, (0x0c, sp)
      0084DF 1C 00 03         [ 2]  999 	addw	x, #0x0003
      0084E2 1F 06            [ 2] 1000 	ldw	(0x06, sp), x
                                   1001 ;	joysticksend.c: 345: if (SE8R01_DR_2M==1)
      0084E4 CE 00 10         [ 2] 1002 	ldw	x, _SE8R01_DR_2M+0
      0084E7 A3 00 01         [ 2] 1003 	cpw	x, #0x0001
      0084EA 26 07            [ 1] 1004 	jrne	00102$
                                   1005 ;	joysticksend.c: 346: { temp[3]=0xE2; }              
      0084EC 1E 06            [ 2] 1006 	ldw	x, (0x06, sp)
      0084EE A6 E2            [ 1] 1007 	ld	a, #0xe2
      0084F0 F7               [ 1] 1008 	ld	(x), a
      0084F1 20 05            [ 2] 1009 	jra	00103$
      0084F3                       1010 00102$:
                                   1011 ;	joysticksend.c: 348: { temp[3]=0xE0;}
      0084F3 1E 06            [ 2] 1012 	ldw	x, (0x06, sp)
      0084F5 A6 E0            [ 1] 1013 	ld	a, #0xe0
      0084F7 F7               [ 1] 1014 	ld	(x), a
      0084F8                       1015 00103$:
                                   1016 ;	joysticksend.c: 350: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
      0084F8 1E 0C            [ 2] 1017 	ldw	x, (0x0c, sp)
      0084FA 4B 04            [ 1] 1018 	push	#0x04
      0084FC 89               [ 2] 1019 	pushw	x
      0084FD 4B 21            [ 1] 1020 	push	#0x21
      0084FF CD 81 48         [ 4] 1021 	call	_write_spi_buf
      008502 5B 04            [ 2] 1022 	addw	sp, #4
                                   1023 ;	joysticksend.c: 352: temp[0]=0x29;
      008504 1E 0C            [ 2] 1024 	ldw	x, (0x0c, sp)
      008506 A6 29            [ 1] 1025 	ld	a, #0x29
      008508 F7               [ 1] 1026 	ld	(x), a
                                   1027 ;	joysticksend.c: 353: temp[1]=0x89;
      008509 1E 0A            [ 2] 1028 	ldw	x, (0x0a, sp)
      00850B A6 89            [ 1] 1029 	ld	a, #0x89
      00850D F7               [ 1] 1030 	ld	(x), a
                                   1031 ;	joysticksend.c: 354: temp[2]=0x55;                     
      00850E 1E 08            [ 2] 1032 	ldw	x, (0x08, sp)
      008510 A6 55            [ 1] 1033 	ld	a, #0x55
      008512 F7               [ 1] 1034 	ld	(x), a
                                   1035 ;	joysticksend.c: 355: temp[3]=0x40;
      008513 1E 06            [ 2] 1036 	ldw	x, (0x06, sp)
      008515 A6 40            [ 1] 1037 	ld	a, #0x40
      008517 F7               [ 1] 1038 	ld	(x), a
                                   1039 ;	joysticksend.c: 356: temp[4]=0x50;
      008518 1E 0C            [ 2] 1040 	ldw	x, (0x0c, sp)
      00851A A6 50            [ 1] 1041 	ld	a, #0x50
      00851C E7 04            [ 1] 1042 	ld	(0x0004, x), a
                                   1043 ;	joysticksend.c: 357: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
      00851E 1E 0C            [ 2] 1044 	ldw	x, (0x0c, sp)
      008520 4B 05            [ 1] 1045 	push	#0x05
      008522 89               [ 2] 1046 	pushw	x
      008523 4B 23            [ 1] 1047 	push	#0x23
      008525 CD 81 48         [ 4] 1048 	call	_write_spi_buf
      008528 5B 04            [ 2] 1049 	addw	sp, #4
                                   1050 ;	joysticksend.c: 359: if (SE8R01_DR_2M==1)
      00852A CE 00 10         [ 2] 1051 	ldw	x, _SE8R01_DR_2M+0
      00852D A3 00 01         [ 2] 1052 	cpw	x, #0x0001
      008530 26 07            [ 1] 1053 	jrne	00105$
                                   1054 ;	joysticksend.c: 360: { temp[0]=0x29;}
      008532 1E 0C            [ 2] 1055 	ldw	x, (0x0c, sp)
      008534 A6 29            [ 1] 1056 	ld	a, #0x29
      008536 F7               [ 1] 1057 	ld	(x), a
      008537 20 05            [ 2] 1058 	jra	00106$
      008539                       1059 00105$:
                                   1060 ;	joysticksend.c: 362: { temp[0]=0x14;}
      008539 1E 0C            [ 2] 1061 	ldw	x, (0x0c, sp)
      00853B A6 14            [ 1] 1062 	ld	a, #0x14
      00853D F7               [ 1] 1063 	ld	(x), a
      00853E                       1064 00106$:
                                   1065 ;	joysticksend.c: 364: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
      00853E 1E 0C            [ 2] 1066 	ldw	x, (0x0c, sp)
      008540 4B 01            [ 1] 1067 	push	#0x01
      008542 89               [ 2] 1068 	pushw	x
      008543 4B 2C            [ 1] 1069 	push	#0x2c
      008545 CD 81 48         [ 4] 1070 	call	_write_spi_buf
      008548 5B 04            [ 2] 1071 	addw	sp, #4
                                   1072 ;	joysticksend.c: 366: temp[0]=0x55;
      00854A 1E 0C            [ 2] 1073 	ldw	x, (0x0c, sp)
      00854C A6 55            [ 1] 1074 	ld	a, #0x55
      00854E F7               [ 1] 1075 	ld	(x), a
                                   1076 ;	joysticksend.c: 367: temp[1]=0xC2;
      00854F 1E 0A            [ 2] 1077 	ldw	x, (0x0a, sp)
      008551 A6 C2            [ 1] 1078 	ld	a, #0xc2
      008553 F7               [ 1] 1079 	ld	(x), a
                                   1080 ;	joysticksend.c: 368: temp[2]=0x09;
      008554 1E 08            [ 2] 1081 	ldw	x, (0x08, sp)
      008556 A6 09            [ 1] 1082 	ld	a, #0x09
      008558 F7               [ 1] 1083 	ld	(x), a
                                   1084 ;	joysticksend.c: 369: temp[3]=0xAC;  
      008559 1E 06            [ 2] 1085 	ldw	x, (0x06, sp)
      00855B A6 AC            [ 1] 1086 	ld	a, #0xac
      00855D F7               [ 1] 1087 	ld	(x), a
                                   1088 ;	joysticksend.c: 370: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
      00855E 1E 0C            [ 2] 1089 	ldw	x, (0x0c, sp)
      008560 4B 04            [ 1] 1090 	push	#0x04
      008562 89               [ 2] 1091 	pushw	x
      008563 4B 31            [ 1] 1092 	push	#0x31
      008565 CD 81 48         [ 4] 1093 	call	_write_spi_buf
      008568 5B 04            [ 2] 1094 	addw	sp, #4
                                   1095 ;	joysticksend.c: 372: temp[0]=0x00;
      00856A 1E 0C            [ 2] 1096 	ldw	x, (0x0c, sp)
      00856C 7F               [ 1] 1097 	clr	(x)
                                   1098 ;	joysticksend.c: 373: temp[1]=0x14;
      00856D 1E 0A            [ 2] 1099 	ldw	x, (0x0a, sp)
      00856F A6 14            [ 1] 1100 	ld	a, #0x14
      008571 F7               [ 1] 1101 	ld	(x), a
                                   1102 ;	joysticksend.c: 374: temp[2]=0x08;   
      008572 1E 08            [ 2] 1103 	ldw	x, (0x08, sp)
      008574 A6 08            [ 1] 1104 	ld	a, #0x08
      008576 F7               [ 1] 1105 	ld	(x), a
                                   1106 ;	joysticksend.c: 375: temp[3]=0x29;
      008577 1E 06            [ 2] 1107 	ldw	x, (0x06, sp)
      008579 A6 29            [ 1] 1108 	ld	a, #0x29
      00857B F7               [ 1] 1109 	ld	(x), a
                                   1110 ;	joysticksend.c: 376: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
      00857C 1E 0C            [ 2] 1111 	ldw	x, (0x0c, sp)
      00857E 4B 04            [ 1] 1112 	push	#0x04
      008580 89               [ 2] 1113 	pushw	x
      008581 4B 33            [ 1] 1114 	push	#0x33
      008583 CD 81 48         [ 4] 1115 	call	_write_spi_buf
      008586 5B 04            [ 2] 1116 	addw	sp, #4
                                   1117 ;	joysticksend.c: 378: temp[0]=0x02;
      008588 1E 0C            [ 2] 1118 	ldw	x, (0x0c, sp)
      00858A A6 02            [ 1] 1119 	ld	a, #0x02
      00858C F7               [ 1] 1120 	ld	(x), a
                                   1121 ;	joysticksend.c: 379: temp[1]=0xC1;
      00858D 1E 0A            [ 2] 1122 	ldw	x, (0x0a, sp)
      00858F A6 C1            [ 1] 1123 	ld	a, #0xc1
      008591 F7               [ 1] 1124 	ld	(x), a
                                   1125 ;	joysticksend.c: 380: temp[2]=0xCB;  
      008592 1E 08            [ 2] 1126 	ldw	x, (0x08, sp)
      008594 A6 CB            [ 1] 1127 	ld	a, #0xcb
      008596 F7               [ 1] 1128 	ld	(x), a
                                   1129 ;	joysticksend.c: 381: temp[3]=0x1C;
      008597 1E 06            [ 2] 1130 	ldw	x, (0x06, sp)
      008599 A6 1C            [ 1] 1131 	ld	a, #0x1c
      00859B F7               [ 1] 1132 	ld	(x), a
                                   1133 ;	joysticksend.c: 382: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      00859C 1E 0C            [ 2] 1134 	ldw	x, (0x0c, sp)
      00859E 4B 04            [ 1] 1135 	push	#0x04
      0085A0 89               [ 2] 1136 	pushw	x
      0085A1 4B 3D            [ 1] 1137 	push	#0x3d
      0085A3 CD 81 48         [ 4] 1138 	call	_write_spi_buf
      0085A6 5B 04            [ 2] 1139 	addw	sp, #4
                                   1140 ;	joysticksend.c: 384: temp[0]=0x97;
      0085A8 1E 0C            [ 2] 1141 	ldw	x, (0x0c, sp)
      0085AA A6 97            [ 1] 1142 	ld	a, #0x97
      0085AC F7               [ 1] 1143 	ld	(x), a
                                   1144 ;	joysticksend.c: 385: temp[1]=0x64;
      0085AD 1E 0A            [ 2] 1145 	ldw	x, (0x0a, sp)
      0085AF A6 64            [ 1] 1146 	ld	a, #0x64
      0085B1 F7               [ 1] 1147 	ld	(x), a
                                   1148 ;	joysticksend.c: 386: temp[2]=0x00;
      0085B2 1E 08            [ 2] 1149 	ldw	x, (0x08, sp)
      0085B4 7F               [ 1] 1150 	clr	(x)
                                   1151 ;	joysticksend.c: 387: temp[3]=0x01;
      0085B5 1E 06            [ 2] 1152 	ldw	x, (0x06, sp)
      0085B7 A6 01            [ 1] 1153 	ld	a, #0x01
      0085B9 F7               [ 1] 1154 	ld	(x), a
                                   1155 ;	joysticksend.c: 388: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
      0085BA 1E 0C            [ 2] 1156 	ldw	x, (0x0c, sp)
      0085BC 4B 04            [ 1] 1157 	push	#0x04
      0085BE 89               [ 2] 1158 	pushw	x
      0085BF 4B 3E            [ 1] 1159 	push	#0x3e
      0085C1 CD 81 48         [ 4] 1160 	call	_write_spi_buf
      0085C4 5B 04            [ 2] 1161 	addw	sp, #4
                                   1162 ;	joysticksend.c: 390: gtemp[0]=0x2A;
      0085C6 1E 14            [ 2] 1163 	ldw	x, (0x14, sp)
      0085C8 A6 2A            [ 1] 1164 	ld	a, #0x2a
      0085CA F7               [ 1] 1165 	ld	(x), a
                                   1166 ;	joysticksend.c: 391: gtemp[1]=0x04;
      0085CB 1E 12            [ 2] 1167 	ldw	x, (0x12, sp)
      0085CD A6 04            [ 1] 1168 	ld	a, #0x04
      0085CF F7               [ 1] 1169 	ld	(x), a
                                   1170 ;	joysticksend.c: 392: gtemp[2]=0x00;
      0085D0 1E 10            [ 2] 1171 	ldw	x, (0x10, sp)
      0085D2 7F               [ 1] 1172 	clr	(x)
                                   1173 ;	joysticksend.c: 393: gtemp[3]=0x7D;
      0085D3 1E 0E            [ 2] 1174 	ldw	x, (0x0e, sp)
      0085D5 A6 7D            [ 1] 1175 	ld	a, #0x7d
      0085D7 F7               [ 1] 1176 	ld	(x), a
                                   1177 ;	joysticksend.c: 394: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
      0085D8 1E 14            [ 2] 1178 	ldw	x, (0x14, sp)
      0085DA 4B 04            [ 1] 1179 	push	#0x04
      0085DC 89               [ 2] 1180 	pushw	x
      0085DD 4B 3F            [ 1] 1181 	push	#0x3f
      0085DF CD 81 48         [ 4] 1182 	call	_write_spi_buf
      0085E2 5B 04            [ 2] 1183 	addw	sp, #4
                                   1184 ;	joysticksend.c: 396: rf_switch_bank(iBANK0);
      0085E4 4B 00            [ 1] 1185 	push	#0x00
      0085E6 CD 82 88         [ 4] 1186 	call	_rf_switch_bank
      0085E9 84               [ 1] 1187 	pop	a
      0085EA 5B 15            [ 2] 1188 	addw	sp, #21
      0085EC 81               [ 4] 1189 	ret
                                   1190 ;	joysticksend.c: 399: void SE8R01_Init()  
                                   1191 ;	-----------------------------------------
                                   1192 ;	 function SE8R01_Init
                                   1193 ;	-----------------------------------------
      0085ED                       1194 _SE8R01_Init:
      0085ED 52 05            [ 2] 1195 	sub	sp, #5
                                   1196 ;	joysticksend.c: 402: SE8R01_Calibration();   
      0085EF CD 82 A5         [ 4] 1197 	call	_SE8R01_Calibration
                                   1198 ;	joysticksend.c: 403: SE8R01_Analog_Init();   
      0085F2 CD 84 71         [ 4] 1199 	call	_SE8R01_Analog_Init
                                   1200 ;	joysticksend.c: 407: if (SE8R01_DR_2M==1)
      0085F5 CE 00 10         [ 2] 1201 	ldw	x, _SE8R01_DR_2M+0
      0085F8 A3 00 01         [ 2] 1202 	cpw	x, #0x0001
      0085FB 26 07            [ 1] 1203 	jrne	00105$
                                   1204 ;	joysticksend.c: 408: {  temp[0]=0b01001111; }     //2MHz,+5dbm
      0085FD 96               [ 1] 1205 	ldw	x, sp
      0085FE 5C               [ 2] 1206 	incw	x
      0085FF A6 4F            [ 1] 1207 	ld	a, #0x4f
      008601 F7               [ 1] 1208 	ld	(x), a
      008602 20 14            [ 2] 1209 	jra	00106$
      008604                       1210 00105$:
                                   1211 ;	joysticksend.c: 409: else if  (SE8R01_DR_1M==1)
      008604 CE 00 12         [ 2] 1212 	ldw	x, _SE8R01_DR_1M+0
      008607 A3 00 01         [ 2] 1213 	cpw	x, #0x0001
      00860A 26 07            [ 1] 1214 	jrne	00102$
                                   1215 ;	joysticksend.c: 410: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
      00860C 96               [ 1] 1216 	ldw	x, sp
      00860D 5C               [ 2] 1217 	incw	x
      00860E A6 47            [ 1] 1218 	ld	a, #0x47
      008610 F7               [ 1] 1219 	ld	(x), a
      008611 20 05            [ 2] 1220 	jra	00106$
      008613                       1221 00102$:
                                   1222 ;	joysticksend.c: 412: {temp[0]=0b01101111;  }     //500K,+5dbm
      008613 96               [ 1] 1223 	ldw	x, sp
      008614 5C               [ 2] 1224 	incw	x
      008615 A6 6F            [ 1] 1225 	ld	a, #0x6f
      008617 F7               [ 1] 1226 	ld	(x), a
      008618                       1227 00106$:
                                   1228 ;	joysticksend.c: 414: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      008618 96               [ 1] 1229 	ldw	x, sp
      008619 5C               [ 2] 1230 	incw	x
      00861A 4B 01            [ 1] 1231 	push	#0x01
      00861C 89               [ 2] 1232 	pushw	x
      00861D 4B 26            [ 1] 1233 	push	#0x26
      00861F CD 81 48         [ 4] 1234 	call	_write_spi_buf
      008622 5B 04            [ 2] 1235 	addw	sp, #4
                                   1236 ;	joysticksend.c: 416: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0x01);          //enable auto acc on pip 1
      008624 4B 01            [ 1] 1237 	push	#0x01
      008626 4B 21            [ 1] 1238 	push	#0x21
      008628 CD 80 CE         [ 4] 1239 	call	_write_spi_reg
      00862B 5B 02            [ 2] 1240 	addw	sp, #2
                                   1241 ;	joysticksend.c: 417: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0x01);      //enable pip 1
      00862D 4B 01            [ 1] 1242 	push	#0x01
      00862F 4B 22            [ 1] 1243 	push	#0x22
      008631 CD 80 CE         [ 4] 1244 	call	_write_spi_reg
      008634 5B 02            [ 2] 1245 	addw	sp, #2
                                   1246 ;	joysticksend.c: 418: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);        //4 byte adress
      008636 4B 02            [ 1] 1247 	push	#0x02
      008638 4B 23            [ 1] 1248 	push	#0x23
      00863A CD 80 CE         [ 4] 1249 	call	_write_spi_reg
      00863D 5B 02            [ 2] 1250 	addw	sp, #2
                                   1251 ;	joysticksend.c: 419: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_RETR, 0x08);        //lowest 4 bits 0-15 rt transmisston higest 4 bits 256-4096us Auto Retransmit Delay
      00863F 4B 08            [ 1] 1252 	push	#0x08
      008641 4B 24            [ 1] 1253 	push	#0x24
      008643 CD 80 CE         [ 4] 1254 	call	_write_spi_reg
      008646 5B 02            [ 2] 1255 	addw	sp, #2
                                   1256 ;	joysticksend.c: 420: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
      008648 4B 28            [ 1] 1257 	push	#0x28
      00864A 4B 25            [ 1] 1258 	push	#0x25
      00864C CD 80 CE         [ 4] 1259 	call	_write_spi_reg
      00864F 5B 02            [ 2] 1260 	addw	sp, #2
                                   1261 ;	joysticksend.c: 421: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0x01);          //pipe0 pipe1 enable dynamic payload length data
      008651 4B 01            [ 1] 1262 	push	#0x01
      008653 4B 3C            [ 1] 1263 	push	#0x3c
      008655 CD 80 CE         [ 4] 1264 	call	_write_spi_reg
      008658 5B 02            [ 2] 1265 	addw	sp, #2
                                   1266 ;	joysticksend.c: 422: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
      00865A 4B 07            [ 1] 1267 	push	#0x07
      00865C 4B 3D            [ 1] 1268 	push	#0x3d
      00865E CD 80 CE         [ 4] 1269 	call	_write_spi_reg
      008661 5B 02            [ 2] 1270 	addw	sp, #2
                                   1271 ;	joysticksend.c: 423: write_spi_reg(WRITE_REG + CONFIG, 0x3E);
      008663 4B 3E            [ 1] 1272 	push	#0x3e
      008665 4B 20            [ 1] 1273 	push	#0x20
      008667 CD 80 CE         [ 4] 1274 	call	_write_spi_reg
      00866A 5B 02            [ 2] 1275 	addw	sp, #2
                                   1276 ;	joysticksend.c: 424: write_spi_buf(WRITE_REG + TX_ADDR, TX_ADDRESS, ADR_WIDTH);  //from tx
      00866C AE 00 1E         [ 2] 1277 	ldw	x, #_TX_ADDRESS+0
      00866F 90 93            [ 1] 1278 	ldw	y, x
      008671 89               [ 2] 1279 	pushw	x
      008672 4B 04            [ 1] 1280 	push	#0x04
      008674 90 89            [ 2] 1281 	pushw	y
      008676 4B 30            [ 1] 1282 	push	#0x30
      008678 CD 81 48         [ 4] 1283 	call	_write_spi_buf
      00867B 5B 04            [ 2] 1284 	addw	sp, #4
      00867D 85               [ 2] 1285 	popw	x
                                   1286 ;	joysticksend.c: 426: write_spi_buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Use the same address on the RX device as the TX device write_spi_reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
      00867E 4B 04            [ 1] 1287 	push	#0x04
      008680 89               [ 2] 1288 	pushw	x
      008681 4B 2A            [ 1] 1289 	push	#0x2a
      008683 CD 81 48         [ 4] 1290 	call	_write_spi_buf
      008686 5B 04            [ 2] 1291 	addw	sp, #4
                                   1292 ;	joysticksend.c: 429: PC_ODR |= (1 << CE);
      008688 AE 50 0A         [ 2] 1293 	ldw	x, #0x500a
      00868B F6               [ 1] 1294 	ld	a, (x)
      00868C AA 10            [ 1] 1295 	or	a, #0x10
      00868E F7               [ 1] 1296 	ld	(x), a
      00868F 5B 05            [ 2] 1297 	addw	sp, #5
      008691 81               [ 4] 1298 	ret
                                   1299 ;	joysticksend.c: 435: int main () {
                                   1300 ;	-----------------------------------------
                                   1301 ;	 function main
                                   1302 ;	-----------------------------------------
      008692                       1303 _main:
      008692 52 42            [ 2] 1304 	sub	sp, #66
                                   1305 ;	joysticksend.c: 440: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
      008694 90 96            [ 1] 1306 	ldw	y, sp
      008696 72 A9 00 28      [ 2] 1307 	addw	y, #40
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
                                   1325 ;	joysticksend.c: 441: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
      0086B3 90 96            [ 1] 1326 	ldw	y, sp
      0086B5 72 A9 00 23      [ 2] 1327 	addw	y, #35
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
                                   1346 ;	joysticksend.c: 444: InitializeSystemClock();
      0086D4 CD 81 E4         [ 4] 1347 	call	_InitializeSystemClock
                                   1348 ;	joysticksend.c: 451: PD_DDR |= (1 << 2) ; // output mode
      0086D7 AE 50 11         [ 2] 1349 	ldw	x, #0x5011
      0086DA F6               [ 1] 1350 	ld	a, (x)
      0086DB AA 04            [ 1] 1351 	or	a, #0x04
      0086DD F7               [ 1] 1352 	ld	(x), a
                                   1353 ;	joysticksend.c: 452: PD_CR1 |= (1 << 2) ; // push-pull
      0086DE AE 50 12         [ 2] 1354 	ldw	x, #0x5012
      0086E1 F6               [ 1] 1355 	ld	a, (x)
      0086E2 AA 04            [ 1] 1356 	or	a, #0x04
      0086E4 F7               [ 1] 1357 	ld	(x), a
                                   1358 ;	joysticksend.c: 454: PD_ODR &= ~(1 << 2);
      0086E5 AE 50 0F         [ 2] 1359 	ldw	x, #0x500f
      0086E8 F6               [ 1] 1360 	ld	a, (x)
      0086E9 A4 FB            [ 1] 1361 	and	a, #0xfb
      0086EB F7               [ 1] 1362 	ld	(x), a
                                   1363 ;	joysticksend.c: 459: PD_DDR &= ~(1<<4);
      0086EC AE 50 11         [ 2] 1364 	ldw	x, #0x5011
      0086EF F6               [ 1] 1365 	ld	a, (x)
      0086F0 A4 EF            [ 1] 1366 	and	a, #0xef
      0086F2 F7               [ 1] 1367 	ld	(x), a
                                   1368 ;	joysticksend.c: 460: PD_CR1 |= (1<<4);
      0086F3 AE 50 12         [ 2] 1369 	ldw	x, #0x5012
      0086F6 F6               [ 1] 1370 	ld	a, (x)
      0086F7 AA 10            [ 1] 1371 	or	a, #0x10
      0086F9 F7               [ 1] 1372 	ld	(x), a
                                   1373 ;	joysticksend.c: 469: InitializeSPI ();
      0086FA CD 81 BC         [ 4] 1374 	call	_InitializeSPI
                                   1375 ;	joysticksend.c: 472: memset (tx_payload, 0, sizeof(tx_payload));
      0086FD 96               [ 1] 1376 	ldw	x, sp
      0086FE 5C               [ 2] 1377 	incw	x
      0086FF 5C               [ 2] 1378 	incw	x
      008700 1F 3B            [ 2] 1379 	ldw	(0x3b, sp), x
      008702 16 3B            [ 2] 1380 	ldw	y, (0x3b, sp)
      008704 4B 21            [ 1] 1381 	push	#0x21
      008706 4B 00            [ 1] 1382 	push	#0x00
      008708 5F               [ 1] 1383 	clrw	x
      008709 89               [ 2] 1384 	pushw	x
      00870A 90 89            [ 2] 1385 	pushw	y
      00870C CD 88 C8         [ 4] 1386 	call	_memset
      00870F 5B 06            [ 2] 1387 	addw	sp, #6
                                   1388 ;	joysticksend.c: 475: init_io();                        // Initialize IO port
      008711 CD 82 79         [ 4] 1389 	call	_init_io
                                   1390 ;	joysticksend.c: 476: write_spi_reg(FLUSH_TX,0); // transmit -- send data 
      008714 4B 00            [ 1] 1391 	push	#0x00
      008716 4B E1            [ 1] 1392 	push	#0xe1
      008718 CD 80 CE         [ 4] 1393 	call	_write_spi_reg
      00871B 5B 02            [ 2] 1394 	addw	sp, #2
                                   1395 ;	joysticksend.c: 477: readstatus = read_spi_reg(CONFIG);
      00871D 4B 00            [ 1] 1396 	push	#0x00
      00871F CD 81 0A         [ 4] 1397 	call	_read_spi_reg
      008722 84               [ 1] 1398 	pop	a
                                   1399 ;	joysticksend.c: 478: readstatus = read_spi_reg(STATUS);
      008723 4B 07            [ 1] 1400 	push	#0x07
      008725 CD 81 0A         [ 4] 1401 	call	_read_spi_reg
      008728 84               [ 1] 1402 	pop	a
                                   1403 ;	joysticksend.c: 480: SE8R01_Init();
      008729 CD 85 ED         [ 4] 1404 	call	_SE8R01_Init
                                   1405 ;	joysticksend.c: 484: while (1) {
      00872C                       1406 00110$:
                                   1407 ;	joysticksend.c: 488: xaxis=0;
      00872C 5F               [ 1] 1408 	clrw	x
      00872D 1F 39            [ 2] 1409 	ldw	(0x39, sp), x
                                   1410 ;	joysticksend.c: 489: yaxis=0;
      00872F 5F               [ 1] 1411 	clrw	x
      008730 1F 3F            [ 2] 1412 	ldw	(0x3f, sp), x
                                   1413 ;	joysticksend.c: 490: joyswitch = PD_IDR & (1<<4);
      008732 AE 50 10         [ 2] 1414 	ldw	x, #0x5010
      008735 F6               [ 1] 1415 	ld	a, (x)
      008736 A4 10            [ 1] 1416 	and	a, #0x10
      008738 6B 01            [ 1] 1417 	ld	(0x01, sp), a
                                   1418 ;	joysticksend.c: 492: if (joyswitch == 1) PD_ODR &= ~(1 << 2); //switch led on port PD2 on
      00873A 7B 01            [ 1] 1419 	ld	a, (0x01, sp)
      00873C A1 01            [ 1] 1420 	cp	a, #0x01
      00873E 26 07            [ 1] 1421 	jrne	00102$
      008740 AE 50 0F         [ 2] 1422 	ldw	x, #0x500f
      008743 F6               [ 1] 1423 	ld	a, (x)
      008744 A4 FB            [ 1] 1424 	and	a, #0xfb
      008746 F7               [ 1] 1425 	ld	(x), a
      008747                       1426 00102$:
                                   1427 ;	joysticksend.c: 494: ADC_CSR |= ((0x0F)&5); // select channel = 5 = PD5
      008747 AE 54 00         [ 2] 1428 	ldw	x, #0x5400
      00874A F6               [ 1] 1429 	ld	a, (x)
      00874B AA 05            [ 1] 1430 	or	a, #0x05
      00874D F7               [ 1] 1431 	ld	(x), a
                                   1432 ;	joysticksend.c: 495: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      00874E AE 54 02         [ 2] 1433 	ldw	x, #0x5402
      008751 F6               [ 1] 1434 	ld	a, (x)
      008752 AA 08            [ 1] 1435 	or	a, #0x08
      008754 F7               [ 1] 1436 	ld	(x), a
                                   1437 ;	joysticksend.c: 496: ADC_CR1 |= ADC_ADON; // ADC ON
      008755 72 10 54 01      [ 1] 1438 	bset	0x5401, #0
                                   1439 ;	joysticksend.c: 497: ADC_CR1 |= ADC_ADON; // start conversion 
      008759 72 10 54 01      [ 1] 1440 	bset	0x5401, #0
                                   1441 ;	joysticksend.c: 498: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      00875D                       1442 00103$:
      00875D AE 54 00         [ 2] 1443 	ldw	x, #0x5400
      008760 F6               [ 1] 1444 	ld	a, (x)
      008761 48               [ 1] 1445 	sll	a
      008762 24 F9            [ 1] 1446 	jrnc	00103$
                                   1447 ;	joysticksend.c: 500: xaxis |= (unsigned int)ADC_DRL;
      008764 AE 54 05         [ 2] 1448 	ldw	x, #0x5405
      008767 F6               [ 1] 1449 	ld	a, (x)
      008768 02               [ 1] 1450 	rlwa	x
      008769 4F               [ 1] 1451 	clr	a
      00876A 01               [ 1] 1452 	rrwa	x
      00876B 16 39            [ 2] 1453 	ldw	y, (0x39, sp)
      00876D 17 3D            [ 2] 1454 	ldw	(0x3d, sp), y
      00876F 1A 3E            [ 1] 1455 	or	a, (0x3e, sp)
      008771 90 97            [ 1] 1456 	ld	yl, a
      008773 9E               [ 1] 1457 	ld	a, xh
      008774 1A 3D            [ 1] 1458 	or	a, (0x3d, sp)
      008776 90 95            [ 1] 1459 	ld	yh, a
                                   1460 ;	joysticksend.c: 501: xaxis |= (unsigned int)ADC_DRH<<8;
      008778 AE 54 04         [ 2] 1461 	ldw	x, #0x5404
      00877B F6               [ 1] 1462 	ld	a, (x)
      00877C 5F               [ 1] 1463 	clrw	x
      00877D 97               [ 1] 1464 	ld	xl, a
      00877E 58               [ 2] 1465 	sllw	x
      00877F 58               [ 2] 1466 	sllw	x
      008780 58               [ 2] 1467 	sllw	x
      008781 58               [ 2] 1468 	sllw	x
      008782 58               [ 2] 1469 	sllw	x
      008783 58               [ 2] 1470 	sllw	x
      008784 58               [ 2] 1471 	sllw	x
      008785 58               [ 2] 1472 	sllw	x
      008786 17 37            [ 2] 1473 	ldw	(0x37, sp), y
      008788 9F               [ 1] 1474 	ld	a, xl
      008789 1A 38            [ 1] 1475 	or	a, (0x38, sp)
      00878B 90 97            [ 1] 1476 	ld	yl, a
      00878D 9E               [ 1] 1477 	ld	a, xh
      00878E 1A 37            [ 1] 1478 	or	a, (0x37, sp)
      008790 90 95            [ 1] 1479 	ld	yh, a
                                   1480 ;	joysticksend.c: 503: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      008792 AE 54 01         [ 2] 1481 	ldw	x, #0x5401
      008795 F6               [ 1] 1482 	ld	a, (x)
      008796 A4 FE            [ 1] 1483 	and	a, #0xfe
      008798 F7               [ 1] 1484 	ld	(x), a
                                   1485 ;	joysticksend.c: 504: xaxis &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
      008799 90 9E            [ 1] 1486 	ld	a, yh
      00879B A4 03            [ 1] 1487 	and	a, #0x03
      00879D 90 95            [ 1] 1488 	ld	yh, a
      00879F 17 35            [ 2] 1489 	ldw	(0x35, sp), y
                                   1490 ;	joysticksend.c: 506: ADC_CSR |= ((0x0F)&6); // select channel = 6 = PD6
      0087A1 AE 54 00         [ 2] 1491 	ldw	x, #0x5400
      0087A4 F6               [ 1] 1492 	ld	a, (x)
      0087A5 AA 06            [ 1] 1493 	or	a, #0x06
      0087A7 F7               [ 1] 1494 	ld	(x), a
                                   1495 ;	joysticksend.c: 507: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      0087A8 AE 54 02         [ 2] 1496 	ldw	x, #0x5402
      0087AB F6               [ 1] 1497 	ld	a, (x)
      0087AC AA 08            [ 1] 1498 	or	a, #0x08
      0087AE F7               [ 1] 1499 	ld	(x), a
                                   1500 ;	joysticksend.c: 508: ADC_CR1 |= ADC_ADON; // ADC ON
      0087AF 72 10 54 01      [ 1] 1501 	bset	0x5401, #0
                                   1502 ;	joysticksend.c: 509: ADC_CR1 |= ADC_ADON; // start conversion 
      0087B3 72 10 54 01      [ 1] 1503 	bset	0x5401, #0
                                   1504 ;	joysticksend.c: 510: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      0087B7                       1505 00106$:
      0087B7 AE 54 00         [ 2] 1506 	ldw	x, #0x5400
      0087BA F6               [ 1] 1507 	ld	a, (x)
      0087BB 48               [ 1] 1508 	sll	a
      0087BC 24 F9            [ 1] 1509 	jrnc	00106$
                                   1510 ;	joysticksend.c: 512: yaxis |= (unsigned int)ADC_DRL;
      0087BE AE 54 05         [ 2] 1511 	ldw	x, #0x5405
      0087C1 F6               [ 1] 1512 	ld	a, (x)
      0087C2 02               [ 1] 1513 	rlwa	x
      0087C3 4F               [ 1] 1514 	clr	a
      0087C4 01               [ 1] 1515 	rrwa	x
      0087C5 16 3F            [ 2] 1516 	ldw	y, (0x3f, sp)
      0087C7 17 33            [ 2] 1517 	ldw	(0x33, sp), y
      0087C9 1A 34            [ 1] 1518 	or	a, (0x34, sp)
      0087CB 90 97            [ 1] 1519 	ld	yl, a
      0087CD 9E               [ 1] 1520 	ld	a, xh
      0087CE 1A 33            [ 1] 1521 	or	a, (0x33, sp)
      0087D0 90 95            [ 1] 1522 	ld	yh, a
                                   1523 ;	joysticksend.c: 513: yaxis |= (unsigned int)ADC_DRH<<8;
      0087D2 AE 54 04         [ 2] 1524 	ldw	x, #0x5404
      0087D5 F6               [ 1] 1525 	ld	a, (x)
      0087D6 5F               [ 1] 1526 	clrw	x
      0087D7 97               [ 1] 1527 	ld	xl, a
      0087D8 58               [ 2] 1528 	sllw	x
      0087D9 58               [ 2] 1529 	sllw	x
      0087DA 58               [ 2] 1530 	sllw	x
      0087DB 58               [ 2] 1531 	sllw	x
      0087DC 58               [ 2] 1532 	sllw	x
      0087DD 58               [ 2] 1533 	sllw	x
      0087DE 58               [ 2] 1534 	sllw	x
      0087DF 58               [ 2] 1535 	sllw	x
      0087E0 17 31            [ 2] 1536 	ldw	(0x31, sp), y
      0087E2 9F               [ 1] 1537 	ld	a, xl
      0087E3 1A 32            [ 1] 1538 	or	a, (0x32, sp)
      0087E5 90 97            [ 1] 1539 	ld	yl, a
      0087E7 9E               [ 1] 1540 	ld	a, xh
      0087E8 1A 31            [ 1] 1541 	or	a, (0x31, sp)
      0087EA 90 95            [ 1] 1542 	ld	yh, a
                                   1543 ;	joysticksend.c: 515: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      0087EC AE 54 01         [ 2] 1544 	ldw	x, #0x5401
      0087EF F6               [ 1] 1545 	ld	a, (x)
      0087F0 A4 FE            [ 1] 1546 	and	a, #0xfe
      0087F2 F7               [ 1] 1547 	ld	(x), a
                                   1548 ;	joysticksend.c: 516: yaxis &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
      0087F3 90 9E            [ 1] 1549 	ld	a, yh
      0087F5 A4 03            [ 1] 1550 	and	a, #0x03
      0087F7 90 95            [ 1] 1551 	ld	yh, a
                                   1552 ;	joysticksend.c: 521: tx_payload[0] = 0xac; //first two is unique ID for this emitter 
      0087F9 1E 3B            [ 2] 1553 	ldw	x, (0x3b, sp)
      0087FB A6 AC            [ 1] 1554 	ld	a, #0xac
      0087FD F7               [ 1] 1555 	ld	(x), a
                                   1556 ;	joysticksend.c: 522: tx_payload[1] = 0xcc;
      0087FE 1E 3B            [ 2] 1557 	ldw	x, (0x3b, sp)
      008800 5C               [ 2] 1558 	incw	x
      008801 A6 CC            [ 1] 1559 	ld	a, #0xcc
      008803 F7               [ 1] 1560 	ld	(x), a
                                   1561 ;	joysticksend.c: 523: tx_payload[2] = xaxis>>8;
      008804 1E 3B            [ 2] 1562 	ldw	x, (0x3b, sp)
      008806 5C               [ 2] 1563 	incw	x
      008807 5C               [ 2] 1564 	incw	x
      008808 1F 2F            [ 2] 1565 	ldw	(0x2f, sp), x
      00880A 1E 35            [ 2] 1566 	ldw	x, (0x35, sp)
      00880C 57               [ 2] 1567 	sraw	x
      00880D 57               [ 2] 1568 	sraw	x
      00880E 57               [ 2] 1569 	sraw	x
      00880F 57               [ 2] 1570 	sraw	x
      008810 57               [ 2] 1571 	sraw	x
      008811 57               [ 2] 1572 	sraw	x
      008812 57               [ 2] 1573 	sraw	x
      008813 57               [ 2] 1574 	sraw	x
      008814 9F               [ 1] 1575 	ld	a, xl
      008815 1E 2F            [ 2] 1576 	ldw	x, (0x2f, sp)
      008817 F7               [ 1] 1577 	ld	(x), a
                                   1578 ;	joysticksend.c: 524: tx_payload[3] = xaxis & 0x00ff; 
      008818 1E 3B            [ 2] 1579 	ldw	x, (0x3b, sp)
      00881A 1C 00 03         [ 2] 1580 	addw	x, #0x0003
      00881D 7B 36            [ 1] 1581 	ld	a, (0x36, sp)
      00881F 88               [ 1] 1582 	push	a
      008820 0F 2E            [ 1] 1583 	clr	(0x2e, sp)
      008822 84               [ 1] 1584 	pop	a
      008823 F7               [ 1] 1585 	ld	(x), a
                                   1586 ;	joysticksend.c: 525: tx_payload[4] = yaxis>>8;
      008824 1E 3B            [ 2] 1587 	ldw	x, (0x3b, sp)
      008826 1C 00 04         [ 2] 1588 	addw	x, #0x0004
      008829 1F 41            [ 2] 1589 	ldw	(0x41, sp), x
      00882B 93               [ 1] 1590 	ldw	x, y
      00882C 57               [ 2] 1591 	sraw	x
      00882D 57               [ 2] 1592 	sraw	x
      00882E 57               [ 2] 1593 	sraw	x
      00882F 57               [ 2] 1594 	sraw	x
      008830 57               [ 2] 1595 	sraw	x
      008831 57               [ 2] 1596 	sraw	x
      008832 57               [ 2] 1597 	sraw	x
      008833 57               [ 2] 1598 	sraw	x
      008834 9F               [ 1] 1599 	ld	a, xl
      008835 1E 41            [ 2] 1600 	ldw	x, (0x41, sp)
      008837 F7               [ 1] 1601 	ld	(x), a
                                   1602 ;	joysticksend.c: 526: tx_payload[5] = yaxis & 0x00ff; 
      008838 1E 3B            [ 2] 1603 	ldw	x, (0x3b, sp)
      00883A 1C 00 05         [ 2] 1604 	addw	x, #0x0005
      00883D 4F               [ 1] 1605 	clr	a
      00883E 90 9F            [ 1] 1606 	ld	a, yl
      008840 F7               [ 1] 1607 	ld	(x), a
                                   1608 ;	joysticksend.c: 527: tx_payload[6] = joyswitch; 
      008841 1E 3B            [ 2] 1609 	ldw	x, (0x3b, sp)
      008843 7B 01            [ 1] 1610 	ld	a, (0x01, sp)
      008845 E7 06            [ 1] 1611 	ld	(0x0006, x), a
                                   1612 ;	joysticksend.c: 528: write_spi_buf(iRF_CMD_WR_TX_PLOAD, tx_payload, 7);
      008847 1E 3B            [ 2] 1613 	ldw	x, (0x3b, sp)
      008849 4B 07            [ 1] 1614 	push	#0x07
      00884B 89               [ 2] 1615 	pushw	x
      00884C 4B A0            [ 1] 1616 	push	#0xa0
      00884E CD 81 48         [ 4] 1617 	call	_write_spi_buf
      008851 5B 04            [ 2] 1618 	addw	sp, #4
                                   1619 ;	joysticksend.c: 529: write_spi_reg(WRITE_REG+STATUS, 0xff);
      008853 4B FF            [ 1] 1620 	push	#0xff
      008855 4B 27            [ 1] 1621 	push	#0x27
      008857 CD 80 CE         [ 4] 1622 	call	_write_spi_reg
      00885A 5B 02            [ 2] 1623 	addw	sp, #2
                                   1624 ;	joysticksend.c: 536: delay(4);
      00885C 4B 04            [ 1] 1625 	push	#0x04
      00885E 4B 00            [ 1] 1626 	push	#0x00
      008860 CD 82 2E         [ 4] 1627 	call	_delay
      008863 5B 02            [ 2] 1628 	addw	sp, #2
                                   1629 ;	joysticksend.c: 537: PD_ODR &= ~(1 << 2); //switch led on pd2 off
      008865 AE 50 0F         [ 2] 1630 	ldw	x, #0x500f
      008868 F6               [ 1] 1631 	ld	a, (x)
      008869 A4 FB            [ 1] 1632 	and	a, #0xfb
      00886B F7               [ 1] 1633 	ld	(x), a
      00886C CC 87 2C         [ 2] 1634 	jp	00110$
      00886F 5B 42            [ 2] 1635 	addw	sp, #66
      008871 81               [ 4] 1636 	ret
                                   1637 	.area CODE
                                   1638 	.area INITIALIZER
      0088E7                       1639 __xinit__SE8R01_DR_2M:
      0088E7 00 00                 1640 	.dw #0x0000
      0088E9                       1641 __xinit__SE8R01_DR_1M:
      0088E9 00 00                 1642 	.dw #0x0000
      0088EB                       1643 __xinit__SE8R01_DR_500K:
      0088EB 00 01                 1644 	.dw #0x0001
      0088ED                       1645 __xinit__pload_width_now:
      0088ED 00 00                 1646 	.dw #0x0000
      0088EF                       1647 __xinit__newdata:
      0088EF 00 00                 1648 	.dw #0x0000
      0088F1                       1649 __xinit__signal_lv:
      0088F1 00                    1650 	.db #0x00	;  0
      0088F2                       1651 __xinit__pip:
      0088F2 00 00                 1652 	.dw #0x0000
      0088F4                       1653 __xinit__status:
      0088F4 00                    1654 	.db #0x00	; 0
      0088F5                       1655 __xinit__TX_ADDRESS:
      0088F5 B3                    1656 	.db #0xB3	; 179
      0088F6 43                    1657 	.db #0x43	; 67	'C'
      0088F7 10                    1658 	.db #0x10	; 16
      0088F8 10                    1659 	.db #0x10	; 16
      0088F9                       1660 __xinit__ADDRESS2:
      0088F9 B1                    1661 	.db #0xB1	; 177
      0088FA                       1662 __xinit__ADDRESS3:
      0088FA B2                    1663 	.db #0xB2	; 178
      0088FB                       1664 __xinit__ADDRESS4:
      0088FB B3                    1665 	.db #0xB3	; 179
      0088FC                       1666 __xinit__ADDRESS5:
      0088FC B4                    1667 	.db #0xB4	; 180
      0088FD                       1668 __xinit__ADDRESS1:
      0088FD B0                    1669 	.db #0xB0	; 176
      0088FE 43                    1670 	.db #0x43	; 67	'C'
      0088FF 10                    1671 	.db #0x10	; 16
      008900 10                    1672 	.db #0x10	; 16
      008901                       1673 __xinit__ADDRESS0:
      008901 34                    1674 	.db #0x34	; 52	'4'
      008902 43                    1675 	.db #0x43	; 67	'C'
      008903 10                    1676 	.db #0x10	; 16
      008904 10                    1677 	.db #0x10	; 16
      008905                       1678 __xinit__rx_buf:
      008905 00                    1679 	.db #0x00	; 0
      008906 00                    1680 	.db 0x00
      008907 00                    1681 	.db 0x00
      008908 00                    1682 	.db 0x00
      008909 00                    1683 	.db 0x00
      00890A 00                    1684 	.db 0x00
      00890B 00                    1685 	.db 0x00
      00890C 00                    1686 	.db 0x00
      00890D 00                    1687 	.db 0x00
      00890E 00                    1688 	.db 0x00
      00890F 00                    1689 	.db 0x00
      008910 00                    1690 	.db 0x00
      008911 00                    1691 	.db 0x00
      008912 00                    1692 	.db 0x00
      008913 00                    1693 	.db 0x00
      008914 00                    1694 	.db 0x00
      008915 00                    1695 	.db 0x00
      008916 00                    1696 	.db 0x00
      008917 00                    1697 	.db 0x00
      008918 00                    1698 	.db 0x00
      008919 00                    1699 	.db 0x00
      00891A 00                    1700 	.db 0x00
      00891B 00                    1701 	.db 0x00
      00891C 00                    1702 	.db 0x00
      00891D 00                    1703 	.db 0x00
      00891E 00                    1704 	.db 0x00
      00891F 00                    1705 	.db 0x00
      008920 00                    1706 	.db 0x00
      008921 00                    1707 	.db 0x00
      008922 00                    1708 	.db 0x00
      008923 00                    1709 	.db 0x00
      008924 00                    1710 	.db 0x00
      008925                       1711 __xinit__tx_buf:
      008925 00                    1712 	.db #0x00	; 0
      008926 00                    1713 	.db 0x00
      008927 00                    1714 	.db 0x00
      008928 00                    1715 	.db 0x00
      008929 00                    1716 	.db 0x00
      00892A 00                    1717 	.db 0x00
      00892B 00                    1718 	.db 0x00
      00892C 00                    1719 	.db 0x00
      00892D 00                    1720 	.db 0x00
      00892E 00                    1721 	.db 0x00
      00892F 00                    1722 	.db 0x00
      008930 00                    1723 	.db 0x00
      008931 00                    1724 	.db 0x00
      008932 00                    1725 	.db 0x00
      008933 00                    1726 	.db 0x00
      008934 00                    1727 	.db 0x00
      008935 00                    1728 	.db 0x00
      008936 00                    1729 	.db 0x00
      008937 00                    1730 	.db 0x00
      008938 00                    1731 	.db 0x00
      008939 00                    1732 	.db 0x00
      00893A 00                    1733 	.db 0x00
      00893B 00                    1734 	.db 0x00
      00893C 00                    1735 	.db 0x00
      00893D 00                    1736 	.db 0x00
      00893E 00                    1737 	.db 0x00
      00893F 00                    1738 	.db 0x00
      008940 00                    1739 	.db 0x00
      008941 00                    1740 	.db 0x00
      008942 00                    1741 	.db 0x00
      008943 00                    1742 	.db 0x00
      008944 00                    1743 	.db 0x00
                                   1744 	.area CABS (ABS)
