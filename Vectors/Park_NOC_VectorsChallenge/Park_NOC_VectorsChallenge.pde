/* Ryan P    9/9/19
"Vectors Challenge"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To eight vector functions"

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Cannot run; null pointer exception error. Fix ASAP.
//DCR:  60 /  100 pts

int displayHeight = 800;// sets the height of the canvas
int displayWidth = 1280;//sets the width of the canvas
Mover m;
PVector location;//creates the location of the movers
PVector velocity;//creates the velocity of the movers
PVector acceleration;//creates the acceleration of the movers
PVector line;//creates the line from the circle center halfway to the mouse

  
void setup() {
//  frameRate(27);
  size(displayWidth,displayHeight); //sets the canvas size
  smooth(); //makes the program look smoother
  m = new Mover(); //makes a new instance of mover
}

void draw() {
  background(255); //sets the background each time the program runs
  m.update(); //moves the movers
  m.display(); // displays the movers
}
