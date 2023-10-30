- 語法筆記 組合語言
- 8051組合語言的基本模板
```
ORG	0000h
	SJMP	START
;
;Interrupt Vector Table
	ORG	0003h
	LCALL	INT0_ISR
	RETI
	ORG	000Bh
	LCALL	T0_ISR
	RETI
	ORG	0013h
	LCALL	INT1_ISR
	RETI
	ORG	001Bh
	LCALL	T1_ISR
	RETI
	ORG	0023h
	LCALL	UART_ISR
	RETI
;
	ORG	0030h
START:
;	Initialization
;
;	Task
;
DONE:	SJMP	DONE
;		
INT0_ISR:
;	Service Routine for External Interrupt 0
	RET
T0_ISR:
;	Service Routine for Timer 0 Interrupt
	RET
INT1_ISR:
;	Service Routine for External Interrupt 1
	RET
T1_ISR:
;       Service Routine for Timer 1 Interrupt
	RET
UART_ISR:
;	Service Routine for UART Interrupt
	RET
;
	END
```
- 8051 C語言的基本模板
```

General C Program Structure, SDCC.c
// Template for SDCC 8051 C program

#include <8051.h> // Defining SFRs

// ISR Prototypes ===================================================
void INT0_ISR(void) __interrupt (0); // ISR for External Interrupt 0
void T0_ISR(void)   __interrupt (1); // ISR for Timer0/Counter0 Overflow Interrupt
void INT1_ISR(void) __interrupt (2); // ISR for External Interrupt 1
void T1_ISR(void)   __interrupt (3); // ISR for Timer1/Counter1 Overflow Interrupt
void UART_ISR(void) __interrupt (4); // ISR for UART Interrupt

void main(void)
{
}

void INT0_ISR(void) __interrupt (0)
{}
void T0_ISR(void) __interrupt (1)
{}
void INT1_ISR(void) __interrupt (2)
{}
void T1_ISR(void) __interrupt (3)
{}
void UART_ISR(void) __interrupt (4)
{}
```
- 常用指令
