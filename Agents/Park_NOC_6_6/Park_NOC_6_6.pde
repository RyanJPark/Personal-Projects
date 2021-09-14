/* Ryan P    "12/9/19"
"Flow Field"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create a center pointing flow field at all points on the screen"
Source(s): Daniel Shiffman: https://natureofcode.com/book/chapter-6-autonomous-agents/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Please add commentary!
// 18/20 pts

FF a;
void setup(){
  size(800,800);
  a=new FF();
}

void draw(){
  background(255);
  a.display();
}


class FF{
  PVector [][] Field;
  int row,column;
  int res;
  PVector screenMid = new PVector (width/2, height/2);
  PVector gridMid,gridFlow;
  
  FF(){
    
    
    res=20;
    
    column=width/res +1;
    row=height/res +1;
    
    Field=new PVector [column][row];
    
    
    /*for (int i = 0; i < column; i++) {
      for (int j = 0; j < row; j++) {
        int xcoord=(i*res)-res/2;
        int ycoord=(j*res)-res/2;
        gridMid=new PVector(xcoord,ycoord);
        gridFlow=PVector.sub(screenMid,gridMid);
        gridFlow.normalize().mult(10);
        Field[i][j] = gridFlow;
      }
    }*/
    
  } 
  void display(){
    for (int i = 0; i < column; i++) {
      for (int j = 0; j < row; j++) {
        int xcoord=(i*res)-res/2;
        int ycoord=(j*res)-res/2;
        gridMid=new PVector(xcoord,ycoord);
        gridFlow=PVector.sub(screenMid,gridMid);
        gridFlow.normalize().mult(10);
        Field[i][j] = gridFlow;
        stroke(3);
        strokeWeight(1);
        line(gridMid.x,gridMid.y,gridMid.x+gridFlow.x,gridMid.y+gridFlow.y);    
        
      }
    }
    
    
  }
  
  
  
}
