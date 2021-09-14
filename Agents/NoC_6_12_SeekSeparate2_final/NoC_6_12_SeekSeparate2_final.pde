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
    Holding down control will show the complex paths used to create changing swimmer flows.
 */
//DCR: One of the best I've seen!
//DCR: Good interactivity! 
//DCR: Counts for 16.11c: 30/30
//DCR: 100/100 pts!

int total=1300;
ArrayList <Swimmer> swimmerslist = new ArrayList<Swimmer>();
ArrayList <Path> paths = new ArrayList<Path>();
int y, totalpaths, pathRefreshRate;

void setup() {
  size(2000,1500);//sets the size of the canvas
  smooth();//makes the graphics of the program smoother than normal
  for (int i = 0; i < total; i++) {
    swimmerslist.add(new Swimmer()); //creates a new mover for every integer below the length of the Mover array
  }

 totalpaths = 5;
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
  pathRefreshRate=30          ;
  
}

void draw() {
  
  //this code is for the fade effect
  fill(255,100);
  rect(0,0,width,height);//redraws the background every time
  
  //this code is to turn off the fade effect
  //background(255);

  for(Swimmer b: swimmerslist){
    y = (int) random(0,totalpaths);
    if (keyPressed && key==CODED && keyCode==SHIFT) b.seek(new PVector (b.location1.x + b.velocity1.x, height/2)); //creates the center seeking behavior
    b.run(swimmerslist,paths.get(y) );
    
  }
   if(frameCount%pathRefreshRate==0){
    for(int i =0; i <totalpaths;i++){
     paths.remove(i);
     paths.add( new Path() );
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
      
   if (keyPressed && key==CODED && keyCode==CONTROL)  for(Path p:paths) p.display();
}
