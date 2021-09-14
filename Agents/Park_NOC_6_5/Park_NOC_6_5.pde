/* Ryan P    "12/3/19"
"WAnder"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To wander as shown by Craig Reynolds"
Source(s): Daniel Shiffman: https://natureofcode.com/book/chapter-6-autonomous-agents/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Better commentary throughout the sketch!
//DCR: 30 / 30 pts
Vehicle Ferrari;

void setup(){
  Ferrari = new Vehicle(width/2,height/2,random(250),random(250),random(250));
  smooth();
  size(500,500);
  background(255);
  frameRate(15); 
  //just using natural framerate looks really funny - it just goes in circles a lot
  //normal setup stuff
}

void draw(){
  
  background(255);
  Ferrari.run();
  
  
}
