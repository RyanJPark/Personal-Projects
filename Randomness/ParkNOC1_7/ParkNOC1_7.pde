/* Ryan P  9/3/19
"Perlin Noise Random Walker"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create an object that moves randomly"
Source(s): "Identify any sources for your inspiration or code. Include hyperlinks to external sites or which example folder was used."

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
float stepx;
float stepy;
float r;

class Walker{ 

  //starts the walker in the middle of the screen
  
  void display(){
    int R=int(random(255));
    int G=int(random(255));
    int B=int(random(255));
    stroke(R,G,B);
    fill(R,G,B);
    ellipse(x,y,10,10);
  }//draws the "walker"
  
  void step() {

    stepx=map(noise(pnx),0,1,-19,22);
    stepy=map(noise(pny),0,1,-18,20);
    x= constrain(x+stepx,0,displayWidth);
    y= constrain(y+stepy,0,displayHeight);
    pnx+=1;
    pny+=1;
//moves the walker randomly
  }  
}
//created a new class of object called walker

float x;
float y;
Walker w;
  
void setup() {
  background (100);
  //made the background gray
  size(displayWidth,displayHeight);
  w = new Walker();
  x=(displayWidth)/2;
  y=displayHeight/2;
  frameRate(60);
  gen = new Random();
}//brought the new walker into existence 

void draw() {
  w.step();
  w.display();
}
