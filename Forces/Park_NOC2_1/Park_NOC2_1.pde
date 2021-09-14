//DCR: Will count as 2.2
//DCR: Needs header
//DCR: 8  /  10 pts
int displayHeight=200;
int displayWidth=1280; //sets the display size
Balloon b; //creates teh balloon
float pnD=.01;
float pnt=90; //sets the variables needed for perlin noise wind
float topWindSpeed=6;//sets the top speed of the wind
float bD=40;
float mass=1; //sets the ball mass and size
PVector wind= new PVector(.1,0);
PVector grav= new PVector(.98,0); //makes wind and gravity global variables

void setup(){
  size(displayWidth,displayHeight);
  b = new Balloon(); //creates the balloon and the canvas
}

void draw(){
  background(255);
  b.applyForce(wind);
  b.applyForce(grav);
  //applies wind and gravity to the balloon
  b.move();
  //moves the balloon
  b.Bounce();
  //bounces the balloon off the edges 
  b.display();
  //displays the balloon
  b.changeX(wind);
  //changes the wind value of the wind
}

class Balloon {
  
  PVector accel=new PVector(0,0);
  PVector velocity=new PVector(0,0);
  PVector location=new PVector(displayWidth/2,(displayHeight)/8);
  PVector wind=new PVector(3,0);
  PVector grav = new PVector (0,3);
  //sets all the variables needed for the class
  
  Balloon(){
    PVector accel=new PVector(0,0);
    PVector velocity=new PVector(0,0);
    PVector location=new PVector(displayWidth/2,(displayHeight)/2);
    PVector wind=new PVector(0,0);
    PVector grav = new PVector (0,.98);
    //sets all the values for the variables
  }
  void changeX(PVector changeForce){
    changeForce.x= map(noise(pnt),0,1,-topWindSpeed,topWindSpeed);
    pnt=pnt+pnD;
//randomly changes the wind force    
  }
  void move(){
    
    accel.add(grav);
    velocity.add(accel);
    location.add(velocity);
    accel.mult(0);
    //moves the balloon, gravity is here because it didn't quite work with the 
    //apply force function
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    accel.add(f);
  }//changes the acceleration
  
  void Bounce(){
    if (location.y >= displayHeight-bD){
      location.y=height;
      velocity.y=velocity.y*-1;
    }
    if (location.x >= displayWidth-bD){
      location.x=width;
      velocity.x=velocity.x*-1;
    }
    if (location.y <= bD){
      location.y=0;
      velocity.y=velocity.y*-1;
    }
    if (location.x <= bD){
      location.x=0;
      velocity.x=velocity.x*-1;
    }
    constrain(location.x,0,displayWidth);
    constrain(location.y,0,displayHeight);
  }//bounces the balloon
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(175);
    ellipse(location.x,location.y,bD,bD);
  }//draws the balloon
}
