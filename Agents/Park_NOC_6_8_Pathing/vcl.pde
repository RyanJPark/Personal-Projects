class vcl {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r, R,G,B;
  float maxforce;
  float maxspeed;
 
  vcl(float x, float y,float R_,float G_,float B_) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-10,10),random(-10,10) );
    location = new PVector(x,y);
    r = 10.0;
      //maxspeed = 10;
      maxforce = .3;//was 0.075
    R=R_;
    G=G_;
    B=B_;
  }

  void update() {
    velocity.add(acceleration);
    //velocity.limit(maxspeed);
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
    //desired.mult(maxspeed);
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
  
  void run(Path a){
    follow(a);
    update();
    display();
    
  }



  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // PVector that points from a to p
    PVector ap = PVector.sub(p, a);
    // PVector that points from a to b
    PVector ab = PVector.sub(b, a);

    //[full] Using the dot product for scalar projection
    ab.normalize();
    ab.mult(ap.dot(ab));
    //[end]
    // Finding the normal point along the line segment
    PVector normalPoint = PVector.add(a, ab);

    return normalPoint;
  }
  
void follow(Path p) {

    //[full] Step 1: Predict the vehicle’s future location.
    PVector predict = velocity.get();
    predict.normalize();
    predict.mult(40);//was 25
    PVector predictLoc = PVector.add(location, predict);
    //[end]

    //[full] Step 2: Find the normal point along the path.
    PVector a = p.start;
    PVector b = p.end;
    PVector normalPoint = getNormalPoint(predictLoc, a, b);
    //[end]

    //[full] Step 3: Move a little further along the path and set a target.
    PVector dir = PVector.sub(b, a);
    dir.normalize();
    //dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);
    //[end]

    //[full] Step 4: If we are off the path,
    // seek that target in order to stay on the path.
    float distance = PVector.dist(normalPoint, predictLoc);
    if (distance > p.radius) {
      seek(target);
    }//[end]
  }
}
