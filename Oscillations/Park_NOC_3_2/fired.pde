class FiredObject{
  
  PVector acceleration,velocity,position;
  float topspeed,xoff,yoff, mass;
  //creates the variables and PVectors needed for the code
  FiredObject(){
    acceleration = new PVector (0,0);
    velocity = new PVector(random(5,10),random(-15,-5));
    //creates the acceleration and velocity for each new fired object
    position = new PVector (0,displayHeight/2);
    topspeed=4;
    xoff=1000;
    yoff=0;
    mass=random(7,30);
    //sets the initial values of all the variables
  }
  void run(){ //runs the object
    PVector gravity = new PVector(0, 0.16*a.mass);
    a.applyForce(gravity);
    a.update();
    a.EdgeCheck();
    a.display();
  }
  void applyForce(PVector force) { //used to apply gravity, but can use it to change acceleration according to any force
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  void update() {//changes position/velocity
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display(){
    float theta = velocity.heading2D();

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(theta);
    rect(0, 0, mass, 30);
    popMatrix();
    //draws and rotates the rectangle
  }
  
  void EdgeCheck(){
    if (position.x > width) {
      acceleration.mult(0);
      velocity.mult(0);
      //this stops the rectangle from moving if it hits the edge
    } /*else if (location.x < 0) { //its good to think about this scenario but it will never occur in this piece of code
    }*/
  }
  
}
