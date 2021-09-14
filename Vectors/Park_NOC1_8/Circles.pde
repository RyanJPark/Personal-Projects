class Mover {

  PVector location;
  PVector location1;
  PVector velocity;
  PVector velocity1;
  PVector acceleration;
  PVector accleration1;
  float topspeed;
  float topspeed1;
  PVector location2;
  PVector velocity2;
  PVector acceleration2;
  float topspeed2;
  //all these vectors and floats create the variables needed to run the program
//  PVector step = new PVector(0,0);
//  PVector loc;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 10;
    location1 = new PVector(random(width),random(height));
    velocity1 = new PVector(0,0);
    topspeed1 = 30;
    location2 = new PVector(random(width),random(height));
    velocity2 = new PVector(0,0);
    topspeed2 = 60;
    //this code sets the beginning magnitude and direction of all the variables
  }

  void update() {
    if(mousePressed){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration = PVector.mult(PVector.sub(mouse,location),-1);
      acceleration.normalize();
      acceleration.mult(9);
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
      //this code will cause the movers to move toward the mouse when clicked
    }else{
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration = PVector.sub(mouse,location);
      acceleration.normalize();
      acceleration.mult(.6);
      if ( acceleration.mag() < 10){
        acceleration.mult(random(.6));
        //this code will make the movers move toward the mouse, but if they get within a certain range (10), they will accelerate and move to the other side of the mouse, starting the process
        //all over again
      }
    
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
      //this code actually changes the velocity and location
    }
  }
  void update1() {
    if(mousePressed){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration1 = PVector.mult(PVector.sub(mouse,location1),-1);
      acceleration1.normalize();
      acceleration1.mult(2);
      velocity1.add(acceleration1);
      velocity1.limit(topspeed1);
      location1.add(velocity1);
    }else{
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration1 = PVector.sub(mouse,location1);
      acceleration1.normalize();
      acceleration1.mult(3);
      if ( acceleration1.mag() < 75){
        acceleration1.mult(random(.6));
      }
    
      velocity1.add(acceleration1);
      velocity1.limit(topspeed1);
      location1.add(velocity1);
    } //all of the code under update1 does the same thing as the code in void update, except for the purple movers, so the change values are a little bigger
  }
  void update2() {
    if(mousePressed){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration2 = PVector.mult(PVector.sub(mouse,location2),-1);
      acceleration2.normalize();
      acceleration2.mult(2);
      velocity2.add(acceleration2);
      velocity2.limit(topspeed2);
      location2.add(velocity2);
    }else{
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration2 = PVector.sub(mouse,location2);
      acceleration2.normalize();
      acceleration2.mult(4);
      if ( acceleration2.mag() < 150){
        acceleration2.mult(random(.9));
      }
    
      velocity2.add(acceleration2);
      velocity2.limit(topspeed2);
      location2.add(velocity2);
    } //this follows the same pattern as void update 1
  }
  /*
  void updateSlow() {
     PVector loc = new PVector(location.x,location.y);
    if(mousePressed){
      
      PVector mouse = new PVector(mouseX,mouseY);
      PVector acceleration = PVector.sub(mouse,location);
      acceleration.normalize();
      acceleration.mult(0.02);
    
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
    }else{
     int displayWidth=1280;
     int displayHeight=1280;
     float pnx=100;
     float pny=0;
     step.x=map(noise(pnx),0,1,-19,22);
     step.y=map(noise(pny),0,1,-18,20);
     loc.x= constrain(loc.x+step.x,0,displayWidth);
     loc.y= constrain(loc.y+step.y,0,displayHeight);
     pnx+=.1;
     pny+=.1;
     loc.add(step);
    }
    
  }*/ //this code was supposed to create background movers.
  

  void display() {
    stroke(random(180,220),random(80,120),random(80,120));
    strokeWeight(0);
    fill(random(180,220),random(80,100),random(80,120));
    ellipse(location.x,location.y,5,5);
  }
  void display1() {
    stroke(random(180,220),random(80,120),random(180,220));
    strokeWeight(0);
    fill(random(180,220),random(80,120),random(180,220));
    ellipse(location1.x,location1.y,5,5);
  }
  void display2() {
    stroke(random(80,120),random(80,120),random(280,220));
    strokeWeight(0);
    fill(random(80,120),random(80,120),random(280,220));
    ellipse(location2.x,location2.y,5,5);
  } //these three display functions draw the circles every time they move, each for different types of movers
  /*
  void displaySlow() {
    stroke(100,100,100);
    fill(100,100,100);
    ellipse(loc.x,loc.y,10,10);
  }
*/
}
