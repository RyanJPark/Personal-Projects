/* Ryan P    "1/13/20"
"NoC-6_12-SeekSeparate2"
Information Engineering  '19-20     St. Mark's School of Texas 

Code Abstract: Modify the seek and separate example code so that the behavior weights of agents are not constants.

Source(s):Daniel Shiffman

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
 */
 
 /*notes: pressing Shift will cause the screen center-seeking behavior to be stronger.
    The "shift" mode is clearer without the fade effect, while the "flow" of the swimmers is easier to see with the fade effect when not in "shift" mode.
    Holding down the mouse will change the shape of the swimmer.
 */

int total =900;
ArrayList <Swimmer> swimmerslist = new ArrayList<Swimmer>();
Path p, m, o;
int y, totalpaths;
ArrayList <Path> paths = new ArrayList<Path>();

void setup() {
  size(2000,1500);//sets the size of the canvas
  smooth();//makes the graphics of the program smoother than normal
  for (int i = 0; i < total; i++) {
    swimmerslist.add(new Swimmer()); //creates a new mover for every integer below the length of the Mover array
  }
  //frameRate(200);
  
  
  totalpaths = 3;
  paths = new ArrayList<Path>();
  
  for(int i=0; i<totalpaths;i++){
    paths.add(new Path() );
  }
  for(Path p: paths){
    p.addPoint(0,random(height) );
    //adds random starting point
    p.addPoint(width/4, random(height) );
    //adds one "turn"
    p.addPoint((width*2)/4, random(0, height) );
    //adds another turn
    p.addPoint((width*3)/4, random(0, height) );
    //another turn
    p.addPoint(width,random(height) );
  }
  
}

void draw() {
  
  //this code is for the fade effect
  fill(255,30);
  rect(0,0,width,height);//redraws the background every time
  
  //this code is to turn off the fade effect
  //background(255);
  
  for(Swimmer b: swimmerslist){
    y = (int) random(0,totalpaths);
    if (keyPressed && key==CODED && keyCode==SHIFT) b.seek(new PVector (b.location1.x + b.velocity1.x, height/2)); //creates the center seeking behavior
    b.run(swimmerslist,paths.get(y) );
    
  }
      
  for(Path p: paths){
     p.addPoint(0,random(height) );
    //adds random starting point
    p.addPoint(width/4, random(height) );
    //adds one "turn"
    p.addPoint((width*2)/4, random(0, height) );
    //adds another turn
    p.addPoint((width*3)/4, random(0, height) );
    //another turn
    p.addPoint(width,random(height) );
  }      
}
