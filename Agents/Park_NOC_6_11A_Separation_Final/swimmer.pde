class Swimmer {

  PVector location1;
  PVector velocity1;
  PVector accleration1;
  float topspeed1;
  float size1;
  float maxforce;
  
  //all these vectors and floats create the variables needed to run the program

  Swimmer() {
    
    location1 = new PVector(random(width),random(height));
    velocity1 = new PVector(0,0);
    accleration1= new PVector (0,0);
    topspeed1 = 20;
    size1 = 5;
    maxforce=1;
    //this code sets the beginning magnitude and direction of all the variables
  }
  
  void run(ArrayList <Swimmer> a){
    sep(a);
    //seek(new PVector(mouseX,mouseY) );
    update();
    //update1();
    display1();
  }
    void update() {
    velocity1.add(accleration1);
    //velocity.limit(maxspeed);
    location1.add(velocity1);
    accleration1.mult(0);
  }//moves the vehicles
 
  void applyForce(PVector force) {
    accleration1.add(force);
  }
 

   void seek(PVector target) {
    PVector desired = PVector.sub(target,location1);
    desired.normalize(); 
    desired.mult(topspeed1);
    PVector steer = PVector.sub(desired,velocity1);
    if(PVector.dist(location1, new PVector (mouseX,mouseY) ) > size1*10){
      steer.limit(maxforce*2);
    }else steer.mult(0);
    //steer.limit(maxforce);
    applyForce(steer);

  }//steers the vehicle toward the path  
  
  void display1() {
    stroke(0);
    strokeWeight(0);
    fill(0);
    ellipse(location1.x,location1.y,size1,size1);
  } // display function draws the circles every time they move
  

  
  void sep(ArrayList<Swimmer> a){//this keeps the swimmers from being to close to eachother.
    PVector sum= new PVector();
    float dSep= size1*15;
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
