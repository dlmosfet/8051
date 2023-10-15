		ORG		0000h
		SJMP	START
; ============= 註冊中斷服務副程式 ==============
		ORG		0003h
		LCALL	INT0_ISR
		RETI
		ORG		0013h
		LCALL	INT1_ISR
		RETI
; ==============================================
; 主程式
		ORG		0030h
START:
        SETB    PX0       ; 將PX0設為1，使INT0加入高優先權的組別
        CLR     PX1       ; 將PX1設為0，使INT1加入低優先權的組別

		SETB	IT0		  ; 設定INT0為負緣觸發
		SETB	EX0		  ; 啟用INT0中斷

        SETB    IT1		  ; 設定INT1為負緣觸發
        SETB    EX1		  ; 啟用INT1中斷

		SETB	EA		  ; 啟用中斷

        MOV     A, #0FEh  ; 初始資料（亮1顆LED）

; =================== 跑馬燈 ===================
LOOP:
        RR A              ; 資料向右旋轉一位
        MOV P1, A         ; 將資料輸出到P1
        CALL DELAY        ; 延遲
		LJMP	LOOP      ; 無窮迴圈
; ==============================================

; =============== 中斷服務副程式 ================
INT0_ISR:
        MOV     R2, #0Ah
BLINK1: MOV     P1, #0F0h  ; 閃爍模式1
        LCALL   DELAY
        MOV     P1, #0FFh
        LCALL   DELAY
        DJNZ    R2, BLINK1
		RET
; ==============================================

; =============== 中斷服務副程式 ================
INT1_ISR:
        MOV     R3, #0Ah  ; 閃爍次數 
BLINK2: MOV     P1, #0Fh  ; 閃爍模式2
        LCALL   DELAY
        MOV     P1, #0FFh
        LCALL   DELAY
        DJNZ    R3, BLINK2
		RET
; ==============================================

; Delay
DELAY:	MOV		R0,#80h
DELAY0:	MOV		R1,#80h
DELAY1:	DJNZ	R1,DELAY1
		DJNZ	R0,DELAY0
		RET
		END