###############################################################################
# Makefile for project 
###############################################################################

## General options
PROJECT = 
MCU = AT89C51
COMPILER = "Keil for 8051"
TARGET = Debug
SHELL = C:\Windows\system32\cmd.exe

## Tools general options
CCFLAGS=ROM(SMALL) BROWSE DEBUG CODE OBJECTEXTEND PREPRINT

## Processing Tools
CC=C51.exe
LD=BL51.exe
ASM=A51.exe
#  J:/单片机课程仿真/点阵显示/AT89C51/Debug/Debug.OMF: TOOL=LD
#     J:/单片机课程仿真/点阵显示/AT89C51/Debug/main.OBJ: TOOL=CC
#        J:/单片机课程仿真/点阵显示/AT89C51/main.c
#     J:/单片机课程仿真/点阵显示/AT89C51/Debug/kel2led.OBJ: TOOL=CC
#        J:/单片机课程仿真/点阵显示/AT89C51/kel2led.c

# Build tree:
all:	Debug

Debug:	Debug.OMF

Debug.OMF:	main.OBJ kel2led.OBJ 
	"C:\Program Files (x86)\Labcenter Electronics\Proteus 8 Professional\VSM Studio\Tools\RunTool.exe" --good-exits=0,1 --executable=$(LD) "main.OBJ","kel2led.OBJ" TO "Debug.OMF" $(LDFLAGS) 

main.OBJ:	../main.c 
	"C:\Program Files (x86)\Labcenter Electronics\Proteus 8 Professional\VSM Studio\Tools\RunTool.exe" --good-exits=0,1 --executable=$(CC) "..\main.c" $(CCFLAGS)  OBJECT("main.OBJ")

kel2led.OBJ:	../kel2led.c 
	"C:\Program Files (x86)\Labcenter Electronics\Proteus 8 Professional\VSM Studio\Tools\RunTool.exe" --good-exits=0,1 --executable=$(CC) "..\kel2led.c" $(CCFLAGS)  OBJECT("kel2led.OBJ")

# tidy - delete all temporary files which are not involved in the target generation
tidy:
	rm -rf Debug.M51
	rm -rf ./main.lst
	rm -rf ./main.I
	rm -rf ./kel2led.lst
	rm -rf ./kel2led.I

# cleanup - delete all generated files
clean:	tidy
	rm -rf Debug.OMF
	rm -rf main.OBJ
	rm -rf kel2led.OBJ

