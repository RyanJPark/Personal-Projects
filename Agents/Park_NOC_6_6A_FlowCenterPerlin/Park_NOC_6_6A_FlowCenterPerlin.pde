/* Ryan P    "12/12/19"
"Flow Field Perlin"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create a perlin generated randomly pointing flow field at all points on the screen"
Source(s): Daniel Shiffman: https://natureofcode.com/book/chapter-6-autonomous-agents/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation

notes: Hold down the mouse to see flow field.
*/
//DCR: Huge agent field!
//DCR: Really needs more commentary to match the coding!
//DCR: Well done! 29/30 pts

int RES =2;
FF a;
vcl[] veh=new vcl[(int) pow(10,4.25) ];
void setup(){
  background(255);
  size(2000,1600);
  a=new FF();
  for(int i=0;i<veh.length;i++){
    //veh[i]=new vcl(a, (int) random(255), (int) random(255),  (int) random(255) );
    veh[i]=new vcl(a,0,0,100);
  }
}
void draw(){
  //background(255);
  fill(255,70);
  noStroke();
  rect(0,0,width,height);
  a.display();
  //if(mousePressed) a.asdf=a.asdf*-1;
  for(vcl b: veh){
    b.run();
  }
}
