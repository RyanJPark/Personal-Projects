/* Ryan P    "12/120/19"
"6.11 Cohesion"
Information Engineering  '19-20     St. Mark's School of Texas 

Code Abstract: To create a sketch that has multiple vehicles align and move as a group

Source(s):Daniel Shiffman

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
 */
 //DCR: Solid! 20 /20 pts
 
Path p;
//vcl v;
ArrayList <vcl> V;
int count=200;

void setup(){
  background(255);
  size(1800,1200);
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
  
  //v=new vcl(0,random(height),100,100,100);
  //v=new vcl(new PVector (0,random(height) ),10,.1);
  
  V = new ArrayList <vcl>();
  
  for(int i=0; i<count; i++){
    V.add(new vcl (0,random(height),100,100,100) );
  }
}

void draw(){
  //background(255);
  fill(255,20);
  rect(0,0,width,height);
  
  //p.display();
  
  //v.follow(p);
  //v.run();
  
  for(vcl g : V){
    g.follow(p);
    g.sep(V);
    g.run();
  }
}

void mousePressed(){
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
}
