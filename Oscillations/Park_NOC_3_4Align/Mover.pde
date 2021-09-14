class aligner{
  PVector location,velocity,acceleration;
  //creates the vectors necessary for motion
  float speed=10;
  //limits the random starting speed and the top possible speed
  aligner(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-speed/2,speed/2),random(-speed/2,speed/2));
    //sets the inital values for the aligner
  }
  void run(){
    update();
    display();
    //runs all the functions needed to create an aligner
  }
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    //changes the acceleration in the direction of the mouse

    velocity.add(acceleration);
    velocity.limit(speed);
    location.add(velocity);
    //moves the aligner
  }
  
   void display() {
    float theta = velocity.heading2D();

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(theta);
    rect(0, 0, 50, 40);
    popMatrix();
    //displays and rotates the aligner
  }
}
