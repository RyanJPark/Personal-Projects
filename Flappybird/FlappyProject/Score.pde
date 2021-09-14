class Score{
  int count, reset;
  Bird a;
  Pipe b;
  boolean gameOver;
  Score(Bird a_, Pipe b_){
    count=0;
    //count=-1;
    reset=-1;
    a=a_;
    b=b_;
    gameOver=false;
  }
  void run(Bird a_,Pipe c){
    
    if (  (  c.gapLocation.x-15 <= a.position.x && a.position.x <= (c.gapLocation.x+70)  ) && (  c.gapLocation.y-15 <= a.position.y  ||  a.position.y <= (c.gapLocation.y-110+15) ) ){
    gameOver= true;
  }else gameOver= false;
  
    if (gameOver){
      display();
    }else{
      scoreAPoint(a_,c);
      display();
    }
    
    
  }
  
  void scoreAPoint(Bird a, Pipe b){
    if(a.position.x == b.gapLocation.x) count++;
  }
  
  void display(){
    fill(255);
    textSize(50);
    text(count,50,50);
  }
  
  void reset(Pipe a_,Pipe b_,Bird c_){
    
    if(keyPressed && key==CODED && keyCode==SHIFT){
      a_.reset();
      b_.reset();
      b_.gapLocation.x+=width/2;
      
      c_.gravity = new PVector(0,80/30);
      c_.position=new PVector(width/8,20);
      count=0;
      gameOver=false;
    }
    
  }
  
   
}
