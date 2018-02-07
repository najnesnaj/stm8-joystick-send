;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
; This file was generated Wed Feb  7 12:53:08 2018
;--------------------------------------------------------
	.module joysticksend
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _SE8R01_Init
	.globl _SE8R01_Analog_Init
	.globl _SE8R01_Calibration
	.globl _rf_switch_bank
	.globl _init_io
	.globl _delay
	.globl _InitializeSystemClock
	.globl _InitializeSPI
	.globl _read_spi_buf
	.globl _write_spi_buf
	.globl _read_spi_reg
	.globl _write_spi_reg
	.globl _write_spi
	.globl _delayTenMicro
	.globl _memset
	.globl _tx_buf
	.globl _rx_buf
	.globl _ADDRESS0
	.globl _ADDRESS1
	.globl _ADDRESS5
	.globl _ADDRESS4
	.globl _ADDRESS3
	.globl _ADDRESS2
	.globl _TX_ADDRESS
	.globl _status
	.globl _pip
	.globl _signal_lv
	.globl _newdata
	.globl _pload_width_now
	.globl _SE8R01_DR_500K
	.globl _SE8R01_DR_1M
	.globl _SE8R01_DR_2M
	.globl _myData_pip4
	.globl _myData_pip5
	.globl _gtemp
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_gtemp::
	.ds 5
_myData_pip5::
	.ds 5
_myData_pip4::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_SE8R01_DR_2M::
	.ds 2
_SE8R01_DR_1M::
	.ds 2
_SE8R01_DR_500K::
	.ds 2
_pload_width_now::
	.ds 2
_newdata::
	.ds 2
_signal_lv::
	.ds 1
_pip::
	.ds 2
_status::
	.ds 1
_TX_ADDRESS::
	.ds 4
_ADDRESS2::
	.ds 1
_ADDRESS3::
	.ds 1
_ADDRESS4::
	.ds 1
_ADDRESS5::
	.ds 1
_ADDRESS1::
	.ds 4
_ADDRESS0::
	.ds 4
_rx_buf::
	.ds 32
_tx_buf::
	.ds 32
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	joysticksend.c: 32: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	joysticksend.c: 34: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	joysticksend.c: 35: __asm__("nop");
	nop
	dec	a
