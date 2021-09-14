/* Ryan P    "12/120/19"
"6.11 Separation"
Information Engineering  '19-20     St. Mark's School of Texas 

Code Abstract: To create a sketch that adds separation code to multiple vehicles

Source(s):Daniel Shiffman

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
 */
/*
notes: The green dot is the mouse, the red dot is the default target. Click to control the swimmers with the mouse.
*/
//DCR: Very Original. Good Job! Like how you've setup the mouse chagnes.
//20 /20 pts

int total =1200;
ArrayList <Swimmer> swimmerslist = new ArrayList<Swimmer>();
PVector perlinTarget;
float px,py,delta;

void setup() {
  size(2000,1500);//sets the size of the canvas
  smooth();//makes the graphics of the program smoother than normal
  for (int i = 0; i < total; i++) {
    swimmerslist.add(new Swimmer()); //creates a new mover for every integer below the length of the Mover array
  }
  frameRate(200);
  px=random(10000);
  py=random(10000);
  delta=.01;
  
}

void draw() {
  perlinTarget = new PVector( map(noise(px), 0,1,100,width-100), map(noise(py), 0,1,100,height-100) );
  
  if( pow(random(0,1),2) < random(0,1) ){
    perlinTarget.add( new PVector(mouseX,mouseY).sub(perlinTarget).normalize().mult(2) );
  }
  
  
  //fill(255,100);
  //rect(0,0,width,height);;//redraws the background every time
  background(255);

  for (Swimmer p : swimmerslist) {
    if(mousePressed){ 
      p.seek(new PVector (mouseX,mouseY) );
    }else p.seek(perlinTarget);
     p.run(swimmerslist);
    //moves and draws the mover
  }
  px+=delta;
  py+=delta;

  if(mousePressed){ 
      fill(0,255,0);
      ellipse(mouseX,mouseY,10,10);
    }else{
      fill(255,0,0);
      ellipse(perlinTarget.x,perlinTarget.y,10,10);
      fill(0,255,0);
      ellipse(mouseX,mouseY,10,10);
    }
}
