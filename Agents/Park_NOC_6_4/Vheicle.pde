class Vehicle {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r, R,G,B;
  float maxforce;
  float maxspeed;
  int asdf;
 
  Vehicle(float x, float y,float R_,float G_,float B_,int asdf_ ) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 10.0;
    asdf=asdf_;
    if (asdf==1){
      maxspeed = 7;
      maxforce = 1;
    }
    R=R_;
    G=G_;
    B=B_;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }//moves the vehicles
 
  void applyForce(PVector force) {
    acceleration.add(force);
  }
 
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    maxspeed= sqrt(desired.mag())*.25;//this line changes maxspeed based on the enviroment. This is the only difference in code between 6.3 and 6.2
    desired.normalize();   
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    if(asdf==1 && PVector.sub(target,location).mag() < 10){
      velocity=new PVector (0,0);
      acceleration=new PVector (0,0);
    }else applyForce(steer);

  }//steers the vehicle
 
  void display() {

    float theta = velocity.heading() + PI/2;
    fill(R,G,B);
    noStroke();
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }//displays a triangle at the position of the vehicle  
  
  void run(PVector target){
    seek(target);
    update();
    display();
    
  }
}
