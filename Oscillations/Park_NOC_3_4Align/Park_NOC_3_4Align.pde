/* Ryan P "10/8/19"
"Align"
Information Engineering  '18-19     St. Mark's School of Texas
Code Abstract: to attract a mover toward the mouse and turn it toward its heading
Source(s): My own code, David Shiffman
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR:  30 /  30 pts
//Very nicely done!
aligner a;

void setup(){
  size(1280,800);
  smooth();
  background(255);
  frameRate(100);
  //sets the basic elements of the code
  
  a= new aligner();
  //initializes the aligner called
}

void draw(){
  strokeWeight(0);
  stroke(0);
  fill(255,100);
  rectMode(CORNER);
  rect(0,0,width,height);
  //creates the fade effect
  
  a.run();
  //runs the aligner
}
