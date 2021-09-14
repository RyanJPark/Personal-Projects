/* Ryan P  9/2/19
"Lévy Flight Random Walker"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create an object that moves randomly"
Source(s): "Identify any sources for your inspiration or code. Include hyperlinks to external sites or which example folder was used."

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Needs more commentary throughout the sketch!
//DCR:  8.5 /  10 pts

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
    int r1=(int)random(1,10);
    int r2=(int)random(1,100);
    if (r2<= r1){
      stepsize=r1/3;
      int stepx = (int)random(-stepsize,stepsize);
      int stepy = (int)random(-stepsize,stepsize);
      stepx=stepx*(displayWidth/20);
      stepy=stepy*(displayHeight/20);
      x+=stepx;
      y+=stepy;
    }else{
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
  x=(displayWidth)/4;
  y=displayHeight/4;
  frameRate(30);
  gen = new Random();
}//brought the new walker into existence 

void draw() {
  w.step();
  w.display();
  w.changeColor();
}
