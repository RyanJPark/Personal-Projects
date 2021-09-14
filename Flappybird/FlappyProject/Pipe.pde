class Pipe{
  PVector gapLocation;
  PVector velocity;
  
  Pipe(){
    gapLocation = new PVector(width, random(140,height-140) );
    velocity = new PVector(10,0);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    gapLocation.sub(velocity);
}
  void reset(){
    gapLocation.x=width;
    gapLocation.y = random(140,height-140);
    velocity = new PVector(10,0);
  }

  void display(){
    fill(#1BD30F);
    stroke(0);
    strokeWeight(2);
    rect(gapLocation.x,gapLocation.y,70,30);
    rect(gapLocation.x+10,gapLocation.y+30,50,height-gapLocation.y);
    
    rect(gapLocation.x,gapLocation.y-140,70,30);
    rect(gapLocation.x+10,0,50,gapLocation.y-140);
  }
  
}
