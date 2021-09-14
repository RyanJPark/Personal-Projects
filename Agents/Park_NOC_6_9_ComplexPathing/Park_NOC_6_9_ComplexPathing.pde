/* Ryan P    "12/18/19"
"6.9 Complex Pathing"
Information Engineering  '19-20     St. Mark's School of Texas 

Code Abstract: to create autonomous agents that follow a segmented path

Source(s):Daniel Shiffman

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
 */
//DCR: What a speed demon! Nicely done.
//DCR: 50/50 pts

Path p;
vcl v;

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
  v=new vcl(0,random(height),100,100,100);
  //v=new vcl(new PVector (0,random(height) ),10,.1);
}

void draw(){
  background(255);
  p.display();
  v.follow(p);
  v.run();
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
