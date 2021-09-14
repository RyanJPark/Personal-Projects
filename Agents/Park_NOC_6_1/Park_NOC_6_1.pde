/* Ryan P    "11/21/19"
"Reverse Steering"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To implement a reverse steering force when the mouse is pressed"
Source(s): Daniel Shiffman: https://natureofcode.com/book/chapter-6-autonomous-agents/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Please add commentary!
//DCR: 18/20 pts

Vehicle Ferrari;

void setup(){
  Ferrari = new Vehicle(width/2,height/2);
  smooth();
  size(1280,1000);
}

void draw(){
  background(0);
  Ferrari.run( new PVector (mouseX,mouseY));
}
