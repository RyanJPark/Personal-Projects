/* Ryan P    9/9/19
"Walkers with vectors"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create a random walker with vectors"

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/

int stepsize;
import java.util.Random;
Random gen;

int displayWidth=1280;
int displayHeight=1280;
int R=int(random(255));
int G=int(random(255));
int B=int(random(255));
int pnx=100;
int pny=0;
Walker w;
PVector step = new PVector(0,0);
PVector loc = new PVector(displayWidth/2,displayHeight/2);

class Walker{ 

  //starts the walker in the middle of the screen
  
  void display(){
    int R=int(random(255));
    int G=int(random(255));
    int B=int(random(255));
    stroke(R,G,B);
    fill(R,G,B);
    ellipse(loc.x,loc.y,10,10);
  }//draws the "walker"
  
  void step() {

    step.x=map(noise(pnx),0,1,-19,22);
    step.y=map(noise(pny),0,1,-18,20);
    loc.x= constrain(loc.x+step.x,0,displayWidth);
    loc.y= constrain(loc.y+step.y,0,displayHeight);
    pnx+=1;
    pny+=1;
    loc.add(step);
//moves the walker randomly
  }  
}
//created a new class of object called walker

void setup() {
  background (100);
  //made the background gray
  size(displayWidth,displayHeight);
  w = new Walker();
  frameRate(100);
  gen = new Random();
}//brought the new walker into existence 

void draw() {
  w.step();
  w.display();
}
