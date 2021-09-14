class FF{
  PVector [][] Field;
  int row,column;
  int res;
  PVector gridMid,gridFlow;
  float xoff,yoff,d;
  int asdf;
  FF(){
    res=RES;
    column=width/res +1;
    row=height/res +1;
    Field=new PVector [column][row]; 
    d=.01;
    asdf=1;
  }
  void display(){
    xoff=0;
    for (int i = 0; i < column; i++) {
      yoff=0;
      for (int j = 0; j < row; j++) {
        int xcoord=(i*res)-res/2;
        int ycoord=(j*res)-res/2;
        gridMid=new PVector(xcoord,ycoord);
        //gridFlow=PVector.sub(screenMid,gridMid); //to point toward the center
        gridFlow=new PVector( cos(map(noise(xoff,yoff),0,1,0,TWO_PI) ),sin(map(noise(xoff,yoff),0,1,0,TWO_PI) ) );
        
        gridFlow.normalize().mult(10);
        Field[i][j] = gridFlow;
        //int R = (int) map(gridFlow.heading2D(),0,2*PI,150,255);
        //int G = (int) map(gridFlow.heading2D(),0,2*PI,50,200);
        //int B = (int) map(gridFlow.heading2D(),0,2*PI,75,175);
        //stroke(R,G,B);
        stroke(175);
        strokeWeight(3);
        if(asdf==-1){
          line(gridMid.x,gridMid.y,gridMid.x+gridFlow.x,gridMid.y+gridFlow.y);  
        }
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
