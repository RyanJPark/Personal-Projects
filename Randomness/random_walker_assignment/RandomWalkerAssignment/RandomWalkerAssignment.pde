/* Ryan P  8/29/19
"Random Walker"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create an object that moves randomly"
Source(s): "Identify any sources for your inspiration or code. Include hyperlinks to external sites or which example folder was used."

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/

int displayWidth=1280;
int displayHeight=640;
int R=int(random(255));
int G=int(random(255));
int B=int(random(255));

class Walker{ 

  //starts the walker in the middle of the screen
  
  void display(){
    stroke(R,G,B);
    fill(0);
    ellipse(x,y,5,5);
  }//draws the "walker"
  
  void step() {
    int choice = int(random(4));
    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else if (choice == 3) {
      y--;
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
  frameRate(27);
}//brought the new walker into existence 

void draw() {
  w.step();
  w.display();
  w.changeColor();
}
