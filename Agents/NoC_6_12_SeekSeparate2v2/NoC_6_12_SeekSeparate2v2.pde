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
int y;

void setup() {
  size(2000,1500);//sets the size of the canvas
  smooth();//makes the graphics of the program smoother than normal
  for (int i = 0; i < total; i++) {
    swimmerslist.add(new Swimmer()); //creates a new mover for every integer below the length of the Mover array
  }
  //frameRate(200);
  
  
  p=new Path();
  p.addPoint(0,random(height) );
  //adds random starting point
  p.addPoint(width/4, random(height) );
  //adds one "turn"
  p.addPoint((width*2)/4, random(0, height) );
  //adds another turn
  p.addPoint((width*3)/4, random(0, height) );
  //another turn
  p.addPoint(width,random(height) );
  
  m=new Path();
  m.addPoint(0,random(height) );
  //adds random starting point
  m.addPoint(width/4, random(height) );
  //adds one "turn"
  m.addPoint((width*2)/4, random(0, height) );
  //adds another turn
  m.addPoint((width*3)/4, random(0, height) );
  //another turn
  m.addPoint(width,random(height) );
  
  o=new Path();
  o.addPoint(0,random(height) );
  //adds random starting point
  o.addPoint(width/4, random(height) );
  //adds one "turn"
  o.addPoint((width*2)/4, random(0, height) );
  //adds another turn
  o.addPoint((width*3)/4, random(0, height) );
  //another turn
  o.addPoint(width,random(height) );
  
}

void draw() {
  
  //this code is for the fade effect
  fill(255,100);
  //rect(0,0,width,height);//redraws the background every time
  
  //this code is to turn off the fade effect
  background(255);

  for (Swimmer b : swimmerslist) {
     y = (int) random(0,2);
     if (keyPressed && key==CODED && keyCode==SHIFT) b.seek(new PVector (b.location1.x + b.velocity1.x, height/2)); //creates the center seeking behavior
    if( y == 1) {
      b.run(swimmerslist,p);
    }else if (y==2){
      b.run(swimmerslist,m);
    } else b.run(swimmerslist,o);
    
    //moves each swimmer toward an invisible path randomly generated every frame, picking a random path each frame.
  }
      //fill(0,255,0);
      //ellipse(mouseX,mouseY,10,10);
      
  p=new Path();
  p.addPoint(0,random(height) );
  //adds random starting point
  p.addPoint(width/4, random(height) );
  //adds one "turn"
  p.addPoint((width*2)/4, random(0, height) );
  //adds another turn
  p.addPoint((width*3)/4, random(0, height) );
  //another turn
  p.addPoint(width,random(height) );
  
  m=new Path();
  m.addPoint(0,random(height) );
  //adds random starting point
  m.addPoint(width/4, random(height) );
  //adds one "turn"
  m.addPoint((width*2)/4, random(0, height) );
  //adds another turn
  m.addPoint((width*3)/4, random(0, height) );
  //another turn
  m.addPoint(width,random(height) );
      
  o=new Path();
  o.addPoint(0,random(height) );
  //adds random starting point
  o.addPoint(width/4, random(height) );
  //adds one "turn"
  o.addPoint((width*2)/4, random(0, height) );
  //adds another turn
  o.addPoint((width*3)/4, random(0, height) );
  //another turn
  o.addPoint(width,random(height) );      
}
