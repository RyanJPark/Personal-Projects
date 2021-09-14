
class Basic{
//this will be the parent class to both the breaking object and the objects that are created from the break. It will just have some simple voids for the sake of efficiency.
  PVector location;
  PVector velocity,acceleration;
  //the motion vectors
  float radius;
  float clickCheck;
  float lifespan;
  
  Basic (PVector l){
    location = l.get();
    velocity = new PVector (0,0);
    acceleration = new PVector (0,0);
    radius = 5;
    clickCheck =0;
    lifespan=255;
  }//set the inital values for all the variables
  
  void display(){
    stroke(0);
    //strokeWeight(2);
    fill(0);
    rectMode(CORNER);
    rect(location.x,location.y,2*radius,2*radius);
  }//draws the rectangle
  
  void shatter(){
    if (mousePressed && clickCheck == 0){
      velocity = new PVector(random(-10,10), random(-10,0));
      acceleration.add( new PVector (0,4) );
      clickCheck = 1;//so the click can only happen once
    }
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(.7);
  }//updates the location of each square and its life span
  
  void run (){
    shatter();
    update();
    display();
  }//runs all the functions in the class basic
  
}
