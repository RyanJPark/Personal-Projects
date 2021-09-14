class Swimmer {

  PVector location1;
  PVector velocity1;
  PVector accleration1;
  float topspeed1;
  float size1;
  float maxforce;
  
  //all these vectors and floats create the variables needed to run the swimmer

  Swimmer() {
    
    location1 = new PVector(random(width),random(height));
    velocity1 = new PVector(10,0);
    accleration1= new PVector (0,0);
    size1 = 5;
    topspeed1 = size1*3;
    maxforce=1;
    //this code sets the beginning magnitude and direction of all the variables
  }
  
  void run(ArrayList <Swimmer> a, Path p){//runs all of the code to move and display the swimmer
    sep(a);
    follow(p);
    //seek(new PVector(mouseX,mouseY) );
    update();
    //update1();
    wrap();
    display1();
  }
  
  void wrap(){//moves the swimmer to the opposite edge if moved off screen
    //if (location.x < -r) location.x = width+r;
    if (location1.y < -size1) location1.y = height+size1;
    //if (location.x > width+r) location.x = -r;
    if (location1.x > width+size1){
      location1.x = -size1;
      location1.y=random(height);
    }
    if (location1.y > height+size1) location1.y = -size1;
  }
  
  
    void update() {
    velocity1.add(accleration1);
    location1.add(velocity1);
    accleration1.mult(0);
  }//moves the vehicles
 
  void applyForce(PVector force) {//applies forces
    accleration1.add(force);
  }
 

   void seek(PVector target) {
    PVector desired = PVector.sub(target,location1);
    desired.normalize(); 
    desired.mult(topspeed1);
    PVector steer = PVector.sub(desired,velocity1);
    //if(PVector.dist(location1, new PVector (location1.x + velocity1.x, height/2) ) > size1*100){
      steer.limit(pow(maxforce,( 1/ (location1.y- (height/2)  ) )   ) *1.6 );
   // }else steer.mult(0);
    //steer.limit(maxforce);
    applyForce(steer);

  }//steers the vehicle toward a chosen path
  
// display function draws the circles every time they move
   void display1() {

    float theta = velocity1.heading() + PI/2;
    fill(0);
    noStroke();
    pushMatrix();
    translate(location1.x,location1.y);
    rotate(theta);
    //if(mousePressed){
      ellipse(0,0,size1*2,size1);
    //x}else    
    ellipse(0,0,size1,size1*4);
    popMatrix();
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
   PVector predict = velocity1.get();
    predict.normalize();
    predict.mult(25);
    PVector predictLoc = PVector.add(location1, predict);//predicting location


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
  
  void sep(ArrayList<Swimmer> a){//this keeps the swimmers from being to close to eachother.
    PVector sum= new PVector();
    float dSep= size1*5;
    int count =0;
    for (Swimmer b:a){
       float d = PVector.dist(location1, b.location1);
      if ((d > 0) && (d < dSep)) {
        PVector diff = PVector.sub(location1, b.location1);
        diff.normalize().div(d); 
        sum.add(diff);
        count++;

      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(topspeed1);
      PVector steer = PVector.sub(sum, velocity1);
      steer.limit(maxforce*2);
      accleration1.add(steer);
      
    }
  }
  
  
  
}
