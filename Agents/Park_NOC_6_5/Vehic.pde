class Vehicle {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r, R,G,B;
  float maxforce;
  float maxspeed;
  float changeTheta;
 
  Vehicle(float x, float y,float R_,float G_,float B_) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 6;
    maxspeed = 5;
    maxforce = .75;
    changeTheta=0;
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
  }//adds a force
 
  void seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();   
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);

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
  
  void wander(){//the commented stuff is me trying to implement perlin noise in the angle change... it doesn't quite work yet. The wanderer just ends up going in circles
    //float deltaP,P;
    //P=0;
    //deltaP=10;
    float radius=30;
    float dist=80;
    float heading = velocity.heading2D();
    //noiseDetail(4,.5);
    //float change=map(noise(P),0,1,-.25,.25);
    //P+=deltaP;
    float change=random(-.6,.6);
    changeTheta+= change;
    //changeTheta =map(noise(P),0,1,-.25,.25);
    PVector circleLocation = velocity.get().normalize().mult(dist).add(location);
    //makes the wandering circle's position relative to the position of the circle in the direction of movement
    
    PVector circleFuture = new PVector(radius*cos(changeTheta+heading), radius*sin(changeTheta+heading) );
    //not explicitly using polar coordinates, but I think of this as using polar coordinates but immediately converting them into cartesian coordinates - so there is no middle step where polar coordinates are visible
    PVector target = PVector.add(circleLocation,circleFuture);
    seek(target);
    
    stroke(0,0,0); 
    noFill();
    ellipseMode(CENTER);
    ellipse(circleLocation.x,circleLocation.y,radius*2,radius*2);
    ellipse(target.x,target.y,4,4);
    line(location.x,location.y,circleLocation.x,circleLocation.y);
    line(circleLocation.x,circleLocation.y,target.x,target.y);
    //draws the circle and lines to make clear the wandering behavior
    
  }
  
  void wrapEdges(){//just classic wrap edges code
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
  
  
  void run(){
    wander();
    update();
    display();
    wrapEdges();
  }
}
