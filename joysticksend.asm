;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
; This file was generated Mon Feb  5 13:04:22 2018
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
;	joysticksend.c: 37: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	joysticksend.c: 39: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	joysticksend.c: 40: __asm__("nop");
	nop
	dec	a
;	joysticksend.c: 39: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	joysticksend.c: 42: UCHAR write_spi (UCHAR value) {
;	-----------------------------------------
;	 function write_spi
;	-----------------------------------------
_write_spi:
;	joysticksend.c: 44: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 45: SPI_DR = value;
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
;	joysticksend.c: 46: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 47: while ((SPI_SR & TXE) == 0);
00101$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	joysticksend.c: 48: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 49: while ((SPI_SR & RXNE) == 0);
00104$:
	ldw	x, #0x5203
	ld	a, (x)
	srl	a
	jrnc	00104$
;	joysticksend.c: 50: delayTenMicro ();
	call	_delayTenMicro
;	joysticksend.c: 51: ret = SPI_DR;
	ldw	x, #0x5204
	ld	a, (x)
;	joysticksend.c: 52: return (ret);
	ret
;	joysticksend.c: 54: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
;	-----------------------------------------
;	 function write_spi_reg
;	-----------------------------------------
_write_spi_reg:
	push	a
;	joysticksend.c: 56: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 57: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	joysticksend.c: 58: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	joysticksend.c: 59: write_spi (value);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	pop	a
	jra	00103$
00102$:
;	joysticksend.c: 61: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	joysticksend.c: 62: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 63: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	joysticksend.c: 65: UCHAR read_spi_reg (UCHAR reg) {
;	-----------------------------------------
;	 function read_spi_reg
;	-----------------------------------------
_read_spi_reg:
	push	a
;	joysticksend.c: 67: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 68: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	joysticksend.c: 69: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	joysticksend.c: 70: ret = write_spi (NOP);
	push	#0xff
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	joysticksend.c: 72: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	joysticksend.c: 73: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 74: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	joysticksend.c: 76: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function write_spi_buf
;	-----------------------------------------
_write_spi_buf:
	sub	sp, #2
;	joysticksend.c: 78: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 79: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x02, sp), a
;	joysticksend.c: 80: for (n = 0; n < len; ++n)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	joysticksend.c: 81: write_spi (array[n]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_write_spi
	pop	a
;	joysticksend.c: 80: for (n = 0; n < len; ++n)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	joysticksend.c: 82: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 83: return (ret);
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	joysticksend.c: 85: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function read_spi_buf
;	-----------------------------------------
_read_spi_buf:
	sub	sp, #2
;	joysticksend.c: 87: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	joysticksend.c: 88: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	joysticksend.c: 89: for (n = 0; n < len; ++n)
	clr	(0x02, sp)
00103$:
	ld	a, (0x02, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	joysticksend.c: 90: array[n] = write_spi (NOP);
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
;	joysticksend.c: 89: for (n = 0; n < len; ++n)
	inc	(0x02, sp)
	jra	00103$
00101$:
;	joysticksend.c: 91: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 92: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #2
	ret
;	joysticksend.c: 94: void InitializeSPI () {
;	-----------------------------------------
;	 function InitializeSPI
;	-----------------------------------------
_InitializeSPI:
;	joysticksend.c: 95: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
	ldw	x, #0x5200
	ld	a, #0x7c
	ld	(x), a
;	joysticksend.c: 96: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
	ldw	x, #0x5201
	clr	(x)
;	joysticksend.c: 97: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
	ldw	x, #0x5202
	clr	(x)
;	joysticksend.c: 98: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
	ldw	x, #0x500c
	ld	a, #0x18
	ld	(x), a
;	joysticksend.c: 99: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
	ldw	x, #0x500d
	ld	a, #0x18
	ld	(x), a
;	joysticksend.c: 100: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
	ldw	x, #0x500e
	ld	a, #0x18
	ld	(x), a
;	joysticksend.c: 102: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
	ret
;	joysticksend.c: 104: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	joysticksend.c: 105: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	joysticksend.c: 106: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	joysticksend.c: 107: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	joysticksend.c: 108: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	joysticksend.c: 109: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	joysticksend.c: 110: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	joysticksend.c: 111: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	joysticksend.c: 112: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	joysticksend.c: 113: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	joysticksend.c: 114: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	joysticksend.c: 115: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	joysticksend.c: 116: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	joysticksend.c: 117: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	joysticksend.c: 118: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	joysticksend.c: 120: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	joysticksend.c: 122: for (x = 0; x < 1036*time_ms; ++x)
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
;	joysticksend.c: 123: __asm__("nop");
	nop
;	joysticksend.c: 122: for (x = 0; x < 1036*time_ms; ++x)
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
;	joysticksend.c: 197: void init_io(void)
;	-----------------------------------------
;	 function init_io
;	-----------------------------------------
_init_io:
;	joysticksend.c: 206: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 208: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	joysticksend.c: 214: void rf_switch_bank(unsigned char bankindex)
;	-----------------------------------------
;	 function rf_switch_bank
;	-----------------------------------------
_rf_switch_bank:
	push	a
;	joysticksend.c: 217: temp1 = bankindex;
	ld	a, (0x04, sp)
	ld	(0x01, sp), a
;	joysticksend.c: 219: temp0 = write_spi(iRF_BANK0_STATUS);
	push	#0x07
	call	_write_spi
	addw	sp, #1
;	joysticksend.c: 221: if((temp0&0x80)!=temp1)
	and	a, #0x80
	cp	a, (0x01, sp)
	jreq	00103$
;	joysticksend.c: 223: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
	push	#0x53
	push	#0x50
	call	_write_spi_reg
	addw	sp, #2
00103$:
	pop	a
	ret
;	joysticksend.c: 230: void SE8R01_Calibration()
;	-----------------------------------------
;	 function SE8R01_Calibration
;	-----------------------------------------
_SE8R01_Calibration:
	sub	sp, #13
;	joysticksend.c: 233: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 234: temp[0]=0x03;
	ldw	x, sp
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0x03
	ld	(x), a
;	joysticksend.c: 235: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x20
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 237: temp[0]=0x32;
	ldw	x, (0x0c, sp)
	ld	a, #0x32
	ld	(x), a
;	joysticksend.c: 239: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x25
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 243: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	joysticksend.c: 244: {temp[0]=0x48;}
	ldw	x, (0x0c, sp)
	ld	a, #0x48
	ld	(x), a
	jra	00106$
00105$:
;	joysticksend.c: 245: else if (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	joysticksend.c: 246: {temp[0]=0x40;}
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
	jra	00106$
00102$:
;	joysticksend.c: 248: {temp[0]=0x68;}   
	ldw	x, (0x0c, sp)
	ld	a, #0x68
	ld	(x), a
00106$:
;	joysticksend.c: 250: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 251: temp[0]=0x77;
	ldw	x, (0x0c, sp)
	ld	a, #0x77
	ld	(x), a
;	joysticksend.c: 252: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 254: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 255: temp[0]=0x40;
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 256: temp[1]=0x00;
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	clr	(x)
;	joysticksend.c: 257: temp[2]=0x10;
	ldw	x, (0x0c, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x10
	ld	(x), a
;	joysticksend.c: 259: {temp[3]=0xE6;}
	ldw	x, (0x0c, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
;	joysticksend.c: 258: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00108$
;	joysticksend.c: 259: {temp[3]=0xE6;}
	ldw	x, (0x06, sp)
	ld	a, #0xe6
	ld	(x), a
	jra	00109$
00108$:
;	joysticksend.c: 261: {temp[3]=0xE4;}
	ldw	x, (0x06, sp)
	ld	a, #0xe4
	ld	(x), a
00109$:
;	joysticksend.c: 263: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 265: temp[0]=0x20;
	ldw	x, (0x0c, sp)
	ld	a, #0x20
	ld	(x), a
;	joysticksend.c: 266: temp[1]=0x08;
	ldw	x, (0x0a, sp)
	ld	a, #0x08
	ld	(x), a
;	joysticksend.c: 267: temp[2]=0x50;
	ldw	x, (0x08, sp)
	ld	a, #0x50
	ld	(x), a
;	joysticksend.c: 268: temp[3]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 269: temp[4]=0x50;
	ldw	x, (0x0c, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	joysticksend.c: 270: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
	ldw	x, (0x0c, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 272: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	joysticksend.c: 273: temp[1]=0x00;
	ldw	x, (0x0a, sp)
	clr	(x)
;	joysticksend.c: 274: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00111$
;	joysticksend.c: 275: { temp[2]=0x1E;}
	ldw	x, (0x08, sp)
	ld	a, #0x1e
	ld	(x), a
	jra	00112$
00111$:
;	joysticksend.c: 277: { temp[2]=0x1F;}
	ldw	x, (0x08, sp)
	ld	a, #0x1f
	ld	(x), a
00112$:
;	joysticksend.c: 279: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
	ldw	x, (0x0c, sp)
	push	#0x03
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 281: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00114$
;	joysticksend.c: 282: { temp[0]=0x29;}
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00115$
00114$:
;	joysticksend.c: 284: { temp[0]=0x14;}
	ldw	x, (0x0c, sp)
	ld	a, #0x14
	ld	(x), a
00115$:
;	joysticksend.c: 286: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 288: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	joysticksend.c: 289: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x37
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 291: temp[0]=0x7F;
	ldw	x, (0x0c, sp)
	ld	a, #0x7f
	ld	(x), a
;	joysticksend.c: 292: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x38
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 294: temp[0]=0x02;
	ldw	x, (0x0c, sp)
	ld	a, #0x02
	ld	(x), a
;	joysticksend.c: 295: temp[1]=0xC1;
	ldw	x, (0x0a, sp)
	ld	a, #0xc1
	ld	(x), a
;	joysticksend.c: 296: temp[2]=0xEB;            
	ldw	x, (0x08, sp)
	ld	a, #0xeb
	ld	(x), a
;	joysticksend.c: 297: temp[3]=0x1C;
	ldw	x, (0x06, sp)
	ld	a, #0x1c
	ld	(x), a
;	joysticksend.c: 298: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 300: temp[0]=0x97;
	ldw	x, (0x0c, sp)
	ld	a, #0x97
	ld	(x), a
;	joysticksend.c: 301: temp[1]=0x64;
	ldw	x, (0x0a, sp)
	ld	a, #0x64
	ld	(x), a
;	joysticksend.c: 302: temp[2]=0x00;
	ldw	x, (0x08, sp)
	clr	(x)
;	joysticksend.c: 303: temp[3]=0x81;
	ldw	x, (0x06, sp)
	ld	a, #0x81
	ld	(x), a
;	joysticksend.c: 304: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 305: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 310: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 311: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	joysticksend.c: 312: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 313: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 314: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 315: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 316: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
;	joysticksend.c: 321: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 322: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	joysticksend.c: 323: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 324: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 325: delayTenMicro();
	call	_delayTenMicro
;	joysticksend.c: 326: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	joysticksend.c: 327: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
	addw	sp, #13
	ret
;	joysticksend.c: 331: void SE8R01_Analog_Init()           //SE8R01 初始化
;	-----------------------------------------
;	 function SE8R01_Analog_Init
;	-----------------------------------------
_SE8R01_Analog_Init:
	sub	sp, #21
;	joysticksend.c: 336: gtemp[0]=0x28;
	ldw	x, #_gtemp+0
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	ld	a, #0x28
	ld	(x), a
;	joysticksend.c: 337: gtemp[1]=0x32;
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x12, sp)
	ld	a, #0x32
	ld	(x), a
;	joysticksend.c: 338: gtemp[2]=0x80;
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, #0x80
	ld	(x), a
;	joysticksend.c: 339: gtemp[3]=0x90;
	ldw	x, (0x14, sp)
	addw	x, #0x0003
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	ld	a, #0x90
	ld	(x), a
;	joysticksend.c: 340: gtemp[4]=0x00;
	ldw	x, (0x14, sp)
	addw	x, #0x0004
	clr	(x)
;	joysticksend.c: 341: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
	ldw	x, (0x14, sp)
	push	#0x05
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 342: delay(2);
	push	#0x02
	push	#0x00
	call	_delay
	addw	sp, #2
;	joysticksend.c: 345: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	joysticksend.c: 347: temp[0]=0x40;
	ldw	x, sp
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 348: temp[1]=0x01;               
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x01
	ld	(x), a
;	joysticksend.c: 349: temp[2]=0x30;               
	ldw	x, (0x0c, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x30
	ld	(x), a
;	joysticksend.c: 351: { temp[3]=0xE2; }              
	ldw	x, (0x0c, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
;	joysticksend.c: 350: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00102$
;	joysticksend.c: 351: { temp[3]=0xE2; }              
	ldw	x, (0x06, sp)
	ld	a, #0xe2
	ld	(x), a
	jra	00103$
00102$:
;	joysticksend.c: 353: { temp[3]=0xE0;}
	ldw	x, (0x06, sp)
	ld	a, #0xe0
	ld	(x), a
00103$:
;	joysticksend.c: 355: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 357: temp[0]=0x29;
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
;	joysticksend.c: 358: temp[1]=0x89;
	ldw	x, (0x0a, sp)
	ld	a, #0x89
	ld	(x), a
;	joysticksend.c: 359: temp[2]=0x55;                     
	ldw	x, (0x08, sp)
	ld	a, #0x55
	ld	(x), a
;	joysticksend.c: 360: temp[3]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	joysticksend.c: 361: temp[4]=0x50;
	ldw	x, (0x0c, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	joysticksend.c: 362: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
	ldw	x, (0x0c, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 364: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	joysticksend.c: 365: { temp[0]=0x29;}
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00106$
00105$:
;	joysticksend.c: 367: { temp[0]=0x14;}
	ldw	x, (0x0c, sp)
	ld	a, #0x14
	ld	(x), a
00106$:
;	joysticksend.c: 369: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 371: temp[0]=0x55;
	ldw	x, (0x0c, sp)
	ld	a, #0x55
	ld	(x), a
;	joysticksend.c: 372: temp[1]=0xC2;
	ldw	x, (0x0a, sp)
	ld	a, #0xc2
	ld	(x), a
;	joysticksend.c: 373: temp[2]=0x09;
	ldw	x, (0x08, sp)
	ld	a, #0x09
	ld	(x), a
;	joysticksend.c: 374: temp[3]=0xAC;  
	ldw	x, (0x06, sp)
	ld	a, #0xac
	ld	(x), a
;	joysticksend.c: 375: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x31
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 377: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	joysticksend.c: 378: temp[1]=0x14;
	ldw	x, (0x0a, sp)
	ld	a, #0x14
	ld	(x), a
;	joysticksend.c: 379: temp[2]=0x08;   
	ldw	x, (0x08, sp)
	ld	a, #0x08
	ld	(x), a
;	joysticksend.c: 380: temp[3]=0x29;
	ldw	x, (0x06, sp)
	ld	a, #0x29
	ld	(x), a
;	joysticksend.c: 381: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x33
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 383: temp[0]=0x02;
	ldw	x, (0x0c, sp)
	ld	a, #0x02
	ld	(x), a
;	joysticksend.c: 384: temp[1]=0xC1;
	ldw	x, (0x0a, sp)
	ld	a, #0xc1
	ld	(x), a
;	joysticksend.c: 385: temp[2]=0xCB;  
	ldw	x, (0x08, sp)
	ld	a, #0xcb
	ld	(x), a
;	joysticksend.c: 386: temp[3]=0x1C;
	ldw	x, (0x06, sp)
	ld	a, #0x1c
	ld	(x), a
;	joysticksend.c: 387: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 389: temp[0]=0x97;
	ldw	x, (0x0c, sp)
	ld	a, #0x97
	ld	(x), a
;	joysticksend.c: 390: temp[1]=0x64;
	ldw	x, (0x0a, sp)
	ld	a, #0x64
	ld	(x), a
;	joysticksend.c: 391: temp[2]=0x00;
	ldw	x, (0x08, sp)
	clr	(x)
;	joysticksend.c: 392: temp[3]=0x01;
	ldw	x, (0x06, sp)
	ld	a, #0x01
	ld	(x), a
;	joysticksend.c: 393: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 395: gtemp[0]=0x2A;
	ldw	x, (0x14, sp)
	ld	a, #0x2a
	ld	(x), a
;	joysticksend.c: 396: gtemp[1]=0x04;
	ldw	x, (0x12, sp)
	ld	a, #0x04
	ld	(x), a
;	joysticksend.c: 397: gtemp[2]=0x00;
	ldw	x, (0x10, sp)
	clr	(x)
;	joysticksend.c: 398: gtemp[3]=0x7D;
	ldw	x, (0x0e, sp)
	ld	a, #0x7d
	ld	(x), a
;	joysticksend.c: 399: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 401: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
	addw	sp, #21
	ret
;	joysticksend.c: 404: void SE8R01_Init()  
;	-----------------------------------------
;	 function SE8R01_Init
;	-----------------------------------------
_SE8R01_Init:
	sub	sp, #5
;	joysticksend.c: 407: SE8R01_Calibration();   
	call	_SE8R01_Calibration
;	joysticksend.c: 408: SE8R01_Analog_Init();   
	call	_SE8R01_Analog_Init
;	joysticksend.c: 412: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	joysticksend.c: 413: {  temp[0]=0b01001111; }     //2MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x4f
	ld	(x), a
	jra	00106$
00105$:
;	joysticksend.c: 414: else if  (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	joysticksend.c: 415: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x47
	ld	(x), a
	jra	00106$
00102$:
;	joysticksend.c: 417: {temp[0]=0b01101111;  }     //500K,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x6f
	ld	(x), a
00106$:
;	joysticksend.c: 419: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 421: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0x01);          //enable auto acc on pip 1
	push	#0x01
	push	#0x21
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 422: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0x01);      //enable pip 1
	push	#0x01
	push	#0x22
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 423: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);        //4 byte adress
	push	#0x02
	push	#0x23
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 424: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_RETR, 0x08);        //lowest 4 bits 0-15 rt transmisston higest 4 bits 256-4096us Auto Retransmit Delay
	push	#0x08
	push	#0x24
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 425: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
	push	#0x28
	push	#0x25
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 426: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0x01);          //pipe0 pipe1 enable dynamic payload length data
	push	#0x01
	push	#0x3c
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 427: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
	push	#0x07
	push	#0x3d
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 428: write_spi_reg(WRITE_REG + CONFIG, 0x3E);
	push	#0x3e
	push	#0x20
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 429: write_spi_buf(WRITE_REG + TX_ADDR, TX_ADDRESS, ADR_WIDTH);  //from tx
	ldw	x, #_TX_ADDRESS+0
	ldw	y, x
	pushw	x
	push	#0x04
	pushw	y
	push	#0x30
	call	_write_spi_buf
	addw	sp, #4
	popw	x
;	joysticksend.c: 431: write_spi_buf(WRITE_REG + RX_ADDR_P0, TX_ADDRESS, ADR_WIDTH); // Use the same address on the RX device as the TX device write_spi_reg(WRITE_REG + RX_PW_P0, TX_PLOAD_WIDTH); // Select same RX payload width as TX Payload width
	push	#0x04
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 434: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	addw	sp, #5
	ret
;	joysticksend.c: 440: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #59
;	joysticksend.c: 447: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #45
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
;	joysticksend.c: 448: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #40
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
;	joysticksend.c: 451: InitializeSystemClock();
	call	_InitializeSystemClock
;	joysticksend.c: 454: InitializeSPI ();
	call	_InitializeSPI
;	joysticksend.c: 457: memset (tx_payload, 0, sizeof(tx_payload));
	ldw	x, sp
	addw	x, #7
	ldw	(0x3a, sp), x
	ldw	y, (0x3a, sp)
	push	#0x21
	push	#0x00
	clrw	x
	pushw	x
	pushw	y
	call	_memset
	addw	sp, #6
;	joysticksend.c: 460: init_io();                        // Initialize IO port
	call	_init_io
;	joysticksend.c: 461: write_spi_reg(FLUSH_TX,0); // transmit -- send data 
	push	#0x00
	push	#0xe1
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 462: readstatus = read_spi_reg(CONFIG);
	push	#0x00
	call	_read_spi_reg
	pop	a
;	joysticksend.c: 463: readstatus = read_spi_reg(STATUS);
	push	#0x07
	call	_read_spi_reg
	pop	a
;	joysticksend.c: 465: SE8R01_Init();
	call	_SE8R01_Init
;	joysticksend.c: 469: while (1) {
00110$:
;	joysticksend.c: 471: gemiddeld=0;
	clrw	x
	ldw	(0x01, sp), x
;	joysticksend.c: 472: ampere=0;
	clrw	x
	ldw	(0x38, sp), x
;	joysticksend.c: 473: for(samples=0;samples<100000;samples++)
	clrw	x
	ldw	(0x05, sp), x
	ldw	(0x03, sp), x
00112$:
;	joysticksend.c: 476: ADC_CSR |= ((0x0F)&4); // select channel = 4 = PD3
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	joysticksend.c: 477: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	joysticksend.c: 478: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	joysticksend.c: 479: ADC_CR1 |= ADC_ADON; // start conversion 
	bset	0x5401, #0
;	joysticksend.c: 480: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00101$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00101$
;	joysticksend.c: 482: ampere |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	rlwa	x
	clr	a
	rrwa	x
	ldw	y, (0x38, sp)
	ldw	(0x36, sp), y
	or	a, (0x37, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x36, sp)
	ld	yh, a
;	joysticksend.c: 483: ampere |= (unsigned int)ADC_DRH<<8;
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
	ldw	(0x34, sp), y
	ld	a, xl
	or	a, (0x35, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x34, sp)
	ld	yh, a
;	joysticksend.c: 485: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	joysticksend.c: 486: ampere &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
	ld	a, yh
	and	a, #0x03
	ld	yh, a
	ldw	(0x38, sp), y
;	joysticksend.c: 487: if (ampere > gemiddeld) gemiddeld=ampere;
	ldw	x, (0x38, sp)
	cpw	x, (0x01, sp)
	jrsle	00113$
	ldw	y, (0x38, sp)
	ldw	(0x01, sp), y
00113$:
;	joysticksend.c: 473: for(samples=0;samples<100000;samples++)
	ldw	x, (0x05, sp)
	addw	x, #0x0001
	ldw	(0x05, sp), x
	ld	a, (0x04, sp)
	adc	a, #0x00
	ld	(0x04, sp), a
	ld	a, (0x03, sp)
	adc	a, #0x00
	ld	(0x03, sp), a
	ldw	x, (0x05, sp)
	cpw	x, #0x86a0
	ld	a, (0x04, sp)
	sbc	a, #0x01
	ld	a, (0x03, sp)
	sbc	a, #0x00
	jrsge	00147$
	jp	00112$
00147$:
;	joysticksend.c: 490: if (gemiddeld < 0x001f) gemiddeld=0; //remove unwanted mini measurements
	ldw	x, (0x01, sp)
	cpw	x, #0x001f
	jrsge	00108$
	clrw	x
	ldw	(0x01, sp), x
00108$:
;	joysticksend.c: 491: tx_payload[0] = 0xac; //first two is unique ID for this current sensor
	ldw	x, (0x3a, sp)
	ld	a, #0xac
	ld	(x), a
;	joysticksend.c: 492: tx_payload[1] = 0xcc;
	ldw	x, (0x3a, sp)
	incw	x
	ld	a, #0xcc
	ld	(x), a
;	joysticksend.c: 493: tx_payload[2] = gemiddeld>>8;
	ldw	y, (0x3a, sp)
	addw	y, #0x0002
	ldw	x, (0x01, sp)
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	sraw	x
	ld	a, xl
	ld	(y), a
;	joysticksend.c: 494: tx_payload[3] = gemiddeld & 0x00ff; 
	ldw	x, (0x3a, sp)
	addw	x, #0x0003
	ld	a, (0x02, sp)
	push	a
	clr	(0x33, sp)
	pop	a
	ld	(x), a
;	joysticksend.c: 495: write_spi_buf(iRF_CMD_WR_TX_PLOAD, tx_payload, 4);
	ldw	x, (0x3a, sp)
	push	#0x04
	pushw	x
	push	#0xa0
	call	_write_spi_buf
	addw	sp, #4
;	joysticksend.c: 496: write_spi_reg(WRITE_REG+STATUS, 0xff);
	push	#0xff
	push	#0x27
	call	_write_spi_reg
	addw	sp, #2
;	joysticksend.c: 503: delay(4);
	push	#0x04
	push	#0x00
	call	_delay
	addw	sp, #2
	jp	00110$
	addw	sp, #59
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
