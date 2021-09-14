  class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //PVectors needed for motion
  float lifespan, initialMove,asdf,z;
  //floats used to determine properties of the particles
  //the float asdf is used to make a piece of code run once for every particle. The initial value is zero, and if the value of asdf is zero, a certain piece of code will run and change the value of asdf to 1, so the piece of code does not run again
  float topspeed=3;
  //limits the speed of the particle
  int R,G,B;

  Particle(PVector l, int R3,int G3 ,int B3 ) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-topspeed,topspeed),random(-2,2));
    location = l.get();
    lifespan = 255.0;
    initialMove=0;
    asdf=0;
    R=R3;
    G=G3;
    B=B3;
    z=random(-100,100);
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
    lifespan-=3;
    //moves the paritcle and slowly kills it
        println(location.x,location.y);
  }

  void display() {
    stroke(R+z,G+z,B+z,lifespan);
    strokeWeight(2);
    fill(R+z,G+z,B+z,lifespan);
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

//new class, child class of Particle, but draws a rotating sqaure instead
class Square extends Particle {
  float z, angle;
  //z changes the color, angle sets the rotation
  Square (PVector l, int r, int g, int b){
    super(l,r,g,b);
    z = random(-100,100);
    //set the initial values of everything
  }
  void display(){
//not sure why but if either stroke or fill is commented out, then a "firework effect" appears. commenting out both works as well.
    pushMatrix();
    angle=map(location.x,0,255,-2*PI,2*PI);
    translate(location.x,location.y);
    rotate(angle);
    //rotates the sqaure
    //stroke(R+z,G+z,B+z,lifespan);
    //fill(R+z,G+z,B+z,lifespan);
    rect(0,0,12,12);
    popMatrix();
    //draws the sqaure
  }
}

/*Commenting on the "firework effect"
 - each particle fountain will only have "fireworks" of the color of the particle fountain that came into existence before it
 - the first particle fountain will have the colors of the last produced particle fountain
 - the particles could be re-arranging the order of the arrayList, so that some particles of one color are being calculated with the particle fountain of the fountain before
 - only having one fountain will cause the firework effect of the same color
 - the firework effect only occurs with squares, and only if the stroke and/or fill lines of code are commented out
*/
