class Mover { //creates the class mover
  
  Mover() { //gives the vectors that can be used in the class mover
    location = new PVector(width/2,height/2); //sets the beginning location
    velocity = new PVector(0,0); //sets the beginning velocity
  }

  void update() { //moves the walker when called
    
    PVector mouse = new PVector(mouseX,mouseY); //creates a vector with the mouse
    
    PVector acceleration = PVector.sub(mouse,location);
    //figures out the magnitude and direction of acceleration
    acceleration.normalize();
    acceleration.mult(0.2);
    //the two lines of code above makes the acceleration good for this program
    
    PVector line = new PVector(mouseX,mouseY);
    line.x = (line.x + location.x)/2;
    line.y = (line.y + location.y)/2;
    //this creates the coordinates in between the circle and the mouse for the line 
    float linemag = line.mag();
    linemag=linemag*.75;
    line.setMag(linemag);
    //this sets how big the line will be

    println("line..",line);// this checks the values for the vector line, for debugging purposes
    println("location x...",location.x);
    println("location y...",location.y);
    
    velocity.add(acceleration); //changes the velocity for the walker
    velocity.limit(5); //sets the limits of the velocity
    velocity.div(1.075);
    location.add(velocity); //changes the location of the walker
     
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,48,48); 
    //draws the walker every time
    
   
  }
    

}
