
PImage Bird;
class Bird{
  PVector position, velocity,accel;
  PVector gravity = new PVector(0,80/frameRate);
  int r;
  
  Bird(){
    Bird = loadImage("FlappyBird.png");
    position = new PVector (width/8,20);
    velocity = new PVector (0,0);
    r=30;
    accel= new PVector(0,0);
    
  }
  
  void run(){
    jump();
    update();
    display();
  }
  
  void runMinusJump(){
    update();
    display();
  }
  
  void jump(){
    if(mousePressed||keyPressed||key==CODED||key==UP){
      velocity.y=-10;
      
      //velocity=new PVector(0,0);
      //accel=new PVector(0,-10);
    }
  }
  
  void update(){
    
    
    //velocity.add(accel);
    velocity.add(gravity);
    position.add(velocity);
}

  void display(){
    pushMatrix();
    translate(position.x,position.y);
    
    float angle = atan( velocity.y/10 );
    rotate(angle);
    fill(255);
    noStroke();
    //rect(0,0,r+20,r);
    image(Bird,-r/2,-r/2,r,r);
    
    popMatrix();
    //image(Bird,position.x,position.y,r,r);
    //for some reason the image doesn't work, so using a white circle for now
  }



}
