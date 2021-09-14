

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    location = l.get();
    lifespan = 255.0;
    angle=0;
    aVelocity=0;
    aAcceleration = .0001;
  }

  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
  PVector f = force;
  acceleration.add(f);
}

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    //ellipse(location.x, location.y, 12, 12);
    
    pushMatrix();
    //translate(location.x,location.y);
    rotate(angle);
    rect(location.x, location.y, 12, 12);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
