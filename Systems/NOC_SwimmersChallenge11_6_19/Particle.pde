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
  int R,G,B;

  Particle(PVector l, int R3,int G3 ,int B3 ) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-topspeed,topspeed),random(-2,1));
    location = l.get();
    lifespan = 255.0;
    initialMove=0;
    asdf=0;
    R=R3;
    G=G3;
    B=B3;
    //sets the initial values of all of the properties of the particle
  }

  void run() {
    update();
    display();
  }//runs all the code pertaining to the particle

  // Method to update location
  void update() {
    if(asdf==0){
      location.add(acceleration);
      acceleration.mult(0);
      asdf=1;
    }
    location.add(velocity);
    lifespan-=7;
    //moves the paritcle and slowly kills it
  }

  void display() {
    stroke(R,G,B,lifespan);
    strokeWeight(2);
    fill(R,G,B,lifespan);
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