;	joysticksend.c: 34: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	joysticksend.c: 37: UCHAR write_spi (UCHAR value) {
;	-----------------------------------------
;	 function write_spi
;	-----------------------------------------
_write_spi:
;	joysticksend.c: 39: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 40: SPI_DR = value;
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
;	joysticksend.c: 41: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 42: while ((SPI_SR & TXE) == 0);
00101$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	joysticksend.c: 43: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 44: while ((SPI_SR & RXNE) == 0);
00104$:
	ldw	x, #0x5203
	ld	a, (x)
	srl	a
	jrnc	00104$
;	joysticksend.c: 45: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 46: ret = SPI_DR;
	ldw	x, #0x5204
	ld	a, (x)
;	joysticksend.c: 47: return (ret);
	ret
;	joysticksend.c: 49: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
;	-----------------------------------------
;	 function write_spi_reg
;	-----------------------------------------
_write_spi_reg:
	push	a
;	joysticksend.c: 51: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 52: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	joysticksend.c: 53: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	joysticksend.c: 54: write_spi (value);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	pop	a
	jra	00103$
00102$:
;	joysticksend.c: 56: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	joysticksend.c: 57: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 58: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	joysticksend.c: 60: UCHAR read_spi_reg (UCHAR reg) {
;	-----------------------------------------
;	 function read_spi_reg
;	-----------------------------------------
_read_spi_reg:
	push	a
;	joysticksend.c: 62: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 63: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	joysticksend.c: 64: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	joysticksend.c: 65: ret = write_spi (NOP);
	push	#0xff
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	joysticksend.c: 67: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	joysticksend.c: 68: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 69: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	joysticksend.c: 71: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function write_spi_buf
;	-----------------------------------------
_write_spi_buf:
	sub	sp, #2
;	joysticksend.c: 73: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 74: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x02, sp), a
;	joysticksend.c: 75: for (n = 0; n < len; ++n)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	joysticksend.c: 76: write_spi (array[n]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_write_spi
	pop	a
;	joysticksend.c: 75: for (n = 0; n < len; ++n)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	joysticksend.c: 77: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 78: return (ret);
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	joysticksend.c: 80: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function read_spi_buf
;	-----------------------------------------
_read_spi_buf:
	sub	sp, #2
;	joysticksend.c: 82: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 83: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	joysticksend.c: 84: for (n = 0; n < len; ++n)
	clr	(0x02, sp)
00103$:
	ld	a, (0x02, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	joysticksend.c: 85: array[n] = write_spi (NOP);
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	pushw	x
	push	#0xff
	call	_write_spi
	addw	sp, #1
	popw	x
	ld	(x), a
;	joysticksend.c: 84: for (n = 0; n < len; ++n)
	inc	(0x02, sp)
	jra	00103$
00101$:
;	joysticksend.c: 86: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 87: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #2
	ret
;	joysticksend.c: 89: void InitializeSPI () {
;	-----------------------------------------
;	 function InitializeSPI
;	-----------------------------------------
_InitializeSPI:
;	joysticksend.c: 90: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
	ldw	x, #0x5200
	ld	a, #0x7c
	ld	(x), a
;	joysticksend.c: 91: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
	ldw	x, #0x5201
	clr	(x)
;	joysticksend.c: 92: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
	ldw	x, #0x5202
	clr	(x)
;	joysticksend.c: 93: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
	ldw	x, #0x500c
	ld	a, #0x18
	ld	(x), a
;	joysticksend.c: 94: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
	ldw	x, #0x500d
	ld	a, #0x18
	ld	(x), a
;	joysticksend.c: 95: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
	ldw	x, #0x500e
	ld	a, #0x18
	ld	(x), a
;	joysticksend.c: 97: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	joysticksend.c: 99: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	joysticksend.c: 100: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	joysticksend.c: 101: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	joysticksend.c: 102: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	joysticksend.c: 103: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	joysticksend.c: 104: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	joysticksend.c: 105: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	joysticksend.c: 106: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	joysticksend.c: 107: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	joysticksend.c: 108: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	joysticksend.c: 109: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	joysticksend.c: 110: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	joysticksend.c: 111: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	joysticksend.c: 112: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	joysticksend.c: 113: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	joysticksend.c: 115: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	joysticksend.c: 117: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x05, sp), x
00103$:
	ldw	y, (0x05, sp)
	ldw	(0x09, sp), y
	ld	a, (0x09, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x08, sp), a
	ld	(0x07, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x09, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x08, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x07, sp)
	jrsge	00105$
;	joysticksend.c: 118: __asm__("nop");
	nop
;	joysticksend.c: 117: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	joysticksend.c: 192: void init_io(void)
;	-----------------------------------------
;	 function init_io
;	-----------------------------------------
_init_io:
;	joysticksend.c: 201: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 203: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	joysticksend.c: 209: void rf_switch_bank(unsigned char bankindex)
;	-----------------------------------------
;	 function rf_switch_bank
;	-----------------------------------------
_rf_switch_bank:
	push	a
;	joysticksend.c: 212: temp1 = bankindex;
	ld	a, (0x04, sp)
	ld	(0x01, sp), a
;	joysticksend.c: 214: temp0 = write_spi(iRF_BANK0_STATUS);
	push	#0x07
	call	_write_spi
	addw	sp, #1
;	joysticksend.c: 216: if((temp0&0x80)!=temp1)
	and	a, #0x80
	cp	a, (0x01, sp)
	jreq	00103$
;	joysticksend.c: 218: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
	push	#0x53
	push	#0x50
	call	_write_spi_reg
	addw	sp, #2
00103$:
	pop	a
	ret
;	joysticksend.c: 225: void SE8R01_Calibration()
;	-----------------------------------------
;	 function SE8R01_Calibration
;	-----------------------------------------
_SE8R01_Calibration:
	sub	sp, #13
;	joysticksend.c: 228: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 229: temp[0]=0x03;
	ldw	x, sp
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0x03
	ld	(x), a
;	joysticksend.c: 230: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x20
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 232: temp[0]=0x32;
	ldw	x, (0x0c, sp)
	ld	a, #0x32
	ld	(x), a
;	joysticksend.c: 234: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x25
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 238: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	joysticksend.c: 239: {temp[0]=0x48;}
	ldw	x, (0x0c, sp)
	ld	a, #0x48
	ld	(x), a
	jra	00106$
00105$:
;	joysticksend.c: 240: else if (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	joysticksend.c: 241: {temp[0]=0x40;}
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
	jra	00106$
00102$:
;	joysticksend.c: 243: {temp[0]=0x68;}   
	ldw	x, (0x0c, sp)
	ld	a, #0x68
	ld	(x), a
00106$:
;	joysticksend.c: 245: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 246: temp[0]=0x77;
	ldw	x, (0x0c, sp)
	ld	a, #0x77
	ld	(x), a
;	joysticksend.c: 247: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 249: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 250: temp[0]=0x40;
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 251: temp[1]=0x00;
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	clr	(x)
;	joysticksend.c: 252: temp[2]=0x10;
	ldw	x, (0x0c, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x10
	ld	(x), a
;	joysticksend.c: 254: {temp[3]=0xE6;}
	ldw	x, (0x0c, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
;	joysticksend.c: 253: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00108$
;	joysticksend.c: 254: {temp[3]=0xE6;}
	ldw	x, (0x06, sp)
	ld	a, #0xe6
	ld	(x), a
	jra	00109$
00108$:
;	joysticksend.c: 256: {temp[3]=0xE4;}
	ldw	x, (0x06, sp)
	ld	a, #0xe4
	ld	(x), a
00109$:
;	joysticksend.c: 258: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 260: temp[0]=0x20;
	ldw	x, (0x0c, sp)
	ld	a, #0x20
	ld	(x), a
;	joysticksend.c: 261: temp[1]=0x08;
	ldw	x, (0x0a, sp)
	ld	a, #0x08
	ld	(x), a
;	joysticksend.c: 262: temp[2]=0x50;
	ldw	x, (0x08, sp)
	ld	a, #0x50
	ld	(x), a
;	joysticksend.c: 263: temp[3]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 264: temp[4]=0x50;
	ldw	x, (0x0c, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	joysticksend.c: 265: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
	ldw	x, (0x0c, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 267: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	joysticksend.c: 268: temp[1]=0x00;
	ldw	x, (0x0a, sp)
	clr	(x)
;	joysticksend.c: 269: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00111$
;	joysticksend.c: 270: { temp[2]=0x1E;}
	ldw	x, (0x08, sp)
	ld	a, #0x1e
	ld	(x), a
	jra	00112$
00111$:
;	joysticksend.c: 272: { temp[2]=0x1F;}
	ldw	x, (0x08, sp)
	ld	a, #0x1f
	ld	(x), a
00112$:
;	joysticksend.c: 274: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
	ldw	x, (0x0c, sp)
	push	#0x03
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 276: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00114$
;	joysticksend.c: 277: { temp[0]=0x29;}
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00115$
00114$:
;	joysticksend.c: 279: { temp[0]=0x14;}
	ldw	x, (0x0c, sp)
	ld	a, #0x14
	ld	(x), a
00115$:
;	joysticksend.c: 281: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 283: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	joysticksend.c: 284: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x37
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 286: temp[0]=0x7F;
	ldw	x, (0x0c, sp)
	ld	a, #0x7f
	ld	(x), a
;	joysticksend.c: 287: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x38
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 289: temp[0]=0x02;
	ldw	x, (0x0c, sp)
	ld	a, #0x02
	ld	(x), a
;	joysticksend.c: 290: temp[1]=0xC1;
	ldw	x, (0x0a, sp)
	ld	a, #0xc1
	ld	(x), a
;	joysticksend.c: 291: temp[2]=0xEB;            
	ldw	x, (0x08, sp)
	ld	a, #0xeb
	ld	(x), a
;	joysticksend.c: 292: temp[3]=0x1C;
	ldw	x, (0x06, sp)
	ld	a, #0x1c
	ld	(x), a
;	joysticksend.c: 293: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 295: temp[0]=0x97;
	ldw	x, (0x0c, sp)
	ld	a, #0x97
	ld	(x), a
;	joysticksend.c: 296: temp[1]=0x64;
	ldw	x, (0x0a, sp)
	ld	a, #0x64
	ld	(x), a
;	joysticksend.c: 297: temp[2]=0x00;
	ldw	x, (0x08, sp)
	clr	(x)
;	joysticksend.c: 298: temp[3]=0x81;
	ldw	x, (0x06, sp)
	ld	a, #0x81
	ld	(x), a
;	joysticksend.c: 299: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 300: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 305: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 306: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	joysticksend.c: 307: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 308: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 309: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 310: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 311: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
;	joysticksend.c: 316: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 317: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	joysticksend.c: 318: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 319: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 320: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 321: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 322: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
	addw	sp, #13
	ret
;	joysticksend.c: 326: void SE8R01_Analog_Init()           //SE8R01 初始化
;	-----------------------------------------
;	 function SE8R01_Analog_Init
;	-----------------------------------------
_SE8R01_Analog_Init:
	sub	sp, #21
;	joysticksend.c: 331: gtemp[0]=0x28;
	ldw	x, #_gtemp+0
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	ld	a, #0x28
	ld	(x), a
;	joysticksend.c: 332: gtemp[1]=0x32;
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x12, sp)
	ld	a, #0x32
	ld	(x), a
;	joysticksend.c: 333: gtemp[2]=0x80;
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, #0x80
	ld	(x), a
;	joysticksend.c: 334: gtemp[3]=0x90;
	ldw	x, (0x14, sp)
	addw	x, #0x0003
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	ld	a, #0x90
	ld	(x), a
;	joysticksend.c: 335: gtemp[4]=0x00;
	ldw	x, (0x14, sp)
	addw	x, #0x0004
	clr	(x)
;	joysticksend.c: 336: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
	ldw	x, (0x14, sp)
	push	#0x05
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 337: delay(2);
	push	#0x02
	push	#0x00
	call	_delay
	addw	sp, #2
;	joysticksend.c: 340: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 342: temp[0]=0x40;
	ldw	x, sp
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 343: temp[1]=0x01;               
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x01
	ld	(x), a
;	joysticksend.c: 344: temp[2]=0x30;               
	ldw	x, (0x0c, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x30
	ld	(x), a
;	joysticksend.c: 346: { temp[3]=0xE2; }              
	ldw	x, (0x0c, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
;	joysticksend.c: 345: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00102$
;	joysticksend.c: 346: { temp[3]=0xE2; }              
	ldw	x, (0x06, sp)
	ld	a, #0xe2
	ld	(x), a
	jra	00103$
00102$:
;	joysticksend.c: 348: { temp[3]=0xE0;}
	ldw	x, (0x06, sp)
	ld	a, #0xe0
	ld	(x), a
00103$:
;	joysticksend.c: 350: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 352: temp[0]=0x29;
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
;	joysticksend.c: 353: temp[1]=0x89;
	ldw	x, (0x0a, sp)
	ld	a, #0x89
	ld	(x), a
;	joysticksend.c: 354: temp[2]=0x55;                     
	ldw	x, (0x08, sp)
	ld	a, #0x55
	ld	(x), a
;	joysticksend.c: 355: temp[3]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 356: temp[4]=0x50;
	ldw	x, (0x0c, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	joysticksend.c: 357: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
	ldw	x, (0x0c, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 359: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	joysticksend.c: 360: { temp[0]=0x29;}
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00106$
00105$:
;	joysticksend.c: 362: { temp[0]=0x14;}
	ldw	x, (0x0c, sp)
	ld	a, #0x14
	ld	(x), a
00106$:
;	joysticksend.c: 364: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 366: temp[0]=0x55;
	ldw	x, (0x0c, sp)
	ld	a, #0x55
	ld	(x), a
;	joysticksend.c: 367: temp[1]=0xC2;
	ldw	x, (0x0a, sp)
	ld	a, #0xc2
	ld	(x), a
;	joysticksend.c: 368: temp[2]=0x09;
	ldw	x, (0x08, sp)
	ld	a, #0x09
	ld	(x), a
;	joysticksend.c: 369: temp[3]=0xAC;  
	ldw	x, (0x06, sp)
	ld	a, #0xac
	ld	(x), a
;	joysticksend.c: 370: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x31
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 372: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	joysticksend.c: 373: temp[1]=0x14;
	ldw	x, (0x0a, sp)
	ld	a, #0x14
	ld	(x), a
;	joysticksend.c: 374: temp[2]=0x08;   
	ldw	x, (0x08, sp)
	ld	a, #0x08
	ld	(x), a
;	joysticksend.c: 375: temp[3]=0x29;
	ldw	x, (0x06, sp)
	ld	a, #0x29
	ld	(x), a
;	joysticksend.c: 376: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x33
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 378: temp[0]=0x02;
	ldw	x, (0x0c, sp)
	ld	a, #0x02
	ld	(x), a
;	joysticksend.c: 379: temp[1]=0xC1;
	ldw	x, (0x0a, sp)
	ld	a, #0xc1
	ld	(x), a
;	joysticksend.c: 380: temp[2]=0xCB;  
	ldw	x, (0x08, sp)
	ld	a, #0xcb
	ld	(x), a
;	joysticksend.c: 381: temp[3]=0x1C;
	ldw	x, (0x06, sp)
	ld	a, #0x1c
	ld	(x), a
;	joysticksend.c: 382: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 384: temp[0]=0x97;
	ldw	x, (0x0c, sp)
	ld	a, #0x97
	ld	(x), a
;	joysticksend.c: 385: temp[1]=0x64;
	ldw	x, (0x0a, sp)
	ld	a, #0x64
	ld	(x), a
;	joysticksend.c: 386: temp[2]=0x00;
	ldw	x, (0x08, sp)
	clr	(x)
;	joysticksend.c: 387: temp[3]=0x01;
	ldw	x, (0x06, sp)
	ld	a, #0x01
	ld	(x), a
;	joysticksend.c: 388: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 390: gtemp[0]=0x2A;
	ldw	x, (0x14, sp)
	ld	a, #0x2a
	ld	(x), a
;	joysticksend.c: 391: gtemp[1]=0x04;
	ldw	x, (0x12, sp)
	ld	a, #0x04
	ld	(x), a
;	joysticksend.c: 392: gtemp[2]=0x00;
	ldw	x, (0x10, sp)
	clr	(x)
;	joysticksend.c: 393: gtemp[3]=0x7D;
	ldw	x, (0x0e, sp)
	ld	a, #0x7d
	ld	(x), a
;	joysticksend.c: 394: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 396: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
	addw	sp, #21
	ret
;	joysticksend.c: 399: void SE8R01_Init()  
;	-----------------------------------------
;	 function SE8R01_Init
;	-----------------------------------------
_SE8R01_Init:
	sub	sp, #5
;	joysticksend.c: 402: SE8R01_Calibration();   
	call	_SE8R01_Calibration
;	joysticksend.c: 403: SE8R01_Analog_Init();   
	call	_SE8R01_Analog_Init
;	joysticksend.c: 407: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	joysticksend.c: 408: {  temp[0]=0b01001111; }     //2MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x4f
	ld	(x), a
	jra	00106$
00105$:
;	joysticksend.c: 409: else if  (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	joysticksend.c: 410: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x47
	ld	(x), a
	jra	00106$
00102$:
;	joysticksend.c: 412: {temp[0]=0b01101111;  }     //500K,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x6f
	ld	(x), a
00106$:
;	joysticksend.c: 414: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 416: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0x01);          //enable auto acc on pip 1
	push	#0x01
	push	#0x21
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 417: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0x01);      //enable pip 1
	push	#0x01
	push	#0x22
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 418: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);        //4 byte adress
	push	#0x02
	push	#0x23
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 419: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_RETR, 0x08);        //lowest 4 bits 0-15 rt transmisston higest 4 bits 256-4096us Auto Retransmit Delay
	push	#0x08
	push	#0x24
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 420: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
	push	#0x28
	push	#0x25
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 421: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0x01);          //pipe0 pipe1 enable dynamic payload length data
	push	#0x01
	push	#0x3c
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 422: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
	push	#0x07
	push	#0x3d
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 423: write_spi_reg(WRITE_REG + CONFIG, 0x3E);
	push	#0x3e
	push	#0x20
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 424: write_spi_buf(WRITE_REG + TX_ADDR, TX_ADDRESS, ADR_WIDTH);  //from tx
	ldw	x, #_TX_ADDRESS+0
	ldw	y, x
	pushw	x
	push	#0x04
	pushw	y
	push	#0x30
	call	_write_spi_buf
	addw	sp, #4
	popw	x
;	joysticksend.c: 426: write_spi_buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Use the same address on the RX device as the TX device write_spi_reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
	push	#0x04
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 429: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	addw	sp, #5
	ret
;	joysticksend.c: 435: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #66
;	joysticksend.c: 440: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #40
	ld	a, #0xd2
	ld	(y), a
	ldw	x, y
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	incw	x
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0003, x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0004, x), a
;	joysticksend.c: 441: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #35
	ld	a, #0xe1
	ld	(y), a
	ldw	x, y
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	incw	x
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0003, x), a
	ldw	x, y
	addw	x, #0x0004
	ld	a, #0xf0
	ld	(x), a
;	joysticksend.c: 444: InitializeSystemClock();
	call	_InitializeSystemClock
;	joysticksend.c: 451: PD_DDR |= (1 << 2) ; // output mode
	ldw	x, #0x5011
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	joysticksend.c: 452: PD_CR1 |= (1 << 2) ; // push-pull
	ldw	x, #0x5012
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	joysticksend.c: 454: PD_ODR &= ~(1 << 2);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	joysticksend.c: 459: PD_DDR &= ~(1<<4);
	ldw	x, #0x5011
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 460: PD_CR1 |= (1<<4);
	ldw	x, #0x5012
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	joysticksend.c: 469: InitializeSPI ();
	call	_InitializeSPI
;	joysticksend.c: 472: memset (tx_payload, 0, sizeof(tx_payload));
	ldw	x, sp
	incw	x
	incw	x
	ldw	(0x3b, sp), x
	ldw	y, (0x3b, sp)
	push	#0x21
	push	#0x00
	clrw	x
	pushw	x
	pushw	y
	call	_memset
	addw	sp, #6
;	joysticksend.c: 475: init_io();                        // Initialize IO port
	call	_init_io
;	joysticksend.c: 476: write_spi_reg(FLUSH_TX,0); // transmit -- send data 
	push	#0x00
	push	#0xe1
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 477: readstatus = read_spi_reg(CONFIG);
	push	#0x00
	call	_read_spi_reg
	pop	a
;	joysticksend.c: 478: readstatus = read_spi_reg(STATUS);
	push	#0x07
	call	_read_spi_reg
	pop	a
;	joysticksend.c: 480: SE8R01_Init();
	call	_SE8R01_Init
;	joysticksend.c: 484: while (1) {
00110$:
;	joysticksend.c: 488: xaxis=0;
	clrw	x
	ldw	(0x39, sp), x
;	joysticksend.c: 489: yaxis=0;
	clrw	x
	ldw	(0x3f, sp), x
;	joysticksend.c: 490: joyswitch = PD_IDR & (1<<4);
	ldw	x, #0x5010
	ld	a, (x)
	and	a, #0x10
	ld	(0x01, sp), a
;	joysticksend.c: 492: if (joyswitch == 1) PD_ODR &= ~(1 << 2); //switch led on port PD2 on
	ld	a, (0x01, sp)
	cp	a, #0x01
	jrne	00102$
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
00102$:
;	joysticksend.c: 494: ADC_CSR |= ((0x0F)&5); // select channel = 5 = PD5
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x05
	ld	(x), a
;	joysticksend.c: 495: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 496: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	joysticksend.c: 497: ADC_CR1 |= ADC_ADON; // start conversion 
	bset	0x5401, #0
;	joysticksend.c: 498: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00103$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00103$
;	joysticksend.c: 500: xaxis |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	rlwa	x
	clr	a
	rrwa	x
	ldw	y, (0x39, sp)
	ldw	(0x3d, sp), y
	or	a, (0x3e, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x3d, sp)
	ld	yh, a
;	joysticksend.c: 501: xaxis |= (unsigned int)ADC_DRH<<8;
	ldw	x, #0x5404
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x37, sp), y
	ld	a, xl
	or	a, (0x38, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x37, sp)
	ld	yh, a
;	joysticksend.c: 503: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	joysticksend.c: 504: xaxis &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
	ld	a, yh
	and	a, #0x03
	ld	yh, a
	ldw	(0x35, sp), y
;	joysticksend.c: 506: ADC_CSR |= ((0x0F)&6); // select channel = 6 = PD6
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x06
	ld	(x), a
;	joysticksend.c: 507: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 508: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	joysticksend.c: 509: ADC_CR1 |= ADC_ADON; // start conversion 
	bset	0x5401, #0
;	joysticksend.c: 510: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00106$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00106$
;	joysticksend.c: 512: yaxis |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	rlwa	x
	clr	a
	rrwa	x
	ldw	y, (0x3f, sp)
	ldw	(0x33, sp), y
	or	a, (0x34, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x33, sp)
	ld	yh, a
;	joysticksend.c: 513: yaxis |= (unsigned int)ADC_DRH<<8;
	ldw	x, #0x5404
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x31, sp), y
	ld	a, xl
	or	a, (0x32, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x31, sp)
	ld	yh, a
;	joysticksend.c: 515: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	joysticksend.c: 516: yaxis &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
	ld	a, yh
	and	a, #0x03
	ld	yh, a
;	joysticksend.c: 521: tx_payload[0] = 0xac; //first two is unique ID for this emitter 
	ldw	x, (0x3b, sp)
	ld	a, #0xac
	ld	(x), a
;	joysticksend.c: 522: tx_payload[1] = 0xcc;
	ldw	x, (0x3b, sp)
	incw	x
	ld	a, #0xcc
	ld	(x), a
;	joysticksend.c: 523: tx_payload[2] = xaxis>>8;
	ldw	x, (0x3b, sp)
	incw	x
	incw	x
	ldw	(0x2f, sp), x
	ldw	x, (0x35, sp)
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	ld	a, xl
	ldw	x, (0x2f, sp)
	ld	(x), a
;	joysticksend.c: 524: tx_payload[3] = xaxis & 0x00ff; 
	ldw	x, (0x3b, sp)
	addw	x, #0x0003
	ld	a, (0x36, sp)
	push	a
	clr	(0x2e, sp)
	pop	a
	ld	(x), a
;	joysticksend.c: 525: tx_payload[4] = yaxis>>8;
	ldw	x, (0x3b, sp)
	addw	x, #0x0004
	ldw	(0x41, sp), x
	ldw	x, y
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	ld	a, xl
	ldw	x, (0x41, sp)
	ld	(x), a
;	joysticksend.c: 526: tx_payload[5] = yaxis & 0x00ff; 
	ldw	x, (0x3b, sp)
	addw	x, #0x0005
	clr	a
	ld	a, yl
	ld	(x), a
;	joysticksend.c: 527: tx_payload[6] = joyswitch; 
	ldw	x, (0x3b, sp)
	ld	a, (0x01, sp)
	ld	(0x0006, x), a
;	joysticksend.c: 528: write_spi_buf(iRF_CMD_WR_TX_PLOAD, tx_payload, 7);
	ldw	x, (0x3b, sp)
	push	#0x07
	pushw	x
	push	#0xa0
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 529: write_spi_reg(WRITE_REG+STATUS, 0xff);
	push	#0xff
	push	#0x27
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 536: delay(4);
	push	#0x04
	push	#0x00
	call	_delay
	addw	sp, #2
;	joysticksend.c: 537: PD_ODR &= ~(1 << 2); //switch led on pd2 off
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	jp	00110$
	addw	sp, #66
	ret
	.area CODE
	.area INITIALIZER
__xinit__SE8R01_DR_2M:
	.dw #0x0000
__xinit__SE8R01_DR_1M:
	.dw #0x0000
__xinit__SE8R01_DR_500K:
	.dw #0x0001
__xinit__pload_width_now:
	.dw #0x0000
__xinit__newdata:
	.dw #0x0000
__xinit__signal_lv:
	.db #0x00	;  0
__xinit__pip:
	.dw #0x0000
__xinit__status:
	.db #0x00	; 0
__xinit__TX_ADDRESS:
	.db #0xB3	; 179
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__ADDRESS2:
	.db #0xB1	; 177
__xinit__ADDRESS3:
	.db #0xB2	; 178
__xinit__ADDRESS4:
	.db #0xB3	; 179
__xinit__ADDRESS5:
	.db #0xB4	; 180
__xinit__ADDRESS1:
	.db #0xB0	; 176
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__ADDRESS0:
	.db #0x34	; 52	'4'
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__rx_buf:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__tx_buf:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.area CABS (ABS)
