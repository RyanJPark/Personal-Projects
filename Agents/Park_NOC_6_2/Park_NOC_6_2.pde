/* Ryan P    "11/21/19"
"Pursuit"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To have the vehicle "seek" future positions of the target"
Source(s): Daniel Shiffman: https://natureofcode.com/book/chapter-6-autonomous-agents/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Very Original. +2 pts for that. Good Job!
//DCR: Needs your commentary! - 2 pts for that !
//dCR: Score : 20/ 20 pts

Vehicle Ferrari;
Vehicle Lamborgini;
Target seek;

void setup(){
  Ferrari = new Vehicle(random(0,width),random(0,height),175,175,175,1);
  Lamborgini = new Vehicle(random(0,width),random(0,height),100,200,100,2);
  seek = new Target();
  smooth();
  size(2000,1280);
  background(0);
  //normal setup stuff
}

void draw(){
  PVector FSeek = seek.loc.add( new PVector(seek.stepx,seek.stepy));
  PVector LSeek = Ferrari.location.add(Ferrari.velocity.add(Ferrari.acceleration));
  //pursuit vectors
  background(0);
  strokeWeight(5);
  stroke(255);
  line(Ferrari.location.x,Ferrari.location.y,FSeek.x,FSeek.y);
  line(Lamborgini.location.x,Lamborgini.location.y,LSeek.x,LSeek.y);
  //draws lines
  seek.run();
  Ferrari.run(FSeek);
  Lamborgini.run(LSeek);
//Lamborgini follows ferrari
}
