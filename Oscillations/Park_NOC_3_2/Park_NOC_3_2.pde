/* Ryan P "10/7/19"
"Rotating Projectile"
Information Engineering  '18-19     St. Mark's School of Texas
Code Abstract: This piece of code is supposed to launch a rectangle and apply gravity and show rotate toward its heading
Source(s): My own code
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/

//DCR: Does not yet rotate but translates nicely! Fix please.
// Score : 24/30.
FiredObject a;//creates the object a

void setup(){
  size(1200,800);
  smooth();
  background(255);
  //sets the background and other menial things
  a = new FiredObject();
  //initializes the object
}

void draw(){
  rectMode(CORNER);
  strokeWeight(0);
  stroke(0);
  fill(255,30);
  rect(0,0,width,height);
  //creates the fade effect
  
  a.run();
  //runs all the components necessary to create the launched object
}
