GuitarHeroGame

Introduction

For this lab we were asked to create our own project applying skills learned throughout Labs 1-7. The design of this lab was inspired by the commonly played games Rockband, Tap Tap and Guitar Hero. The basic idea for this type of game is that there are lines of LEDs sending a signal towards the user who selects the correct button corresponding to the signal sent by the LEDs to gain points. This was done so by having a line of LEDs on a Styrofoam board (so they are evenly spaced) connected to a breadboard which is connected to an FPGA board sending the signals as to which lights turn on when. The buttons on the FPGA Board are used as the user’s input and the score is displayed on the 7 segment LED. All the coding is done in Verilog; a shift register is used to send the signal down the columns of LEDs; the signals of the LEDs used in this lab play to the song “Eye of a Tiger” by American rock band “Survivor”.

Problem Statement

Create a game similar to Rockband, Tap Tap and Guitar Hero where a signal is send down columns of LEDs and the user inputs the corresponding button to the LEDs which have reached the bottom of the columns of LEDs.

Materials & Equipment

- 1 Spartan-3 XCS200 Field-Programmable Gate Array (FPGA) Board
- 24 LEDs
- 24 220 ohm resistors
- 2 breadboards 
- 1 ribbon cable
- 4 2x4 inch thin Styrofoam boards
- wires
