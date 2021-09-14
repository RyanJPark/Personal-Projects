//need to add friction

class PMover { //short for pointing mover
  PVector locationp, velocityp,accelp;//these are necessary for movement
  //float tp, c, frictionspeed; //these are for friction, which is commented out for now
  float aAccel, aVelocity,angle; //these are for rotation
  
  PMover(){
    PVector locationp = new PVector (displayWidth/2,displayHeight/2);
    PVector velocityp = new PVector (0,0);
    PVector accelp = new PVector (0,0);
    float tp = 2;//topspeed (velocity)
    float aAccel = random(-.05,.05);
    float aVelocity = 0;
    float angle = 0;//sets all the origional value of the vars
    //float c = .001;
    //float frictionspeed = 10;
  }
  
  
  void keymove(){
    if ( (keyCode == LEFT)){
      accelp.x=accelp.x-.01;
    }
    if ( (keyCode == RIGHT)){
      accelp.x=accelp.x+.01;
    }
    if ( (keyCode == UP)){
      accelp.y=accelp.y-.01;
    }
    if ( (keyCode == DOWN)){
      accelp.y=accelp.y+.01;
    }//these four change accel according to the arrow keys
    
    
    if(locationp.x<=10 || locationp.x>=displayWidth){
      velocityp.x=velocityp.x*-1;
    }
  
    if(locationp.y<=10 || locationp.y>=displayHeight){
      velocityp.y=velocityp.y*-1;
    }
    //these two if statements are made to keep the mover inside the screen
    
    /*
      float speed = velocityp.mag();
      float dragMagnitude = c * speed * speed;
      PVector drag = velocityp.get();
      drag.mult(-1);
      drag.normalize();
      drag.mult(dragMagnitude);
      accelp.add(drag);*/
      
    if (keyCode == TAB){
      accelp.mult(0);
      velocityp.mult(0);
      locationp = new PVector (displayWidth/4, displayHeight/4);
    } // resets the movement of the mover
  }
  
  void update() {//moves and rotates the mover
    velocityp.add(accelp);

    locationp.add(velocityp);

    aAccel = accelp.x / 10.0;
    aVelocity += aAccel;
    aVelocity = constrain(aVelocity,-0.1,0.1);
    angle += aVelocity;

    accelp.mult(0);
  }
  
  
  void applyForce(PVector force) { //can be used to apply forces to the mover
    PVector f = force; //we can change f by dividing force by mass, but for
    //now this is just a simplified form
    accelp.add(f);
  }
  
  void display(){
    stroke(0);
    fill(175,200);
    rectMode(CENTER);
    pushMatrix();
    translate(locationp.x,locationp.y);
    rotate(angle);
    rect(0,0,16,16);
    popMatrix();
  }
  
}
