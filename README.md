Guitar Hero Made On FPGA

Inspired by commonly played games Rockband, Tap Tap & Guitar Hero, the idea for this game is to press the correct button based on 3 streams of LED signals. 

The LEDs are wired on a Styrofoam board, which is connected to a breadboard, which is connected to a Field Programmable Gate Array (FPGA), which provides the input for turning on and off the LEDs. The propagation of the LED signal is perpetuated by usage of shift registers. When the signal has reached the bottom of a column of LEDs, the player must press the corresponding button, and their score is displayed on the 7-segment LED of the FPGA. 

We also made it so that if the player tries to cheat by holding down the buttons even when the LEDs aren't turned on, the score decreases. 

The LEDs play to the song "Eye of a Tiger" by the American rock band "Survivor" (hard coded). 

Materials & Equipment

- 1 Spartan-3 XCS200 Field-Programmable Gate Array (FPGA) Board
- 24 LEDs
- 24 220 ohm resistors
- 2 breadboards 
- 1 ribbon cable
- 4 2x4 inch thin Styrofoam boards
- wires
