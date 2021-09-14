class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //PVectors needed for motion
  float lifespan, initialMove,asdf;
  //floats used to determine properties of the particles
  //the float asdf is used to make a piece of code run once for every particle. The initial value is zero, and if the value of asdf is zero, a certain piece of code will run and change the value of asdf to 1, so the piece of code does not run again
  float topspeed=3;
  //limits the speed of the particle

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-topspeed,topspeed),random(-2,1));
    location = l.get();
    lifespan = 255.0;
    initialMove=0;
    asdf=0;
    //sets the initial values of all of the properties of the particle
  }

  void run() {
    update();
    display();
  }//runs all the code pertaining to the particle

  // Method to update location
  void update() {
    /*if(initialMove==0){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration1 = PVector.sub(mouse,location);
      acceleration1.normalize();
      acceleration1.mult(5);
      velocity.add(acceleration1);
      initialMove=1;
    }*/ //this is the code that makes the spinoff version different
    if(asdf==0){
      PVector mouse2 = new PVector(mouseX,mouseY);
      PVector acceleration2 = PVector.sub(mouse2,location);
      location.add(acceleration2);
      acceleration2.mult(0);
      asdf=1;
    }
    
    
    //velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    //moves the paritcle and slowly kills it
  }

  // Method to display
  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    fill(127,lifespan);
    ellipse(location.x,location.y,12,12);
    //draws the particle
  }
  
  // Determines if the particle should be dead
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
