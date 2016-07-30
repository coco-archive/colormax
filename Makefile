ASM=build\lwasm.exe
IMGTOOL=build\imgtool.exe
DSK=coco_jvc_rsdos colormax.dsk
DEL=-$(IMGTOOL) del $(DSK) $@ 1>NUL 2>NUL
PUT=$(IMGTOOL) put $(DSK) $@ $@ --ftype=binary 1>NUL

ARGS=--6809 --format=decb --pragma=6809,c,cd,m80ext,qrts,forwardrefmax,6800compat --symbols-nolocals --list=$*.lst --map=$*.map --output=$@
COMMON=$(ASM) DEFS.TXT LOWDEFS.TXT

colormax.dsk: build\dsk.1987
	copy build\dsk.1987 colormax.dsk

COLORMAX.BIN: CHROUT2.TXT CHRST.TXT COLORMAX.TXT DISKIO2.TXT GREGSTF2.TXT ICONS.TXT MAIN2.TXT \
			PATS.TXT PATTERN.TXT PCOPY.TXT TABLES.TXT TITLEPGE.TXT WINDOW2.TXT $(COMMON)
	$(ASM) $(ARGS) COLORMAX.TXT
	$(DEL)
	$(PUT)

DELUXE.BIN: ARROW.TXT CHROUT.TXT CMAXDEFS.TXT DEFINE.TXT DELUXE.TXT DISKIO.TXT EDITBOX.TXT ERIKSTUF.TXT FIZZLE.TXT \
			GREGSTUF.TXT HIRES.TXT LINES.TXT MAIN.TXT MOVE.TXT OUTFNT.TXT PRTLYN.TXT PULLDOWN.TXT RGBCMP.TXT \
			SPECIAL.TXT WINDOW.TXT $(COMMON)
	$(ASM) $(ARGS) DELUXE.TXT
	$(DEL)
	$(PUT)

DELUXE1.BIN: BRUSH.TXT BRUSHES.TXT EDITOR.TXT SETBRS.TXT $(COMMON)
	$(ASM) $(ARGS) BRUSH.TXT
	$(DEL)
	$(PUT)

DELUXE2.BIN: FATBITS.TXT $(COMMON)
	$(ASM) $(ARGS) FATBITS.TXT
	$(DEL)
	$(PUT)

DELUXE3.BIN: ELLIPSE.TXT ELLIPSES.TXT $(COMMON)
	$(ASM) $(ARGS) ELLIPSE.TXT
	$(DEL)
	$(PUT)

DELUXE4.BIN: DISKSTUF.TXT ENCODED.TXT GIFSVE.TXT LDGIF.TXT LOAD.TXT LOAD128.TXT $(COMMON)
	$(ASM) $(ARGS) LOAD.TXT
	$(DEL)
	$(PUT)

DELUXE5.BIN: CYCLE.TXT SETPAL.TXT $(COMMON)
	$(ASM) $(ARGS) SETPAL.TXT
	$(DEL)
	$(PUT)

DELUXE6.BIN: ANGLES.TXT FILL.TXT FS1.TXT FS2.TXT ROT.TXT ROTATE.TXT $(COMMON)
	$(ASM) $(ARGS) FILL.TXT
	$(DEL)
	$(PUT)

DELUXE7.BIN: BENDH.TXT BENDV.TXT OVERLAYS.TXT REMAP.TXT STRETCH.TXT TILT.TXT $(COMMON)
	$(ASM) $(ARGS) OVERLAYS.TXT
	$(DEL)
	$(PUT)

CGP220.BIN: CGP220.TXT $(COMMON)
	$(ASM) $(ARGS) CGP220.TXT

all: \
	colormax.dsk \
	COLORMAX.BIN \
	DELUXE.BIN DELUXE1.BIN DELUXE2.BIN DELUXE3.BIN DELUXE4.BIN DELUXE5.BIN DELUXE6.BIN DELUXE7.BIN \
	CGP220.BIN 

clean: 
	del *.bin *.lst *.map *.raw *.sdf colormax.dsk 2>NUL
	-rmdir /s /q Debug obj 1>NUL 2>NUL

