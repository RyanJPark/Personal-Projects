class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float vo=3;

  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(random(-vo,vo),random(-vo,vo));
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0,127);
    ellipse(location.x,location.y,mass*16,mass*16);
  }

  void checkEdges() {

    if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
    
     if (location.x >= displayWidth/2){
      PVector repel = new PVector (-1*location.x * (mass * 16) , 0);
      repel.normalize();
      repel.mult(location.x* .00007);
      acceleration.add(repel);
     
    }
    if (location.x <= displayWidth*.1){
      PVector repel = new PVector (location.y * (mass * 16) , 0);
      repel.normalize();
      repel.mult(location.x*.0004);
      acceleration.add(repel);
     
    }
    if (location.y <= displayHeight*.07){
      PVector repel = new PVector (0, location.y * (mass * 16));
      repel.normalize();
      repel.mult(location.y*.001);
      acceleration.add(repel);
    }
    
    if (location.y >= displayHeight/2){
      PVector repel = new PVector (0,-1*location.y * (mass * 16) );
      repel.normalize();
      repel.mult(location.y*.0005);
      acceleration.add(repel);
    }

  }
  float c;
  

}
