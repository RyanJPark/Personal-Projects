class vcl {
 
  PVector location,Targ;
  PVector velocity;
  PVector acceleration;
  float r, R,G,B;
  float maxforce;
  float maxspeed;
 
  vcl(float x, float y,float R_,float G_,float B_) {
    maxspeed = 20;
    maxforce = 1;
    acceleration = new PVector(0,0);
    velocity = new PVector(maxspeed,0);
    location = new PVector(x,y);
    r = 10.0;

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
    desired.normalize(); 
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);

  }//steers the vehicle toward the path
 
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
  
  void wrap(){
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
  
  void run(){
    update();
    wrap();
    display();
    //runs the vehicle
  }



  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    //from a to p
    PVector ap = PVector.sub(p, a);
    //from a to b
    PVector ab = PVector.sub(b, a);

    ab.normalize();
    ab.mult(ap.dot(ab));
    //dotproduct
    
    // Finding the normal point
    PVector normalPoint = PVector.add(a, ab);

    return normalPoint;
  }
  
  void follow(Path p) {
   PVector predict = velocity.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(location, predict);//predicting location


    PVector normal=null;
    PVector target=null;
    float worldRecord = 9999999;

    for (int i = 0; i < p.points.size()-1; i++) {

      PVector a = p.points.get(i);
      PVector b = p.points.get(i+1);//checking line seg

      PVector normalPoint = getNormalPoint(predictLoc, a, b);//find normal
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        normalPoint = b.get();//assume normal is enpoint of a line segment sometimes, to make the code smooth
      }
      
      float distance = PVector.dist(predictLoc, normalPoint);
      if (distance < worldRecord) {
        worldRecord = distance;
        normal = normalPoint;

        PVector dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = normalPoint.get();
        target.add(dir);
      }//find the right normal point
      
    }
    //steer back if off path
    if (worldRecord > p.radius) {
      seek(target);
    }
  }
  
  void sep(ArrayList<vcl> sep){
    PVector sum= new PVector();
    float dSep= r*1.5;
    int count =0;
    for (vcl a:sep){
       float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
        diff.normalize().div(d); 
        sum.add(diff);
        count++;

      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
      
    }
    
    
    
    
  }
  
  
}
