class Rocket { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  //classic motion vectors

  float topspeed = 10;
  //limits the speed of the rocket

  float flip =0;//this is really supposed to be a boolean, to say when the ship is flipped(backwards acceleration), but using a float is easier

  float r = 20; //size of the rocket

  // Are we thrusting (to color boosters)
  boolean thrusting = false;

  Rocket() {
    location = new PVector(width/2,height/2);
    velocity = new PVector();
    acceleration = new PVector();
    //sets the initial values
  } 

  void update() { 
    velocity.add(acceleration);
    velocity.mult(.995);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
    //moves the rocket, changes location, velocity, and acceleration
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    //f.div(mass); 
    // ignoring mass right now
    acceleration.add(f);
  }

  // Turn changes angle
  void turn(float a) {
    heading += a;
  }
  
  void thrust() {
    
    float angle = heading - PI/2;
    if (key == CODED && keyCode == UP) {
      PVector force = new PVector(cos(angle),sin(angle));
      force.normalize();
      force.mult(.2);
      applyForce(force);
      thrusting = true;
      //moves the ship forward
    }else if (key == CODED && keyCode == DOWN) {
      PVector force = new PVector(-1*cos(angle),-1*sin(angle));
      force.normalize();
      force.mult(.1);
      applyForce(force); 
      //moves the ship backward
    }
    
    //applies a thrust force to the rocket
  }

  void wrapEdges() {
    float buffer = r*2;
    if (location.x > width +  buffer) location.x = -buffer +5;
    else if (location.x <    -buffer) location.x = width+buffer-5;
    if (location.y > height + buffer) location.y = -buffer+5;
    else if (location.y <    -buffer) location.y = height+buffer-5;
  }//moves the rocket to the other side when it moves past the edge

  void display() { 
    stroke(200);
    strokeWeight(0);
    pushMatrix();
    translate(location.x,location.y+r);
    rotate(heading);
    fill(200);
    if (thrusting) fill(255,0,0);//changes color of the booster while thrusting
    rect(-r/2,r,r/3,r/2);
    rect(r/2,r,r/3,r/2);
    //boosters
    fill(175);
    // A triangle
    beginShape();
    vertex(-r,r);
    vertex(0,-r);
    vertex(r,r);
    endShape(CLOSE);
    rectMode(CENTER);
    popMatrix();
    //draws the rocket
    
    thrusting = false;
    //resets the thrusting state, so it isn't always true
  }
}
