class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan, initialMove,asdf,R,G,B;
  float topspeed=5;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-topspeed,topspeed),random(-2,1));
    location = l.get();
    lifespan = 255.0;
    initialMove=0;
    asdf=0;
    
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    if(initialMove==0 && keyCode==SHIFT){
      location=new PVector (width/2,height/2);
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration1 = PVector.sub(mouse,location);
      acceleration1.normalize();
      acceleration1.mult(5);
      velocity.add(acceleration1);
      initialMove=1;
      asdf=1;
    }else if (asdf==0){
      PVector mouse2 = new PVector(mouseX,mouseY);
      PVector acceleration2 = PVector.sub(mouse2,location);
      location.add(acceleration2);
      acceleration2.mult(0);
      asdf=1;
    }
    
    
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    int R= (int) random(0,255);
    int G= (int) random(0,255);
    int B= (int) random(0,255);
    stroke(R,G,B,lifespan);
    strokeWeight(2);
    fill(R,G,B,lifespan);
    ellipse(location.x,location.y,12,12);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
