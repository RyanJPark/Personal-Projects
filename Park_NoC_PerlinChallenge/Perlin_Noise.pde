//haven't started yet
int stepsizePN;
import java.util.Random;
Random genPN;

int R4=int(random(255));
int G4=int(random(255));
int B4=int(random(255));
//sets the color values
float pnx=100;
float pny=0;
//sets the beginning coordinates
float stepxPN;
float stepyPN;
//declares the step size variables
float xPN=displayWidth*.75;
float yPN=displayHeight*.75;
//sets the coordinates according to the screen size
WalkerPN wpn;
//declares a perlin noise walker

class WalkerPN{ 

  //starts the walker in the middle of the screen
  
  void display(){
    stroke(255);
    fill(255);
    ellipse(xPN,yPN,1,1);
  }//draws the "walker"
  
  void step() {
    stepxPN=map(noise(pnx),0,1,-4.5,6);
    stepyPN=map(noise(pny),0,1,-4,5);
    //uses noise to randomize the step size
    xPN= constrain(xPN+stepxPN,displayWidth/2, displayWidth);
    yPN= constrain(yPN+stepyPN,displayHeight/2,displayHeight);
    //keeps the walker in the section
    pnx+=.1;
    pny+=.1;
    //moves the noise values forward, so the program continues to get new perlin noise calues
  }  
}
//created a new class of object called walker
