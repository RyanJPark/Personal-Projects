/* Ryan P  8/29/19
"Gaussian Random Walker"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create an object that moves randomly"
Source(s): "Identify any sources for your inspiration or code. Include hyperlinks to external sites or which example folder was used."

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR:  9 / 10  pts
//DCR: Would benefit from more commentary
int stepsize;
import java.util.Random;
Random gen;

int displayWidth=1280;
int displayHeight=1280;
int R=int(random(255));
int G=int(random(255));
int B=int(random(255));
int stepsd=5;
int stepmean=10;

class Walker{ 

  //starts the walker in the middle of the screen
  
  void display(){
    stroke(R,G,B);
    fill(0);
    ellipse(x,y,5,5);
  }//draws the "walker"
  
  void step() {
    float r=random(1);
    stepsize=(int) gen.nextGaussian();
    stepsize=stepsize*stepsd+stepmean;
    if(r<.23){
      x=x+stepsize;
    }else if (r<.45) {
      x=x-stepsize;
    } else if (r < 0.75) {
      y=y+stepsize;
    } else {
      y=y-stepsize;
    }
  }//moves the walker randomly
  
  void changeColor() {
    int R=int(random(255));
  int G=int(random(255));
  int B=int(random(255));
  }//changes color
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
  x=displayWidth/2;
  y=displayHeight/2;
  frameRate(30);
  gen = new Random();
}//brought the new walker into existence 

void draw() {
  w.step();
  w.display();
  w.changeColor();
}
