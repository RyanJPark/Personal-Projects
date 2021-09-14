/* Ryan P    "12/12/19"
"Flow Field Dot Product"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create a flow field at all points on the screen that changes over time"
Source(s): Daniel Shiffman: https://natureofcode.com/book/chapter-6-autonomous-agents/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Well done! Add more commentary to explain please.
//DCR: 9/10

FF a;
vcl[] veh=new vcl[20];
int n;

void setup(){
  n=10;
  size(1800,1200);
  a=new FF();
  a.zoff=random(.5);
  //frameRate(5);
  for(int i=0;i<veh.length;i++){
    veh[i]=new vcl(a);
  }
  
}

void draw(){
  background(255);
  a.display();
  a.zoff+=.2;
  
  for(vcl b: veh){
    b.run();
  }
  
}



class FF{
  PVector [][] Field;
  int row,column;
  int res;
  PVector gridMid,gridFlow;
  float yofff,d;
  float xoff,zoff;
  
  FF(){
    res=50;
    
    column=(width/res) +1;
    row=(height/res) +1;
    
    Field=new PVector [column][row]; 
    
    d=.2;
  }
  
  
  
  void display(){    
    float xoff=random(5);
    
    for (int i = 0; i < column; i++) {
      float yoff=random(5);
      for (int j = 0; j < row; j++) {
        int xcoord=(i*res)-res/2;
        int ycoord=(j*res)-res/2;
        gridMid=new PVector(xcoord,ycoord);
        //gridFlow=PVector.sub(screenMid,gridMid);
        gridFlow=new PVector( cos(map(noise(xoff,yoff,zoff),0,1,0,TWO_PI) ),sin(map(noise(xoff,yoff),0,1,0,TWO_PI) ) );
        
        
        gridFlow.normalize().mult(10);
        Field[i][j] = gridFlow;
        int R = (int) map(gridFlow.heading2D(),0,2*PI,150,255);
        int G = (int) map(gridFlow.heading2D(),0,2*PI,50,200);
        int B = (int) map(gridFlow.heading2D(),0,2*PI,75,175);
        stroke(R,G,B);
        strokeWeight(3);
        line(gridMid.x,gridMid.y,gridMid.x+gridFlow.x,gridMid.y+gridFlow.y);    
        
        yoff+=d;
        
      }
      xoff+=d;
      
    }
        
  }
  
  PVector lookup(PVector l){
    int cols = int(constrain(l.x/res,0,column-1));
    int ro = int(constrain(l.y/res,0,row-1));
    return Field[cols][ro].get();
  }

}
