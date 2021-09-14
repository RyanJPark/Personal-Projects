//need to add friction

class Player{
  PVector locationp = new PVector (displayWidth/2,displayHeight/2);
  PVector velocityp = new PVector (0,0);
  PVector accelp = new PVector (0,0);
  float tp = 2;
  float c = .001;
  float frictionspeed = 10;
  
  void keyPressed(){
    if ( (keyCode == LEFT)){
      accelp.x=accelp.x-.01;
      velocityp=velocityp.add(accelp);
      constrain(velocityp.x,-tp,tp);
      locationp=locationp.add(velocityp);
    }
    if ( (keyCode == RIGHT)){
      accelp.x=accelp.x+.01;
      velocityp=velocityp.add(accelp);
      constrain(velocityp.x,-tp,tp);
      locationp=locationp.add(velocityp);
    }
    if ( (keyCode == UP)){
      accelp.y=accelp.y-.01;
      velocityp=velocityp.add(accelp);
      constrain(velocityp.y,-tp,tp);
      locationp=locationp.add(velocityp);
    }
    if ( (keyCode == DOWN)){
      accelp.y=accelp.y+.01;
      velocityp=velocityp.add(accelp);
      constrain(velocityp.y,-tp,tp);
      locationp=locationp.add(velocityp);
    }
    if (keyCode == SHIFT){
      accelp.mult(0);
      velocityp.mult(0);
    }
    if(locationp.x<=10 || locationp.x>=displayWidth){
      velocityp.x=0;
    }
  
    if(locationp.y<=10 || locationp.y>=displayHeight){
      velocityp.y=0;
    }
    
    
      float speed = velocityp.mag();
      float dragMagnitude = c * speed * speed;
      PVector drag = velocityp.get();
      drag.mult(-1);
      drag.normalize();
      drag.mult(dragMagnitude);
      accelp.add(drag);
    if (keyCode == TAB){
      accelp.mult(0);
      velocityp.mult(0);
      locationp = new PVector (displayWidth/4, displayHeight/4);
    }
  }
  
  
  void displayp(){
    stroke(0);
    fill(0,0,255);
    ellipse(locationp.x,locationp.y,20,20);
  }
  
}
