                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Mon Feb  5 12:41:49 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module joysticksend
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _timer_isr
                                     15 	.globl _clock
                                     16 	.globl _tm1637DisplayDecimal
                                     17 	.globl _tm1637Init
                                     18 	.globl _InitializeUART
                                     19 	.globl _InitializeI2C
                                     20 	.globl _i2c_read_register
                                     21 	.globl _print_byte_hex
                                     22 	.globl _i2c_set_start_ack
                                     23 	.globl _i2c_send_address
                                     24 	.globl _print_UCHAR_hex
                                     25 	.globl _UARTPrintF
                                     26 	.globl _i2c_send_reg
                                     27 	.globl _i2c_set_stop
                                     28 	.globl _i2c_set_nak
                                     29 	.globl _i2c_read
                                     30 	.globl _delay
                                     31 	.globl _InitializeSystemClock
                                     32 	.globl _delayTenMicro
                                     33 	.globl _minuten
                                     34 	.globl _seconden
                                     35 	.globl _internteller
                                     36 	.globl _tm1637SetBrightness
                                     37 	.globl __tm1637Start
                                     38 	.globl __tm1637Stop
                                     39 	.globl __tm1637ReadResult
                                     40 	.globl __tm1637WriteByte
                                     41 	.globl __tm1637ClkHigh
                                     42 	.globl __tm1637ClkLow
                                     43 	.globl __tm1637DioHigh
                                     44 	.globl __tm1637DioLow
                                     45 ;--------------------------------------------------------
                                     46 ; ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DATA
      000001                         49 _internteller::
      000001                         50 	.ds 2
      000003                         51 _seconden::
      000003                         52 	.ds 2
      000005                         53 _minuten::
      000005                         54 	.ds 2
                                     55 ;--------------------------------------------------------
                                     56 ; ram data
                                     57 ;--------------------------------------------------------
                                     58 	.area INITIALIZED
                                     59 ;--------------------------------------------------------
                                     60 ; Stack segment in internal ram 
                                     61 ;--------------------------------------------------------
                                     62 	.area	SSEG
      000000                         63 __start__stack:
      000000                         64 	.ds	1
                                     65 
                                     66 ;--------------------------------------------------------
                                     67 ; absolute external ram data
                                     68 ;--------------------------------------------------------
                                     69 	.area DABS (ABS)
                                     70 ;--------------------------------------------------------
                                     71 ; interrupt vector 
                                     72 ;--------------------------------------------------------
                                     73 	.area HOME
      008000                         74 __interrupt_vect:
      008000 82 00 80 83             75 	int s_GSINIT ;reset
      008004 82 00 00 00             76 	int 0x0000 ;trap
      008008 82 00 00 00             77 	int 0x0000 ;int0
      00800C 82 00 00 00             78 	int 0x0000 ;int1
      008010 82 00 00 00             79 	int 0x0000 ;int2
      008014 82 00 00 00             80 	int 0x0000 ;int3
      008018 82 00 00 00             81 	int 0x0000 ;int4
      00801C 82 00 00 00             82 	int 0x0000 ;int5
      008020 82 00 00 00             83 	int 0x0000 ;int6
      008024 82 00 00 00             84 	int 0x0000 ;int7
      008028 82 00 00 00             85 	int 0x0000 ;int8
      00802C 82 00 00 00             86 	int 0x0000 ;int9
      008030 82 00 00 00             87 	int 0x0000 ;int10
      008034 82 00 00 00             88 	int 0x0000 ;int11
      008038 82 00 00 00             89 	int 0x0000 ;int12
      00803C 82 00 00 00             90 	int 0x0000 ;int13
      008040 82 00 00 00             91 	int 0x0000 ;int14
      008044 82 00 00 00             92 	int 0x0000 ;int15
      008048 82 00 00 00             93 	int 0x0000 ;int16
      00804C 82 00 00 00             94 	int 0x0000 ;int17
      008050 82 00 00 00             95 	int 0x0000 ;int18
      008054 82 00 00 00             96 	int 0x0000 ;int19
      008058 82 00 00 00             97 	int 0x0000 ;int20
      00805C 82 00 00 00             98 	int 0x0000 ;int21
      008060 82 00 00 00             99 	int 0x0000 ;int22
      008064 82 00 85 00            100 	int _timer_isr ;int23
      008068 82 00 00 00            101 	int 0x0000 ;int24
      00806C 82 00 00 00            102 	int 0x0000 ;int25
      008070 82 00 00 00            103 	int 0x0000 ;int26
      008074 82 00 00 00            104 	int 0x0000 ;int27
      008078 82 00 00 00            105 	int 0x0000 ;int28
      00807C 82 00 00 00            106 	int 0x0000 ;int29
                                    107 ;--------------------------------------------------------
                                    108 ; global & static initialisations
                                    109 ;--------------------------------------------------------
                                    110 	.area HOME
                                    111 	.area GSINIT
                                    112 	.area GSFINAL
                                    113 	.area GSINIT
      008083                        114 __sdcc_gs_init_startup:
      008083                        115 __sdcc_init_data:
                                    116 ; stm8_genXINIT() start
      008083 AE 00 06         [ 2]  117 	ldw x, #l_DATA
      008086 27 07            [ 1]  118 	jreq	00002$
      008088                        119 00001$:
      008088 72 4F 00 00      [ 1]  120 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  121 	decw x
      00808D 26 F9            [ 1]  122 	jrne	00001$
      00808F                        123 00002$:
      00808F AE 00 00         [ 2]  124 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  125 	jreq	00004$
      008094                        126 00003$:
      008094 D6 86 78         [ 1]  127 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 06         [ 1]  128 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  129 	decw	x
      00809B 26 F7            [ 1]  130 	jrne	00003$
      00809D                        131 00004$:
                                    132 ; stm8_genXINIT() end
                                    133 	.area GSFINAL
      00809D CC 80 80         [ 2]  134 	jp	__sdcc_program_startup
                                    135 ;--------------------------------------------------------
                                    136 ; Home
                                    137 ;--------------------------------------------------------
                                    138 	.area HOME
                                    139 	.area HOME
      008080                        140 __sdcc_program_startup:
      008080 CC 85 3A         [ 2]  141 	jp	_main
                                    142 ;	return from main will return to caller
                                    143 ;--------------------------------------------------------
                                    144 ; code
                                    145 ;--------------------------------------------------------
                                    146 	.area CODE
                                    147 ;	joysticksend.c: 15: void delayTenMicro (void) {
                                    148 ;	-----------------------------------------
                                    149 ;	 function delayTenMicro
                                    150 ;	-----------------------------------------
      0080A0                        151 _delayTenMicro:
                                    152 ;	joysticksend.c: 17: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  153 	ld	a, #0x32
      0080A2                        154 00104$:
                                    155 ;	joysticksend.c: 18: __asm__("nop");
      0080A2 9D               [ 1]  156 	nop
      0080A3 4A               [ 1]  157 	dec	a
                                    158 ;	joysticksend.c: 17: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  159 	tnz	a
      0080A5 26 FB            [ 1]  160 	jrne	00104$
      0080A7 81               [ 4]  161 	ret
                                    162 ;	joysticksend.c: 21: void InitializeSystemClock() {
                                    163 ;	-----------------------------------------
                                    164 ;	 function InitializeSystemClock
                                    165 ;	-----------------------------------------
      0080A8                        166 _InitializeSystemClock:
                                    167 ;	joysticksend.c: 22: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  168 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  169 	clr	(x)
                                    170 ;	joysticksend.c: 23: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  171 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  172 	ld	a, #0x01
      0080B1 F7               [ 1]  173 	ld	(x), a
                                    174 ;	joysticksend.c: 24: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  175 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  176 	clr	(x)
                                    177 ;	joysticksend.c: 25: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        178 00101$:
      0080B6 AE 50 C0         [ 2]  179 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  180 	ld	a, (x)
      0080BA A5 02            [ 1]  181 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  182 	jreq	00101$
                                    183 ;	joysticksend.c: 26: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  184 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  185 	clr	(x)
                                    186 ;	joysticksend.c: 27: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  187 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  188 	ld	a, #0xff
      0080C7 F7               [ 1]  189 	ld	(x), a
                                    190 ;	joysticksend.c: 28: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  191 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  192 	ld	a, #0xff
      0080CD F7               [ 1]  193 	ld	(x), a
                                    194 ;	joysticksend.c: 29: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  195 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  196 	clr	(x)
                                    197 ;	joysticksend.c: 30: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  198 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  199 	clr	(x)
                                    200 ;	joysticksend.c: 31: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  201 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  202 	clr	(x)
                                    203 ;	joysticksend.c: 32: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  204 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  205 	ld	a, #0xe1
      0080DF F7               [ 1]  206 	ld	(x), a
                                    207 ;	joysticksend.c: 33: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  208 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  209 	clr	(x)
                                    210 ;	joysticksend.c: 34: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  211 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  212 	ld	a, #0x02
      0080E9 F7               [ 1]  213 	ld	(x), a
                                    214 ;	joysticksend.c: 35: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        215 00104$:
      0080EA AE 50 C5         [ 2]  216 	ldw	x, #0x50c5
      0080ED F6               [ 1]  217 	ld	a, (x)
      0080EE 44               [ 1]  218 	srl	a
      0080EF 25 F9            [ 1]  219 	jrc	00104$
      0080F1 81               [ 4]  220 	ret
                                    221 ;	joysticksend.c: 37: void delay (int time_ms) {
                                    222 ;	-----------------------------------------
                                    223 ;	 function delay
                                    224 ;	-----------------------------------------
      0080F2                        225 _delay:
      0080F2 52 0A            [ 2]  226 	sub	sp, #10
                                    227 ;	joysticksend.c: 39: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  228 	clrw	x
      0080F5 1F 03            [ 2]  229 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  230 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  231 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  232 	pushw	x
      0080FC 4B 0C            [ 1]  233 	push	#0x0c
      0080FE 4B 04            [ 1]  234 	push	#0x04
      008100 CD 86 23         [ 4]  235 	call	__mulint
      008103 5B 04            [ 2]  236 	addw	sp, #4
      008105 1F 09            [ 2]  237 	ldw	(0x09, sp), x
      008107                        238 00103$:
      008107 16 09            [ 2]  239 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  240 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  241 	ld	a, (0x07, sp)
      00810D 49               [ 1]  242 	rlc	a
      00810E 4F               [ 1]  243 	clr	a
      00810F A2 00            [ 1]  244 	sbc	a, #0x00
      008111 6B 06            [ 1]  245 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  246 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  247 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  248 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  250 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  251 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  252 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  253 	jrsge	00105$
                                    254 ;	joysticksend.c: 40: __asm__("nop");
      008123 9D               [ 1]  255 	nop
                                    256 ;	joysticksend.c: 39: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  257 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  258 	addw	y, #0x0001
      00812A 7B 02            [ 1]  259 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  260 	adc	a, #0x00
      00812E 97               [ 1]  261 	ld	xl, a
      00812F 7B 01            [ 1]  262 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  263 	adc	a, #0x00
      008133 95               [ 1]  264 	ld	xh, a
      008134 17 03            [ 2]  265 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  266 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  267 	jra	00103$
      00813A                        268 00105$:
      00813A 5B 0A            [ 2]  269 	addw	sp, #10
      00813C 81               [ 4]  270 	ret
                                    271 ;	joysticksend.c: 42: void i2c_read (unsigned char *x) {
                                    272 ;	-----------------------------------------
                                    273 ;	 function i2c_read
                                    274 ;	-----------------------------------------
      00813D                        275 _i2c_read:
                                    276 ;	joysticksend.c: 43: while ((I2C_SR1 & I2C_RXNE) == 0);
      00813D                        277 00101$:
      00813D AE 52 17         [ 2]  278 	ldw	x, #0x5217
      008140 F6               [ 1]  279 	ld	a, (x)
      008141 A5 40            [ 1]  280 	bcp	a, #0x40
      008143 27 F8            [ 1]  281 	jreq	00101$
                                    282 ;	joysticksend.c: 44: *x = I2C_DR;
      008145 16 03            [ 2]  283 	ldw	y, (0x03, sp)
      008147 AE 52 16         [ 2]  284 	ldw	x, #0x5216
      00814A F6               [ 1]  285 	ld	a, (x)
      00814B 90 F7            [ 1]  286 	ld	(y), a
      00814D 81               [ 4]  287 	ret
                                    288 ;	joysticksend.c: 46: void i2c_set_nak (void) {
                                    289 ;	-----------------------------------------
                                    290 ;	 function i2c_set_nak
                                    291 ;	-----------------------------------------
      00814E                        292 _i2c_set_nak:
                                    293 ;	joysticksend.c: 47: I2C_CR2 &= ~I2C_ACK;
      00814E AE 52 11         [ 2]  294 	ldw	x, #0x5211
      008151 F6               [ 1]  295 	ld	a, (x)
      008152 A4 FB            [ 1]  296 	and	a, #0xfb
      008154 F7               [ 1]  297 	ld	(x), a
      008155 81               [ 4]  298 	ret
                                    299 ;	joysticksend.c: 49: void i2c_set_stop (void) {
                                    300 ;	-----------------------------------------
                                    301 ;	 function i2c_set_stop
                                    302 ;	-----------------------------------------
      008156                        303 _i2c_set_stop:
                                    304 ;	joysticksend.c: 50: I2C_CR2 |= I2C_STOP;
      008156 AE 52 11         [ 2]  305 	ldw	x, #0x5211
      008159 F6               [ 1]  306 	ld	a, (x)
      00815A AA 02            [ 1]  307 	or	a, #0x02
      00815C F7               [ 1]  308 	ld	(x), a
      00815D 81               [ 4]  309 	ret
                                    310 ;	joysticksend.c: 52: void i2c_send_reg (UCHAR addr) {
                                    311 ;	-----------------------------------------
                                    312 ;	 function i2c_send_reg
                                    313 ;	-----------------------------------------
      00815E                        314 _i2c_send_reg:
      00815E 52 02            [ 2]  315 	sub	sp, #2
                                    316 ;	joysticksend.c: 54: reg = I2C_SR1;
      008160 AE 52 17         [ 2]  317 	ldw	x, #0x5217
      008163 F6               [ 1]  318 	ld	a, (x)
      008164 5F               [ 1]  319 	clrw	x
      008165 97               [ 1]  320 	ld	xl, a
      008166 1F 01            [ 2]  321 	ldw	(0x01, sp), x
                                    322 ;	joysticksend.c: 55: reg = I2C_SR3;
      008168 AE 52 19         [ 2]  323 	ldw	x, #0x5219
      00816B F6               [ 1]  324 	ld	a, (x)
      00816C 5F               [ 1]  325 	clrw	x
      00816D 97               [ 1]  326 	ld	xl, a
      00816E 1F 01            [ 2]  327 	ldw	(0x01, sp), x
                                    328 ;	joysticksend.c: 56: I2C_DR = addr;
      008170 AE 52 16         [ 2]  329 	ldw	x, #0x5216
      008173 7B 05            [ 1]  330 	ld	a, (0x05, sp)
      008175 F7               [ 1]  331 	ld	(x), a
                                    332 ;	joysticksend.c: 57: while ((I2C_SR1 & I2C_TXE) == 0);
      008176                        333 00101$:
      008176 AE 52 17         [ 2]  334 	ldw	x, #0x5217
      008179 F6               [ 1]  335 	ld	a, (x)
      00817A 48               [ 1]  336 	sll	a
      00817B 24 F9            [ 1]  337 	jrnc	00101$
      00817D 5B 02            [ 2]  338 	addw	sp, #2
      00817F 81               [ 4]  339 	ret
                                    340 ;	joysticksend.c: 61: void UARTPrintF (char *message) {
                                    341 ;	-----------------------------------------
                                    342 ;	 function UARTPrintF
                                    343 ;	-----------------------------------------
      008180                        344 _UARTPrintF:
                                    345 ;	joysticksend.c: 62: char *ch = message;
      008180 16 03            [ 2]  346 	ldw	y, (0x03, sp)
                                    347 ;	joysticksend.c: 63: while (*ch) {
      008182                        348 00104$:
      008182 90 F6            [ 1]  349 	ld	a, (y)
      008184 4D               [ 1]  350 	tnz	a
      008185 27 0F            [ 1]  351 	jreq	00107$
                                    352 ;	joysticksend.c: 64: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008187 AE 52 31         [ 2]  353 	ldw	x, #0x5231
      00818A F7               [ 1]  354 	ld	(x), a
                                    355 ;	joysticksend.c: 65: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      00818B                        356 00101$:
      00818B AE 52 30         [ 2]  357 	ldw	x, #0x5230
      00818E F6               [ 1]  358 	ld	a, (x)
      00818F 48               [ 1]  359 	sll	a
      008190 24 F9            [ 1]  360 	jrnc	00101$
                                    361 ;	joysticksend.c: 66: ch++;                               //  Grab the next character.
      008192 90 5C            [ 2]  362 	incw	y
      008194 20 EC            [ 2]  363 	jra	00104$
      008196                        364 00107$:
      008196 81               [ 4]  365 	ret
                                    366 ;	joysticksend.c: 70: void print_UCHAR_hex (unsigned char buffer) {
                                    367 ;	-----------------------------------------
                                    368 ;	 function print_UCHAR_hex
                                    369 ;	-----------------------------------------
      008197                        370 _print_UCHAR_hex:
      008197 52 0C            [ 2]  371 	sub	sp, #12
                                    372 ;	joysticksend.c: 73: a = (buffer >> 4);
      008199 7B 0F            [ 1]  373 	ld	a, (0x0f, sp)
      00819B 4E               [ 1]  374 	swap	a
      00819C A4 0F            [ 1]  375 	and	a, #0x0f
      00819E 5F               [ 1]  376 	clrw	x
      00819F 97               [ 1]  377 	ld	xl, a
                                    378 ;	joysticksend.c: 74: if (a > 9)
      0081A0 A3 00 09         [ 2]  379 	cpw	x, #0x0009
      0081A3 2D 07            [ 1]  380 	jrsle	00102$
                                    381 ;	joysticksend.c: 75: a = a + 'a' - 10;
      0081A5 1C 00 57         [ 2]  382 	addw	x, #0x0057
      0081A8 1F 03            [ 2]  383 	ldw	(0x03, sp), x
      0081AA 20 05            [ 2]  384 	jra	00103$
      0081AC                        385 00102$:
                                    386 ;	joysticksend.c: 77: a += '0';
      0081AC 1C 00 30         [ 2]  387 	addw	x, #0x0030
      0081AF 1F 03            [ 2]  388 	ldw	(0x03, sp), x
      0081B1                        389 00103$:
                                    390 ;	joysticksend.c: 78: b = buffer & 0x0f;
      0081B1 7B 0F            [ 1]  391 	ld	a, (0x0f, sp)
      0081B3 A4 0F            [ 1]  392 	and	a, #0x0f
      0081B5 5F               [ 1]  393 	clrw	x
      0081B6 97               [ 1]  394 	ld	xl, a
                                    395 ;	joysticksend.c: 79: if (b > 9)
      0081B7 A3 00 09         [ 2]  396 	cpw	x, #0x0009
      0081BA 2D 07            [ 1]  397 	jrsle	00105$
                                    398 ;	joysticksend.c: 80: b = b + 'a' - 10;
      0081BC 1C 00 57         [ 2]  399 	addw	x, #0x0057
      0081BF 1F 01            [ 2]  400 	ldw	(0x01, sp), x
      0081C1 20 05            [ 2]  401 	jra	00106$
      0081C3                        402 00105$:
                                    403 ;	joysticksend.c: 82: b += '0';
      0081C3 1C 00 30         [ 2]  404 	addw	x, #0x0030
      0081C6 1F 01            [ 2]  405 	ldw	(0x01, sp), x
      0081C8                        406 00106$:
                                    407 ;	joysticksend.c: 83: message[0] = a;
      0081C8 90 96            [ 1]  408 	ldw	y, sp
      0081CA 72 A9 00 05      [ 2]  409 	addw	y, #5
      0081CE 7B 04            [ 1]  410 	ld	a, (0x04, sp)
      0081D0 90 F7            [ 1]  411 	ld	(y), a
                                    412 ;	joysticksend.c: 84: message[1] = b;
      0081D2 93               [ 1]  413 	ldw	x, y
      0081D3 5C               [ 2]  414 	incw	x
      0081D4 7B 02            [ 1]  415 	ld	a, (0x02, sp)
      0081D6 F7               [ 1]  416 	ld	(x), a
                                    417 ;	joysticksend.c: 85: message[2] = 0;
      0081D7 93               [ 1]  418 	ldw	x, y
      0081D8 5C               [ 2]  419 	incw	x
      0081D9 5C               [ 2]  420 	incw	x
      0081DA 7F               [ 1]  421 	clr	(x)
                                    422 ;	joysticksend.c: 86: UARTPrintF (message);
      0081DB 90 89            [ 2]  423 	pushw	y
      0081DD CD 81 80         [ 4]  424 	call	_UARTPrintF
      0081E0 5B 02            [ 2]  425 	addw	sp, #2
      0081E2 5B 0C            [ 2]  426 	addw	sp, #12
      0081E4 81               [ 4]  427 	ret
                                    428 ;	joysticksend.c: 89: void i2c_send_address (UCHAR addr, UCHAR mode) {
                                    429 ;	-----------------------------------------
                                    430 ;	 function i2c_send_address
                                    431 ;	-----------------------------------------
      0081E5                        432 _i2c_send_address:
      0081E5 52 03            [ 2]  433 	sub	sp, #3
                                    434 ;	joysticksend.c: 91: reg = I2C_SR1;
      0081E7 AE 52 17         [ 2]  435 	ldw	x, #0x5217
      0081EA F6               [ 1]  436 	ld	a, (x)
      0081EB 5F               [ 1]  437 	clrw	x
      0081EC 97               [ 1]  438 	ld	xl, a
      0081ED 1F 01            [ 2]  439 	ldw	(0x01, sp), x
                                    440 ;	joysticksend.c: 92: I2C_DR = (addr << 1) | mode;
      0081EF 7B 06            [ 1]  441 	ld	a, (0x06, sp)
      0081F1 48               [ 1]  442 	sll	a
      0081F2 1A 07            [ 1]  443 	or	a, (0x07, sp)
      0081F4 AE 52 16         [ 2]  444 	ldw	x, #0x5216
      0081F7 F7               [ 1]  445 	ld	(x), a
                                    446 ;	joysticksend.c: 93: if (mode == I2C_READ) {
      0081F8 7B 07            [ 1]  447 	ld	a, (0x07, sp)
      0081FA A1 01            [ 1]  448 	cp	a, #0x01
      0081FC 26 06            [ 1]  449 	jrne	00127$
      0081FE A6 01            [ 1]  450 	ld	a, #0x01
      008200 6B 03            [ 1]  451 	ld	(0x03, sp), a
      008202 20 02            [ 2]  452 	jra	00128$
      008204                        453 00127$:
      008204 0F 03            [ 1]  454 	clr	(0x03, sp)
      008206                        455 00128$:
      008206 0D 03            [ 1]  456 	tnz	(0x03, sp)
      008208 27 08            [ 1]  457 	jreq	00103$
                                    458 ;	joysticksend.c: 94: I2C_OARL = 0;
      00820A AE 52 13         [ 2]  459 	ldw	x, #0x5213
      00820D 7F               [ 1]  460 	clr	(x)
                                    461 ;	joysticksend.c: 95: I2C_OARH = 0;
      00820E AE 52 14         [ 2]  462 	ldw	x, #0x5214
      008211 7F               [ 1]  463 	clr	(x)
                                    464 ;	joysticksend.c: 98: while ((I2C_SR1 & I2C_ADDR) == 0);
      008212                        465 00103$:
                                    466 ;	joysticksend.c: 91: reg = I2C_SR1;
      008212 AE 52 17         [ 2]  467 	ldw	x, #0x5217
      008215 F6               [ 1]  468 	ld	a, (x)
                                    469 ;	joysticksend.c: 98: while ((I2C_SR1 & I2C_ADDR) == 0);
      008216 A5 02            [ 1]  470 	bcp	a, #0x02
      008218 27 F8            [ 1]  471 	jreq	00103$
                                    472 ;	joysticksend.c: 99: if (mode == I2C_READ)
      00821A 0D 03            [ 1]  473 	tnz	(0x03, sp)
      00821C 27 06            [ 1]  474 	jreq	00108$
                                    475 ;	joysticksend.c: 100: UNSET (I2C_SR1, I2C_ADDR);
      00821E A4 FD            [ 1]  476 	and	a, #0xfd
      008220 AE 52 17         [ 2]  477 	ldw	x, #0x5217
      008223 F7               [ 1]  478 	ld	(x), a
      008224                        479 00108$:
      008224 5B 03            [ 2]  480 	addw	sp, #3
      008226 81               [ 4]  481 	ret
                                    482 ;	joysticksend.c: 103: void i2c_set_start_ack (void) {
                                    483 ;	-----------------------------------------
                                    484 ;	 function i2c_set_start_ack
                                    485 ;	-----------------------------------------
      008227                        486 _i2c_set_start_ack:
                                    487 ;	joysticksend.c: 104: I2C_CR2 = I2C_ACK | I2C_START;
      008227 AE 52 11         [ 2]  488 	ldw	x, #0x5211
      00822A A6 05            [ 1]  489 	ld	a, #0x05
      00822C F7               [ 1]  490 	ld	(x), a
                                    491 ;	joysticksend.c: 105: while ((I2C_SR1 & I2C_SB) == 0);
      00822D                        492 00101$:
      00822D AE 52 17         [ 2]  493 	ldw	x, #0x5217
      008230 F6               [ 1]  494 	ld	a, (x)
      008231 44               [ 1]  495 	srl	a
      008232 24 F9            [ 1]  496 	jrnc	00101$
      008234 81               [ 4]  497 	ret
                                    498 ;	joysticksend.c: 112: void print_byte_hex (unsigned char buffer) {
                                    499 ;	-----------------------------------------
                                    500 ;	 function print_byte_hex
                                    501 ;	-----------------------------------------
      008235                        502 _print_byte_hex:
      008235 52 0C            [ 2]  503 	sub	sp, #12
                                    504 ;	joysticksend.c: 115: a = (buffer >> 4);
      008237 7B 0F            [ 1]  505 	ld	a, (0x0f, sp)
      008239 4E               [ 1]  506 	swap	a
      00823A A4 0F            [ 1]  507 	and	a, #0x0f
      00823C 5F               [ 1]  508 	clrw	x
      00823D 97               [ 1]  509 	ld	xl, a
                                    510 ;	joysticksend.c: 116: if (a > 9)
      00823E A3 00 09         [ 2]  511 	cpw	x, #0x0009
      008241 2D 07            [ 1]  512 	jrsle	00102$
                                    513 ;	joysticksend.c: 117: a = a + 'a' - 10;
      008243 1C 00 57         [ 2]  514 	addw	x, #0x0057
      008246 1F 03            [ 2]  515 	ldw	(0x03, sp), x
      008248 20 05            [ 2]  516 	jra	00103$
      00824A                        517 00102$:
                                    518 ;	joysticksend.c: 119: a += '0'; 
      00824A 1C 00 30         [ 2]  519 	addw	x, #0x0030
      00824D 1F 03            [ 2]  520 	ldw	(0x03, sp), x
      00824F                        521 00103$:
                                    522 ;	joysticksend.c: 120: b = buffer & 0x0f;
      00824F 7B 0F            [ 1]  523 	ld	a, (0x0f, sp)
      008251 A4 0F            [ 1]  524 	and	a, #0x0f
      008253 5F               [ 1]  525 	clrw	x
      008254 97               [ 1]  526 	ld	xl, a
                                    527 ;	joysticksend.c: 121: if (b > 9)
      008255 A3 00 09         [ 2]  528 	cpw	x, #0x0009
      008258 2D 07            [ 1]  529 	jrsle	00105$
                                    530 ;	joysticksend.c: 122: b = b + 'a' - 10;
      00825A 1C 00 57         [ 2]  531 	addw	x, #0x0057
      00825D 1F 01            [ 2]  532 	ldw	(0x01, sp), x
      00825F 20 05            [ 2]  533 	jra	00106$
      008261                        534 00105$:
                                    535 ;	joysticksend.c: 124: b += '0'; 
      008261 1C 00 30         [ 2]  536 	addw	x, #0x0030
      008264 1F 01            [ 2]  537 	ldw	(0x01, sp), x
      008266                        538 00106$:
                                    539 ;	joysticksend.c: 125: message[0] = a;
      008266 90 96            [ 1]  540 	ldw	y, sp
      008268 72 A9 00 05      [ 2]  541 	addw	y, #5
      00826C 7B 04            [ 1]  542 	ld	a, (0x04, sp)
      00826E 90 F7            [ 1]  543 	ld	(y), a
                                    544 ;	joysticksend.c: 126: message[1] = b;
      008270 93               [ 1]  545 	ldw	x, y
      008271 5C               [ 2]  546 	incw	x
      008272 7B 02            [ 1]  547 	ld	a, (0x02, sp)
      008274 F7               [ 1]  548 	ld	(x), a
                                    549 ;	joysticksend.c: 127: message[2] = 0;
      008275 93               [ 1]  550 	ldw	x, y
      008276 5C               [ 2]  551 	incw	x
      008277 5C               [ 2]  552 	incw	x
      008278 7F               [ 1]  553 	clr	(x)
                                    554 ;	joysticksend.c: 128: UARTPrintF (message);
      008279 90 89            [ 2]  555 	pushw	y
      00827B CD 81 80         [ 4]  556 	call	_UARTPrintF
      00827E 5B 02            [ 2]  557 	addw	sp, #2
      008280 5B 0C            [ 2]  558 	addw	sp, #12
      008282 81               [ 4]  559 	ret
                                    560 ;	joysticksend.c: 132: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
                                    561 ;	-----------------------------------------
                                    562 ;	 function i2c_read_register
                                    563 ;	-----------------------------------------
      008283                        564 _i2c_read_register:
      008283 52 02            [ 2]  565 	sub	sp, #2
                                    566 ;	joysticksend.c: 135: i2c_set_start_ack ();
      008285 CD 82 27         [ 4]  567 	call	_i2c_set_start_ack
                                    568 ;	joysticksend.c: 136: i2c_send_address (addr, I2C_WRITE);
      008288 4B 00            [ 1]  569 	push	#0x00
      00828A 7B 06            [ 1]  570 	ld	a, (0x06, sp)
      00828C 88               [ 1]  571 	push	a
      00828D CD 81 E5         [ 4]  572 	call	_i2c_send_address
      008290 5B 02            [ 2]  573 	addw	sp, #2
                                    574 ;	joysticksend.c: 137: i2c_send_reg (rg);
      008292 7B 06            [ 1]  575 	ld	a, (0x06, sp)
      008294 88               [ 1]  576 	push	a
      008295 CD 81 5E         [ 4]  577 	call	_i2c_send_reg
      008298 84               [ 1]  578 	pop	a
                                    579 ;	joysticksend.c: 138: i2c_set_start_ack ();
      008299 CD 82 27         [ 4]  580 	call	_i2c_set_start_ack
                                    581 ;	joysticksend.c: 139: i2c_send_address (addr, I2C_READ);
      00829C 4B 01            [ 1]  582 	push	#0x01
      00829E 7B 06            [ 1]  583 	ld	a, (0x06, sp)
      0082A0 88               [ 1]  584 	push	a
      0082A1 CD 81 E5         [ 4]  585 	call	_i2c_send_address
      0082A4 5B 02            [ 2]  586 	addw	sp, #2
                                    587 ;	joysticksend.c: 140: reg = I2C_SR1;
      0082A6 AE 52 17         [ 2]  588 	ldw	x, #0x5217
      0082A9 F6               [ 1]  589 	ld	a, (x)
      0082AA 6B 02            [ 1]  590 	ld	(0x02, sp), a
                                    591 ;	joysticksend.c: 141: reg = I2C_SR3;
      0082AC AE 52 19         [ 2]  592 	ldw	x, #0x5219
      0082AF F6               [ 1]  593 	ld	a, (x)
      0082B0 6B 02            [ 1]  594 	ld	(0x02, sp), a
                                    595 ;	joysticksend.c: 142: i2c_set_nak ();
      0082B2 CD 81 4E         [ 4]  596 	call	_i2c_set_nak
                                    597 ;	joysticksend.c: 143: i2c_set_stop ();
      0082B5 CD 81 56         [ 4]  598 	call	_i2c_set_stop
                                    599 ;	joysticksend.c: 144: i2c_read (&x);
      0082B8 96               [ 1]  600 	ldw	x, sp
      0082B9 5C               [ 2]  601 	incw	x
      0082BA 89               [ 2]  602 	pushw	x
      0082BB CD 81 3D         [ 4]  603 	call	_i2c_read
      0082BE 5B 02            [ 2]  604 	addw	sp, #2
                                    605 ;	joysticksend.c: 145: return (x);
      0082C0 7B 01            [ 1]  606 	ld	a, (0x01, sp)
      0082C2 5B 02            [ 2]  607 	addw	sp, #2
      0082C4 81               [ 4]  608 	ret
                                    609 ;	joysticksend.c: 148: void InitializeI2C (void) {
                                    610 ;	-----------------------------------------
                                    611 ;	 function InitializeI2C
                                    612 ;	-----------------------------------------
      0082C5                        613 _InitializeI2C:
                                    614 ;	joysticksend.c: 149: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
      0082C5 AE 52 10         [ 2]  615 	ldw	x, #0x5210
      0082C8 7F               [ 1]  616 	clr	(x)
                                    617 ;	joysticksend.c: 153: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
      0082C9 AE 52 12         [ 2]  618 	ldw	x, #0x5212
      0082CC A6 10            [ 1]  619 	ld	a, #0x10
      0082CE F7               [ 1]  620 	ld	(x), a
                                    621 ;	joysticksend.c: 154: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
      0082CF 72 17 52 1C      [ 1]  622 	bres	0x521c, #7
                                    623 ;	joysticksend.c: 156: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
      0082D3 AE 52 1B         [ 2]  624 	ldw	x, #0x521b
      0082D6 A6 A0            [ 1]  625 	ld	a, #0xa0
      0082D8 F7               [ 1]  626 	ld	(x), a
                                    627 ;	joysticksend.c: 158: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
      0082D9 AE 52 1C         [ 2]  628 	ldw	x, #0x521c
      0082DC 7F               [ 1]  629 	clr	(x)
                                    630 ;	joysticksend.c: 162: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
      0082DD 72 17 52 14      [ 1]  631 	bres	0x5214, #7
                                    632 ;	joysticksend.c: 163: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
      0082E1 AE 52 14         [ 2]  633 	ldw	x, #0x5214
      0082E4 F6               [ 1]  634 	ld	a, (x)
      0082E5 AA 40            [ 1]  635 	or	a, #0x40
      0082E7 F7               [ 1]  636 	ld	(x), a
                                    637 ;	joysticksend.c: 167: I2C_TRISER = 17;
      0082E8 AE 52 1D         [ 2]  638 	ldw	x, #0x521d
      0082EB A6 11            [ 1]  639 	ld	a, #0x11
      0082ED F7               [ 1]  640 	ld	(x), a
                                    641 ;	joysticksend.c: 175: I2C_CR1 = I2C_PE;	// Enables port
      0082EE AE 52 10         [ 2]  642 	ldw	x, #0x5210
      0082F1 A6 01            [ 1]  643 	ld	a, #0x01
      0082F3 F7               [ 1]  644 	ld	(x), a
      0082F4 81               [ 4]  645 	ret
                                    646 ;	joysticksend.c: 181: void InitializeUART() {
                                    647 ;	-----------------------------------------
                                    648 ;	 function InitializeUART
                                    649 ;	-----------------------------------------
      0082F5                        650 _InitializeUART:
                                    651 ;	joysticksend.c: 191: UART1_CR1 = 0;
      0082F5 AE 52 34         [ 2]  652 	ldw	x, #0x5234
      0082F8 7F               [ 1]  653 	clr	(x)
                                    654 ;	joysticksend.c: 192: UART1_CR2 = 0;
      0082F9 AE 52 35         [ 2]  655 	ldw	x, #0x5235
      0082FC 7F               [ 1]  656 	clr	(x)
                                    657 ;	joysticksend.c: 193: UART1_CR4 = 0;
      0082FD AE 52 37         [ 2]  658 	ldw	x, #0x5237
      008300 7F               [ 1]  659 	clr	(x)
                                    660 ;	joysticksend.c: 194: UART1_CR3 = 0;
      008301 AE 52 36         [ 2]  661 	ldw	x, #0x5236
      008304 7F               [ 1]  662 	clr	(x)
                                    663 ;	joysticksend.c: 195: UART1_CR5 = 0;
      008305 AE 52 38         [ 2]  664 	ldw	x, #0x5238
      008308 7F               [ 1]  665 	clr	(x)
                                    666 ;	joysticksend.c: 196: UART1_GTR = 0;
      008309 AE 52 39         [ 2]  667 	ldw	x, #0x5239
      00830C 7F               [ 1]  668 	clr	(x)
                                    669 ;	joysticksend.c: 197: UART1_PSCR = 0;
      00830D AE 52 3A         [ 2]  670 	ldw	x, #0x523a
      008310 7F               [ 1]  671 	clr	(x)
                                    672 ;	joysticksend.c: 201: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      008311 AE 52 34         [ 2]  673 	ldw	x, #0x5234
      008314 F6               [ 1]  674 	ld	a, (x)
      008315 A4 EF            [ 1]  675 	and	a, #0xef
      008317 F7               [ 1]  676 	ld	(x), a
                                    677 ;	joysticksend.c: 202: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008318 AE 52 34         [ 2]  678 	ldw	x, #0x5234
      00831B F6               [ 1]  679 	ld	a, (x)
      00831C A4 FB            [ 1]  680 	and	a, #0xfb
      00831E F7               [ 1]  681 	ld	(x), a
                                    682 ;	joysticksend.c: 203: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      00831F AE 52 36         [ 2]  683 	ldw	x, #0x5236
      008322 F6               [ 1]  684 	ld	a, (x)
      008323 A4 DF            [ 1]  685 	and	a, #0xdf
      008325 F7               [ 1]  686 	ld	(x), a
                                    687 ;	joysticksend.c: 204: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      008326 AE 52 36         [ 2]  688 	ldw	x, #0x5236
      008329 F6               [ 1]  689 	ld	a, (x)
      00832A A4 EF            [ 1]  690 	and	a, #0xef
      00832C F7               [ 1]  691 	ld	(x), a
                                    692 ;	joysticksend.c: 205: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      00832D AE 52 33         [ 2]  693 	ldw	x, #0x5233
      008330 A6 0A            [ 1]  694 	ld	a, #0x0a
      008332 F7               [ 1]  695 	ld	(x), a
                                    696 ;	joysticksend.c: 206: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      008333 AE 52 32         [ 2]  697 	ldw	x, #0x5232
      008336 A6 08            [ 1]  698 	ld	a, #0x08
      008338 F7               [ 1]  699 	ld	(x), a
                                    700 ;	joysticksend.c: 210: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008339 AE 52 35         [ 2]  701 	ldw	x, #0x5235
      00833C F6               [ 1]  702 	ld	a, (x)
      00833D A4 F7            [ 1]  703 	and	a, #0xf7
      00833F F7               [ 1]  704 	ld	(x), a
                                    705 ;	joysticksend.c: 211: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008340 AE 52 35         [ 2]  706 	ldw	x, #0x5235
      008343 F6               [ 1]  707 	ld	a, (x)
      008344 A4 FB            [ 1]  708 	and	a, #0xfb
      008346 F7               [ 1]  709 	ld	(x), a
                                    710 ;	joysticksend.c: 215: SET (UART1_CR3, CR3_CPOL);
      008347 AE 52 36         [ 2]  711 	ldw	x, #0x5236
      00834A F6               [ 1]  712 	ld	a, (x)
      00834B AA 04            [ 1]  713 	or	a, #0x04
      00834D F7               [ 1]  714 	ld	(x), a
                                    715 ;	joysticksend.c: 216: SET (UART1_CR3, CR3_CPHA);
      00834E AE 52 36         [ 2]  716 	ldw	x, #0x5236
      008351 F6               [ 1]  717 	ld	a, (x)
      008352 AA 02            [ 1]  718 	or	a, #0x02
      008354 F7               [ 1]  719 	ld	(x), a
                                    720 ;	joysticksend.c: 217: SET (UART1_CR3, CR3_LBCL);
      008355 72 10 52 36      [ 1]  721 	bset	0x5236, #0
                                    722 ;	joysticksend.c: 221: SET (UART1_CR2, CR2_TEN);
      008359 AE 52 35         [ 2]  723 	ldw	x, #0x5235
      00835C F6               [ 1]  724 	ld	a, (x)
      00835D AA 08            [ 1]  725 	or	a, #0x08
      00835F F7               [ 1]  726 	ld	(x), a
                                    727 ;	joysticksend.c: 222: SET (UART1_CR2, CR2_REN);
      008360 AE 52 35         [ 2]  728 	ldw	x, #0x5235
      008363 F6               [ 1]  729 	ld	a, (x)
      008364 AA 04            [ 1]  730 	or	a, #0x04
      008366 F7               [ 1]  731 	ld	(x), a
                                    732 ;	joysticksend.c: 223: UART1_CR3 = CR3_CLKEN;
      008367 AE 52 36         [ 2]  733 	ldw	x, #0x5236
      00836A A6 08            [ 1]  734 	ld	a, #0x08
      00836C F7               [ 1]  735 	ld	(x), a
      00836D 81               [ 4]  736 	ret
                                    737 ;	joysticksend.c: 251: void tm1637Init(void)
                                    738 ;	-----------------------------------------
                                    739 ;	 function tm1637Init
                                    740 ;	-----------------------------------------
      00836E                        741 _tm1637Init:
                                    742 ;	joysticksend.c: 253: tm1637SetBrightness(8);
      00836E 4B 08            [ 1]  743 	push	#0x08
      008370 CD 84 13         [ 4]  744 	call	_tm1637SetBrightness
      008373 84               [ 1]  745 	pop	a
      008374 81               [ 4]  746 	ret
                                    747 ;	joysticksend.c: 258: void tm1637DisplayDecimal(long TT,unsigned int displaySeparator)
                                    748 ;	-----------------------------------------
                                    749 ;	 function tm1637DisplayDecimal
                                    750 ;	-----------------------------------------
      008375                        751 _tm1637DisplayDecimal:
      008375 52 13            [ 2]  752 	sub	sp, #19
                                    753 ;	joysticksend.c: 260: unsigned int v = TT & 0x0000FFFF;
      008377 7B 19            [ 1]  754 	ld	a, (0x19, sp)
      008379 97               [ 1]  755 	ld	xl, a
      00837A 7B 18            [ 1]  756 	ld	a, (0x18, sp)
      00837C 95               [ 1]  757 	ld	xh, a
      00837D 0F 0A            [ 1]  758 	clr	(0x0a, sp)
      00837F 4F               [ 1]  759 	clr	a
      008380 1F 05            [ 2]  760 	ldw	(0x05, sp), x
                                    761 ;	joysticksend.c: 266: for (ii = 0; ii < 4; ++ii) {
      008382 96               [ 1]  762 	ldw	x, sp
      008383 5C               [ 2]  763 	incw	x
      008384 1F 0F            [ 2]  764 	ldw	(0x0f, sp), x
      008386 AE 86 12         [ 2]  765 	ldw	x, #_segmentMap+0
      008389 1F 0D            [ 2]  766 	ldw	(0x0d, sp), x
      00838B 90 5F            [ 1]  767 	clrw	y
      00838D                        768 00106$:
                                    769 ;	joysticksend.c: 267: digitArr[ii] = segmentMap[v % 10];
      00838D 93               [ 1]  770 	ldw	x, y
      00838E 72 FB 0F         [ 2]  771 	addw	x, (0x0f, sp)
      008391 1F 11            [ 2]  772 	ldw	(0x11, sp), x
      008393 90 89            [ 2]  773 	pushw	y
      008395 1E 07            [ 2]  774 	ldw	x, (0x07, sp)
      008397 90 AE 00 0A      [ 2]  775 	ldw	y, #0x000a
      00839B 65               [ 2]  776 	divw	x, y
      00839C 93               [ 1]  777 	ldw	x, y
      00839D 90 85            [ 2]  778 	popw	y
      00839F 72 FB 0D         [ 2]  779 	addw	x, (0x0d, sp)
      0083A2 F6               [ 1]  780 	ld	a, (x)
      0083A3 1E 11            [ 2]  781 	ldw	x, (0x11, sp)
      0083A5 F7               [ 1]  782 	ld	(x), a
                                    783 ;	joysticksend.c: 268: if (ii == 2 && displaySeparator) {
      0083A6 90 A3 00 02      [ 2]  784 	cpw	y, #0x0002
      0083AA 26 0C            [ 1]  785 	jrne	00102$
      0083AC 1E 1A            [ 2]  786 	ldw	x, (0x1a, sp)
      0083AE 27 08            [ 1]  787 	jreq	00102$
                                    788 ;	joysticksend.c: 269: digitArr[ii] |= 1 << 7;
      0083B0 1E 11            [ 2]  789 	ldw	x, (0x11, sp)
      0083B2 F6               [ 1]  790 	ld	a, (x)
      0083B3 AA 80            [ 1]  791 	or	a, #0x80
      0083B5 1E 11            [ 2]  792 	ldw	x, (0x11, sp)
      0083B7 F7               [ 1]  793 	ld	(x), a
      0083B8                        794 00102$:
                                    795 ;	joysticksend.c: 271: v /= 10;
      0083B8 90 89            [ 2]  796 	pushw	y
      0083BA 1E 07            [ 2]  797 	ldw	x, (0x07, sp)
      0083BC 90 AE 00 0A      [ 2]  798 	ldw	y, #0x000a
      0083C0 65               [ 2]  799 	divw	x, y
      0083C1 90 85            [ 2]  800 	popw	y
      0083C3 1F 05            [ 2]  801 	ldw	(0x05, sp), x
                                    802 ;	joysticksend.c: 266: for (ii = 0; ii < 4; ++ii) {
      0083C5 90 5C            [ 2]  803 	incw	y
      0083C7 90 A3 00 04      [ 2]  804 	cpw	y, #0x0004
      0083CB 25 C0            [ 1]  805 	jrc	00106$
                                    806 ;	joysticksend.c: 274: _tm1637Start();
      0083CD CD 84 25         [ 4]  807 	call	__tm1637Start
                                    808 ;	joysticksend.c: 275: _tm1637WriteByte(0x40);
      0083D0 4B 40            [ 1]  809 	push	#0x40
      0083D2 CD 84 79         [ 4]  810 	call	__tm1637WriteByte
      0083D5 84               [ 1]  811 	pop	a
                                    812 ;	joysticksend.c: 276: _tm1637ReadResult();
      0083D6 CD 84 5E         [ 4]  813 	call	__tm1637ReadResult
                                    814 ;	joysticksend.c: 277: _tm1637Stop();
      0083D9 CD 84 37         [ 4]  815 	call	__tm1637Stop
                                    816 ;	joysticksend.c: 279: _tm1637Start();
      0083DC CD 84 25         [ 4]  817 	call	__tm1637Start
                                    818 ;	joysticksend.c: 280: _tm1637WriteByte(0xc0);
      0083DF 4B C0            [ 1]  819 	push	#0xc0
      0083E1 CD 84 79         [ 4]  820 	call	__tm1637WriteByte
      0083E4 84               [ 1]  821 	pop	a
                                    822 ;	joysticksend.c: 281: _tm1637ReadResult();
      0083E5 CD 84 5E         [ 4]  823 	call	__tm1637ReadResult
                                    824 ;	joysticksend.c: 283: for (ii = 0; ii < 4; ++ii) {
      0083E8 5F               [ 1]  825 	clrw	x
      0083E9 1F 07            [ 2]  826 	ldw	(0x07, sp), x
      0083EB                        827 00108$:
                                    828 ;	joysticksend.c: 284: _tm1637WriteByte(digitArr[3 - ii]);
      0083EB 7B 08            [ 1]  829 	ld	a, (0x08, sp)
      0083ED 6B 13            [ 1]  830 	ld	(0x13, sp), a
      0083EF A6 03            [ 1]  831 	ld	a, #0x03
      0083F1 10 13            [ 1]  832 	sub	a, (0x13, sp)
      0083F3 5F               [ 1]  833 	clrw	x
      0083F4 97               [ 1]  834 	ld	xl, a
      0083F5 72 FB 0F         [ 2]  835 	addw	x, (0x0f, sp)
      0083F8 F6               [ 1]  836 	ld	a, (x)
      0083F9 88               [ 1]  837 	push	a
      0083FA CD 84 79         [ 4]  838 	call	__tm1637WriteByte
      0083FD 84               [ 1]  839 	pop	a
                                    840 ;	joysticksend.c: 285: _tm1637ReadResult();
      0083FE CD 84 5E         [ 4]  841 	call	__tm1637ReadResult
                                    842 ;	joysticksend.c: 283: for (ii = 0; ii < 4; ++ii) {
      008401 1E 07            [ 2]  843 	ldw	x, (0x07, sp)
      008403 5C               [ 2]  844 	incw	x
      008404 1F 07            [ 2]  845 	ldw	(0x07, sp), x
      008406 1E 07            [ 2]  846 	ldw	x, (0x07, sp)
      008408 A3 00 04         [ 2]  847 	cpw	x, #0x0004
      00840B 25 DE            [ 1]  848 	jrc	00108$
                                    849 ;	joysticksend.c: 288: _tm1637Stop();
      00840D CD 84 37         [ 4]  850 	call	__tm1637Stop
      008410 5B 13            [ 2]  851 	addw	sp, #19
      008412 81               [ 4]  852 	ret
                                    853 ;	joysticksend.c: 293: void tm1637SetBrightness(char brightness)
                                    854 ;	-----------------------------------------
                                    855 ;	 function tm1637SetBrightness
                                    856 ;	-----------------------------------------
      008413                        857 _tm1637SetBrightness:
                                    858 ;	joysticksend.c: 300: _tm1637Start();
      008413 CD 84 25         [ 4]  859 	call	__tm1637Start
                                    860 ;	joysticksend.c: 301: _tm1637WriteByte(0x87 + brightness);
      008416 7B 03            [ 1]  861 	ld	a, (0x03, sp)
      008418 AB 87            [ 1]  862 	add	a, #0x87
      00841A 88               [ 1]  863 	push	a
      00841B CD 84 79         [ 4]  864 	call	__tm1637WriteByte
      00841E 84               [ 1]  865 	pop	a
                                    866 ;	joysticksend.c: 302: _tm1637ReadResult();
      00841F CD 84 5E         [ 4]  867 	call	__tm1637ReadResult
                                    868 ;	joysticksend.c: 303: _tm1637Stop();
      008422 CC 84 37         [ 2]  869 	jp	__tm1637Stop
                                    870 ;	joysticksend.c: 306: void _tm1637Start(void)
                                    871 ;	-----------------------------------------
                                    872 ;	 function _tm1637Start
                                    873 ;	-----------------------------------------
      008425                        874 __tm1637Start:
                                    875 ;	joysticksend.c: 308: _tm1637ClkHigh();
      008425 CD 84 B7         [ 4]  876 	call	__tm1637ClkHigh
                                    877 ;	joysticksend.c: 309: _tm1637DioHigh();
      008428 CD 84 C7         [ 4]  878 	call	__tm1637DioHigh
                                    879 ;	joysticksend.c: 310: delay(5);
      00842B 4B 05            [ 1]  880 	push	#0x05
      00842D 4B 00            [ 1]  881 	push	#0x00
      00842F CD 80 F2         [ 4]  882 	call	_delay
      008432 5B 02            [ 2]  883 	addw	sp, #2
                                    884 ;	joysticksend.c: 311: _tm1637DioLow();
      008434 CC 84 CF         [ 2]  885 	jp	__tm1637DioLow
                                    886 ;	joysticksend.c: 314: void _tm1637Stop(void)
                                    887 ;	-----------------------------------------
                                    888 ;	 function _tm1637Stop
                                    889 ;	-----------------------------------------
      008437                        890 __tm1637Stop:
                                    891 ;	joysticksend.c: 316: _tm1637ClkLow();
      008437 CD 84 BF         [ 4]  892 	call	__tm1637ClkLow
                                    893 ;	joysticksend.c: 317: delay(5);
      00843A 4B 05            [ 1]  894 	push	#0x05
      00843C 4B 00            [ 1]  895 	push	#0x00
      00843E CD 80 F2         [ 4]  896 	call	_delay
      008441 5B 02            [ 2]  897 	addw	sp, #2
                                    898 ;	joysticksend.c: 318: _tm1637DioLow();
      008443 CD 84 CF         [ 4]  899 	call	__tm1637DioLow
                                    900 ;	joysticksend.c: 319: delay(5);
      008446 4B 05            [ 1]  901 	push	#0x05
      008448 4B 00            [ 1]  902 	push	#0x00
      00844A CD 80 F2         [ 4]  903 	call	_delay
      00844D 5B 02            [ 2]  904 	addw	sp, #2
                                    905 ;	joysticksend.c: 320: _tm1637ClkHigh();
      00844F CD 84 B7         [ 4]  906 	call	__tm1637ClkHigh
                                    907 ;	joysticksend.c: 321: delay(5);
      008452 4B 05            [ 1]  908 	push	#0x05
      008454 4B 00            [ 1]  909 	push	#0x00
      008456 CD 80 F2         [ 4]  910 	call	_delay
      008459 5B 02            [ 2]  911 	addw	sp, #2
                                    912 ;	joysticksend.c: 322: _tm1637DioHigh();
      00845B CC 84 C7         [ 2]  913 	jp	__tm1637DioHigh
                                    914 ;	joysticksend.c: 325: void _tm1637ReadResult(void)
                                    915 ;	-----------------------------------------
                                    916 ;	 function _tm1637ReadResult
                                    917 ;	-----------------------------------------
      00845E                        918 __tm1637ReadResult:
                                    919 ;	joysticksend.c: 327: _tm1637ClkLow();
      00845E CD 84 BF         [ 4]  920 	call	__tm1637ClkLow
                                    921 ;	joysticksend.c: 328: delay(5);
      008461 4B 05            [ 1]  922 	push	#0x05
      008463 4B 00            [ 1]  923 	push	#0x00
      008465 CD 80 F2         [ 4]  924 	call	_delay
      008468 5B 02            [ 2]  925 	addw	sp, #2
                                    926 ;	joysticksend.c: 330: _tm1637ClkHigh();
      00846A CD 84 B7         [ 4]  927 	call	__tm1637ClkHigh
                                    928 ;	joysticksend.c: 331: delay(5);
      00846D 4B 05            [ 1]  929 	push	#0x05
      00846F 4B 00            [ 1]  930 	push	#0x00
      008471 CD 80 F2         [ 4]  931 	call	_delay
      008474 5B 02            [ 2]  932 	addw	sp, #2
                                    933 ;	joysticksend.c: 332: _tm1637ClkLow();
      008476 CC 84 BF         [ 2]  934 	jp	__tm1637ClkLow
                                    935 ;	joysticksend.c: 335: void _tm1637WriteByte(unsigned char b)
                                    936 ;	-----------------------------------------
                                    937 ;	 function _tm1637WriteByte
                                    938 ;	-----------------------------------------
      008479                        939 __tm1637WriteByte:
      008479 52 02            [ 2]  940 	sub	sp, #2
                                    941 ;	joysticksend.c: 337: for (ii = 0; ii < 8; ++ii) {
      00847B 5F               [ 1]  942 	clrw	x
      00847C 1F 01            [ 2]  943 	ldw	(0x01, sp), x
      00847E                        944 00105$:
                                    945 ;	joysticksend.c: 338: _tm1637ClkLow();
      00847E CD 84 BF         [ 4]  946 	call	__tm1637ClkLow
                                    947 ;	joysticksend.c: 339: if (b & 0x01) {
      008481 7B 05            [ 1]  948 	ld	a, (0x05, sp)
      008483 44               [ 1]  949 	srl	a
      008484 24 05            [ 1]  950 	jrnc	00102$
                                    951 ;	joysticksend.c: 340: _tm1637DioHigh();
      008486 CD 84 C7         [ 4]  952 	call	__tm1637DioHigh
      008489 20 03            [ 2]  953 	jra	00103$
      00848B                        954 00102$:
                                    955 ;	joysticksend.c: 343: _tm1637DioLow();
      00848B CD 84 CF         [ 4]  956 	call	__tm1637DioLow
      00848E                        957 00103$:
                                    958 ;	joysticksend.c: 345: delay(15);
      00848E 4B 0F            [ 1]  959 	push	#0x0f
      008490 4B 00            [ 1]  960 	push	#0x00
      008492 CD 80 F2         [ 4]  961 	call	_delay
      008495 5B 02            [ 2]  962 	addw	sp, #2
                                    963 ;	joysticksend.c: 346: b >>= 1;
      008497 7B 05            [ 1]  964 	ld	a, (0x05, sp)
      008499 44               [ 1]  965 	srl	a
      00849A 6B 05            [ 1]  966 	ld	(0x05, sp), a
                                    967 ;	joysticksend.c: 347: _tm1637ClkHigh();
      00849C CD 84 B7         [ 4]  968 	call	__tm1637ClkHigh
                                    969 ;	joysticksend.c: 348: delay(15);
      00849F 4B 0F            [ 1]  970 	push	#0x0f
      0084A1 4B 00            [ 1]  971 	push	#0x00
      0084A3 CD 80 F2         [ 4]  972 	call	_delay
      0084A6 5B 02            [ 2]  973 	addw	sp, #2
                                    974 ;	joysticksend.c: 337: for (ii = 0; ii < 8; ++ii) {
      0084A8 1E 01            [ 2]  975 	ldw	x, (0x01, sp)
      0084AA 5C               [ 2]  976 	incw	x
      0084AB 1F 01            [ 2]  977 	ldw	(0x01, sp), x
      0084AD 1E 01            [ 2]  978 	ldw	x, (0x01, sp)
      0084AF A3 00 08         [ 2]  979 	cpw	x, #0x0008
      0084B2 2F CA            [ 1]  980 	jrslt	00105$
      0084B4 5B 02            [ 2]  981 	addw	sp, #2
      0084B6 81               [ 4]  982 	ret
                                    983 ;	joysticksend.c: 354: void _tm1637ClkHigh(void)
                                    984 ;	-----------------------------------------
                                    985 ;	 function _tm1637ClkHigh
                                    986 ;	-----------------------------------------
      0084B7                        987 __tm1637ClkHigh:
                                    988 ;	joysticksend.c: 359: PD_ODR |= 1 << 2;
      0084B7 AE 50 0F         [ 2]  989 	ldw	x, #0x500f
      0084BA F6               [ 1]  990 	ld	a, (x)
      0084BB AA 04            [ 1]  991 	or	a, #0x04
      0084BD F7               [ 1]  992 	ld	(x), a
      0084BE 81               [ 4]  993 	ret
                                    994 ;	joysticksend.c: 362: void _tm1637ClkLow(void)
                                    995 ;	-----------------------------------------
                                    996 ;	 function _tm1637ClkLow
                                    997 ;	-----------------------------------------
      0084BF                        998 __tm1637ClkLow:
                                    999 ;	joysticksend.c: 366: PD_ODR &= ~(1 << 2);
      0084BF AE 50 0F         [ 2] 1000 	ldw	x, #0x500f
      0084C2 F6               [ 1] 1001 	ld	a, (x)
      0084C3 A4 FB            [ 1] 1002 	and	a, #0xfb
      0084C5 F7               [ 1] 1003 	ld	(x), a
      0084C6 81               [ 4] 1004 	ret
                                   1005 ;	joysticksend.c: 372: void _tm1637DioHigh(void)
                                   1006 ;	-----------------------------------------
                                   1007 ;	 function _tm1637DioHigh
                                   1008 ;	-----------------------------------------
      0084C7                       1009 __tm1637DioHigh:
                                   1010 ;	joysticksend.c: 376: PD_ODR |= 1 << 3;
      0084C7 AE 50 0F         [ 2] 1011 	ldw	x, #0x500f
      0084CA F6               [ 1] 1012 	ld	a, (x)
      0084CB AA 08            [ 1] 1013 	or	a, #0x08
      0084CD F7               [ 1] 1014 	ld	(x), a
      0084CE 81               [ 4] 1015 	ret
                                   1016 ;	joysticksend.c: 380: void _tm1637DioLow(void)
                                   1017 ;	-----------------------------------------
                                   1018 ;	 function _tm1637DioLow
                                   1019 ;	-----------------------------------------
      0084CF                       1020 __tm1637DioLow:
                                   1021 ;	joysticksend.c: 382: PD_ODR &= ~(1 << 3);
      0084CF AE 50 0F         [ 2] 1022 	ldw	x, #0x500f
      0084D2 F6               [ 1] 1023 	ld	a, (x)
      0084D3 A4 F7            [ 1] 1024 	and	a, #0xf7
      0084D5 F7               [ 1] 1025 	ld	(x), a
      0084D6 81               [ 4] 1026 	ret
                                   1027 ;	joysticksend.c: 391: unsigned int clock(void)
                                   1028 ;	-----------------------------------------
                                   1029 ;	 function clock
                                   1030 ;	-----------------------------------------
      0084D7                       1031 _clock:
      0084D7 52 03            [ 2] 1032 	sub	sp, #3
                                   1033 ;	joysticksend.c: 393: unsigned char h = TIM1_CNTRH; //origineel PCNTRH
      0084D9 AE 52 5E         [ 2] 1034 	ldw	x, #0x525e
      0084DC F6               [ 1] 1035 	ld	a, (x)
                                   1036 ;	joysticksend.c: 394: unsigned char l = TIM1_CNTRL;
      0084DD AE 52 5F         [ 2] 1037 	ldw	x, #0x525f
      0084E0 88               [ 1] 1038 	push	a
      0084E1 F6               [ 1] 1039 	ld	a, (x)
      0084E2 6B 02            [ 1] 1040 	ld	(0x02, sp), a
      0084E4 84               [ 1] 1041 	pop	a
                                   1042 ;	joysticksend.c: 395: return((unsigned int)(h) << 8 | l);
      0084E5 5F               [ 1] 1043 	clrw	x
      0084E6 97               [ 1] 1044 	ld	xl, a
      0084E7 58               [ 2] 1045 	sllw	x
      0084E8 58               [ 2] 1046 	sllw	x
      0084E9 58               [ 2] 1047 	sllw	x
      0084EA 58               [ 2] 1048 	sllw	x
      0084EB 58               [ 2] 1049 	sllw	x
      0084EC 58               [ 2] 1050 	sllw	x
      0084ED 58               [ 2] 1051 	sllw	x
      0084EE 58               [ 2] 1052 	sllw	x
      0084EF 7B 01            [ 1] 1053 	ld	a, (0x01, sp)
      0084F1 6B 03            [ 1] 1054 	ld	(0x03, sp), a
      0084F3 0F 02            [ 1] 1055 	clr	(0x02, sp)
      0084F5 9F               [ 1] 1056 	ld	a, xl
      0084F6 1A 03            [ 1] 1057 	or	a, (0x03, sp)
      0084F8 97               [ 1] 1058 	ld	xl, a
      0084F9 9E               [ 1] 1059 	ld	a, xh
      0084FA 1A 02            [ 1] 1060 	or	a, (0x02, sp)
      0084FC 95               [ 1] 1061 	ld	xh, a
      0084FD 5B 03            [ 2] 1062 	addw	sp, #3
      0084FF 81               [ 4] 1063 	ret
                                   1064 ;	joysticksend.c: 439: void timer_isr(void) __interrupt(TIM4_ISR) {
                                   1065 ;	-----------------------------------------
                                   1066 ;	 function timer_isr
                                   1067 ;	-----------------------------------------
      008500                       1068 _timer_isr:
                                   1069 ;	joysticksend.c: 440: if (++internteller > 520) {
      008500 CE 00 01         [ 2] 1070 	ldw	x, _internteller+0
      008503 5C               [ 2] 1071 	incw	x
      008504 CF 00 01         [ 2] 1072 	ldw	_internteller+0, x
      008507 A3 02 08         [ 2] 1073 	cpw	x, #0x0208
      00850A 23 0F            [ 2] 1074 	jrule	00102$
                                   1075 ;	joysticksend.c: 441: internteller=0;
      00850C 72 5F 00 02      [ 1] 1076 	clr	_internteller+1
      008510 72 5F 00 01      [ 1] 1077 	clr	_internteller+0
                                   1078 ;	joysticksend.c: 442: ++seconden;
      008514 CE 00 03         [ 2] 1079 	ldw	x, _seconden+0
      008517 5C               [ 2] 1080 	incw	x
      008518 CF 00 03         [ 2] 1081 	ldw	_seconden+0, x
      00851B                       1082 00102$:
                                   1083 ;	joysticksend.c: 446: if (seconden > 59){
      00851B CE 00 03         [ 2] 1084 	ldw	x, _seconden+0
      00851E A3 00 3B         [ 2] 1085 	cpw	x, #0x003b
      008521 23 0F            [ 2] 1086 	jrule	00104$
                                   1087 ;	joysticksend.c: 447: seconden=0;
      008523 72 5F 00 04      [ 1] 1088 	clr	_seconden+1
      008527 72 5F 00 03      [ 1] 1089 	clr	_seconden+0
                                   1090 ;	joysticksend.c: 448: ++minuten;
      00852B CE 00 05         [ 2] 1091 	ldw	x, _minuten+0
      00852E 5C               [ 2] 1092 	incw	x
      00852F CF 00 05         [ 2] 1093 	ldw	_minuten+0, x
      008532                       1094 00104$:
                                   1095 ;	joysticksend.c: 451: TIM4_SR &= ~(TIMx_UIF); //update interrupt
      008532 AE 53 44         [ 2] 1096 	ldw	x, #0x5344
      008535 F6               [ 1] 1097 	ld	a, (x)
      008536 A4 FE            [ 1] 1098 	and	a, #0xfe
      008538 F7               [ 1] 1099 	ld	(x), a
      008539 80               [11] 1100 	iret
                                   1101 ;	joysticksend.c: 458: int main () {
                                   1102 ;	-----------------------------------------
                                   1103 ;	 function main
                                   1104 ;	-----------------------------------------
      00853A                       1105 _main:
      00853A 52 06            [ 2] 1106 	sub	sp, #6
                                   1107 ;	joysticksend.c: 463: unsigned int val=0;
      00853C 5F               [ 1] 1108 	clrw	x
      00853D 1F 05            [ 2] 1109 	ldw	(0x05, sp), x
                                   1110 ;	joysticksend.c: 465: InitializeSystemClock();
      00853F CD 80 A8         [ 4] 1111 	call	_InitializeSystemClock
                                   1112 ;	joysticksend.c: 467: PD_DDR = (1 << 3) | (1 << 2); // output mode
      008542 AE 50 11         [ 2] 1113 	ldw	x, #0x5011
      008545 A6 0C            [ 1] 1114 	ld	a, #0x0c
      008547 F7               [ 1] 1115 	ld	(x), a
                                   1116 ;	joysticksend.c: 468: PD_CR1 = (1 << 3) | (1 << 2); // push-pull
      008548 AE 50 12         [ 2] 1117 	ldw	x, #0x5012
      00854B A6 0C            [ 1] 1118 	ld	a, #0x0c
      00854D F7               [ 1] 1119 	ld	(x), a
                                   1120 ;	joysticksend.c: 469: PD_CR2 = (1 << 3) | (1 << 2); // up to 10MHz speed
      00854E AE 50 13         [ 2] 1121 	ldw	x, #0x5013
      008551 A6 0C            [ 1] 1122 	ld	a, #0x0c
      008553 F7               [ 1] 1123 	ld	(x), a
                                   1124 ;	joysticksend.c: 473: TIM1_PSCRH = 0x3e;
      008554 AE 52 60         [ 2] 1125 	ldw	x, #0x5260
      008557 A6 3E            [ 1] 1126 	ld	a, #0x3e
      008559 F7               [ 1] 1127 	ld	(x), a
                                   1128 ;	joysticksend.c: 474: TIM1_PSCRL = 0x80;
      00855A AE 52 61         [ 2] 1129 	ldw	x, #0x5261
      00855D A6 80            [ 1] 1130 	ld	a, #0x80
      00855F F7               [ 1] 1131 	ld	(x), a
                                   1132 ;	joysticksend.c: 476: tm1637Init();
      008560 CD 83 6E         [ 4] 1133 	call	_tm1637Init
                                   1134 ;	joysticksend.c: 478: InitializeUART();
      008563 CD 82 F5         [ 4] 1135 	call	_InitializeUART
                                   1136 ;	joysticksend.c: 481: __asm__("rim");
      008566 9A               [ 1] 1137 	rim
                                   1138 ;	joysticksend.c: 484: TIM4_PSCR = 0b00000111;
      008567 AE 53 47         [ 2] 1139 	ldw	x, #0x5347
      00856A A6 07            [ 1] 1140 	ld	a, #0x07
      00856C F7               [ 1] 1141 	ld	(x), a
                                   1142 ;	joysticksend.c: 486: TIM4_ARR = 239;
      00856D AE 53 48         [ 2] 1143 	ldw	x, #0x5348
      008570 A6 EF            [ 1] 1144 	ld	a, #0xef
      008572 F7               [ 1] 1145 	ld	(x), a
                                   1146 ;	joysticksend.c: 488: TIM4_IER |= TIMx_UIE;// Enable Update Interrupt
      008573 72 10 53 43      [ 1] 1147 	bset	0x5343, #0
                                   1148 ;	joysticksend.c: 490: TIM4_CR1 |= TIMx_CEN; // Enable TIM4
      008577 72 10 53 40      [ 1] 1149 	bset	0x5340, #0
                                   1150 ;	joysticksend.c: 495: while (1) {
      00857B                       1151 00109$:
                                   1152 ;	joysticksend.c: 500: ADC_CR1 |= ADC_ADON; // ADC ON
      00857B 72 10 54 01      [ 1] 1153 	bset	0x5401, #0
                                   1154 ;	joysticksend.c: 501: ADC_CSR |= ((0x0F)&2); // select channel = 2 = PC4
      00857F AE 54 00         [ 2] 1155 	ldw	x, #0x5400
      008582 F6               [ 1] 1156 	ld	a, (x)
      008583 AA 02            [ 1] 1157 	or	a, #0x02
      008585 F7               [ 1] 1158 	ld	(x), a
                                   1159 ;	joysticksend.c: 502: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      008586 AE 54 02         [ 2] 1160 	ldw	x, #0x5402
      008589 F6               [ 1] 1161 	ld	a, (x)
      00858A AA 08            [ 1] 1162 	or	a, #0x08
      00858C F7               [ 1] 1163 	ld	(x), a
                                   1164 ;	joysticksend.c: 503: ADC_CR1 |= ADC_ADON; // start conversion 
      00858D 72 10 54 01      [ 1] 1165 	bset	0x5401, #0
                                   1166 ;	joysticksend.c: 504: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      008591                       1167 00101$:
      008591 AE 54 00         [ 2] 1168 	ldw	x, #0x5400
      008594 F6               [ 1] 1169 	ld	a, (x)
      008595 48               [ 1] 1170 	sll	a
      008596 24 F9            [ 1] 1171 	jrnc	00101$
                                   1172 ;	joysticksend.c: 506: val |= (unsigned int)ADC_DRL;
      008598 AE 54 05         [ 2] 1173 	ldw	x, #0x5405
      00859B F6               [ 1] 1174 	ld	a, (x)
      00859C 5F               [ 1] 1175 	clrw	x
      00859D 97               [ 1] 1176 	ld	xl, a
      00859E 1A 06            [ 1] 1177 	or	a, (0x06, sp)
      0085A0 6B 04            [ 1] 1178 	ld	(0x04, sp), a
      0085A2 9E               [ 1] 1179 	ld	a, xh
      0085A3 1A 05            [ 1] 1180 	or	a, (0x05, sp)
      0085A5 6B 01            [ 1] 1181 	ld	(0x01, sp), a
      0085A7 7B 04            [ 1] 1182 	ld	a, (0x04, sp)
      0085A9 6B 02            [ 1] 1183 	ld	(0x02, sp), a
                                   1184 ;	joysticksend.c: 508: val |= (unsigned int)ADC_DRH<<8;
      0085AB AE 54 04         [ 2] 1185 	ldw	x, #0x5404
      0085AE F6               [ 1] 1186 	ld	a, (x)
      0085AF 5F               [ 1] 1187 	clrw	x
      0085B0 97               [ 1] 1188 	ld	xl, a
      0085B1 58               [ 2] 1189 	sllw	x
      0085B2 58               [ 2] 1190 	sllw	x
      0085B3 58               [ 2] 1191 	sllw	x
      0085B4 58               [ 2] 1192 	sllw	x
      0085B5 58               [ 2] 1193 	sllw	x
      0085B6 58               [ 2] 1194 	sllw	x
      0085B7 58               [ 2] 1195 	sllw	x
      0085B8 58               [ 2] 1196 	sllw	x
      0085B9 9F               [ 1] 1197 	ld	a, xl
      0085BA 1A 02            [ 1] 1198 	or	a, (0x02, sp)
      0085BC 90 97            [ 1] 1199 	ld	yl, a
      0085BE 9E               [ 1] 1200 	ld	a, xh
      0085BF 1A 01            [ 1] 1201 	or	a, (0x01, sp)
      0085C1 90 95            [ 1] 1202 	ld	yh, a
                                   1203 ;	joysticksend.c: 509: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      0085C3 AE 54 01         [ 2] 1204 	ldw	x, #0x5401
      0085C6 F6               [ 1] 1205 	ld	a, (x)
      0085C7 A4 FE            [ 1] 1206 	and	a, #0xfe
      0085C9 F7               [ 1] 1207 	ld	(x), a
                                   1208 ;	joysticksend.c: 510: readValue = val & 0x03ff;
      0085CA 90 9E            [ 1] 1209 	ld	a, yh
      0085CC A4 03            [ 1] 1210 	and	a, #0x03
      0085CE 90 95            [ 1] 1211 	ld	yh, a
                                   1212 ;	joysticksend.c: 511: if (readValue > minValue)
      0085D0 90 A3 00 0A      [ 2] 1213 	cpw	y, #0x000a
      0085D4 2D 06            [ 1] 1214 	jrsle	00105$
                                   1215 ;	joysticksend.c: 513: TIM1_CR1 = 0x01; // enable timer
      0085D6 AE 52 50         [ 2] 1216 	ldw	x, #0x5250
      0085D9 A6 01            [ 1] 1217 	ld	a, #0x01
      0085DB F7               [ 1] 1218 	ld	(x), a
      0085DC                       1219 00105$:
                                   1220 ;	joysticksend.c: 515: if (readValue < minValue)
      0085DC 90 A3 00 0A      [ 2] 1221 	cpw	y, #0x000a
      0085E0 2E 0D            [ 1] 1222 	jrsge	00107$
                                   1223 ;	joysticksend.c: 517: TIM1_CR1 = 0x00; // disable timer
      0085E2 AE 52 50         [ 2] 1224 	ldw	x, #0x5250
      0085E5 7F               [ 1] 1225 	clr	(x)
                                   1226 ;	joysticksend.c: 518: tijd=clock();
      0085E6 CD 84 D7         [ 4] 1227 	call	_clock
                                   1228 ;	joysticksend.c: 519: print_UCHAR_hex(tijd);
      0085E9 9F               [ 1] 1229 	ld	a, xl
      0085EA 88               [ 1] 1230 	push	a
      0085EB CD 81 97         [ 4] 1231 	call	_print_UCHAR_hex
      0085EE 84               [ 1] 1232 	pop	a
      0085EF                       1233 00107$:
                                   1234 ;	joysticksend.c: 523: tm1637DisplayDecimal(minuten, 0); // tijd in seconden 
      0085EF 90 CE 00 05      [ 2] 1235 	ldw	y, _minuten+0
      0085F3 5F               [ 1] 1236 	clrw	x
      0085F4 4B 00            [ 1] 1237 	push	#0x00
      0085F6 4B 00            [ 1] 1238 	push	#0x00
      0085F8 90 89            [ 2] 1239 	pushw	y
      0085FA 89               [ 2] 1240 	pushw	x
      0085FB CD 83 75         [ 4] 1241 	call	_tm1637DisplayDecimal
      0085FE 5B 06            [ 2] 1242 	addw	sp, #6
                                   1243 ;	joysticksend.c: 524: val=0;
      008600 5F               [ 1] 1244 	clrw	x
      008601 1F 05            [ 2] 1245 	ldw	(0x05, sp), x
                                   1246 ;	joysticksend.c: 525: delay(1);
      008603 4B 01            [ 1] 1247 	push	#0x01
      008605 4B 00            [ 1] 1248 	push	#0x00
      008607 CD 80 F2         [ 4] 1249 	call	_delay
      00860A 5B 02            [ 2] 1250 	addw	sp, #2
      00860C CC 85 7B         [ 2] 1251 	jp	00109$
      00860F 5B 06            [ 2] 1252 	addw	sp, #6
      008611 81               [ 4] 1253 	ret
                                   1254 	.area CODE
      008612                       1255 _segmentMap:
      008612 3F                    1256 	.db #0x3F	;  63
      008613 06                    1257 	.db #0x06	;  6
      008614 5B                    1258 	.db #0x5B	;  91
      008615 4F                    1259 	.db #0x4F	;  79	'O'
      008616 66                    1260 	.db #0x66	;  102	'f'
      008617 6D                    1261 	.db #0x6D	;  109	'm'
      008618 7D                    1262 	.db #0x7D	;  125
      008619 07                    1263 	.db #0x07	;  7
      00861A 7F                    1264 	.db #0x7F	;  127
      00861B 6F                    1265 	.db #0x6F	;  111	'o'
      00861C 77                    1266 	.db #0x77	;  119	'w'
      00861D 7C                    1267 	.db #0x7C	;  124
      00861E 39                    1268 	.db #0x39	;  57	'9'
      00861F 5E                    1269 	.db #0x5E	;  94
      008620 79                    1270 	.db #0x79	;  121	'y'
      008621 71                    1271 	.db #0x71	;  113	'q'
      008622 00                    1272 	.db #0x00	;  0
                                   1273 	.area INITIALIZER
                                   1274 	.area CABS (ABS)
