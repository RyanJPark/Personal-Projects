/* Ryan P    "12/17/19"
"6.8 Pathing"
Information Engineering  '19-20     St. Mark's School of Texas 

Code Abstract: to create autonomous agents that follow a path

Source(s):Daniel Shiffman

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
 */
//DCR: Much better commentary!
//DCR: Try boosting the max steering force to make it more dynamic.
//DCR: 100/100 pts

Path p;
//vcl v;
vcl[] b=new vcl[20];
void setup(){
  background(255);
  size(1400,1000);
  p=new Path();
  //v=new vcl(0,random(height),100,100,100);
  for(int i=0;i<b.length;i++){
    b[i]=new vcl(0,random(height),100,100,100);
  }//normal setup stuff, adds new vehicles in an array list
}

void draw(){
  background(255);
  p.display();
  for(vcl _:b){
    _.run(p);
  }//runs through path and all vehicles
  //v.run(p);
}
