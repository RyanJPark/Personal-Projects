//haven't started making it work for this program, but works

int stepsizeLF;
import java.util.Random;
Random gen;


int R3=int(random(200,255));
int G3=int(random(200,255));
int B3=int(random(200,255));
//these three set the random color each time
int stepsdLF=5;
int stepmeanLF=10;
//set variables needed for making the walker move in levy flight patterns
int xLF=displayWidth/4;
int yLF=(3*displayHeight)/4;
//sets the beginning position of the LF walker relative to the size of the screen
WalkerLF wLF;
//declares the existence of the walker

class WalkerLF{ 
  
  void display(){
    constrain(xLF,0,displayWidth/2);
    constrain(yLF,0,displayHeight/2);
    //keeps the walker in the section it's supposed to stay in
    stroke(R3,G3,B3);
    fill(R3,G3,B3);
    //sets the color of the circle
    ellipse(xLF,yLF,1,1);
    //draws the walker
  }
  
  void step() {
    int r1=(int)random(1,5);
    int r2=(int)random(1,50);
    //makes two random numbers, which is needed for levy flight randomness patterns
    if (r2<= r1){ //checks to see if the second random qualifies the instance for a big step
      stepsizeLF=r1/3;
      //sets the size of the step of the walker
      int stepxLF = (int)random(-stepsizeLF,stepsizeLF);
      int stepyLF = (int)random(-stepsizeLF,stepsizeLF);
      //finds a random x step and y step between the positive and negative stepsize
      stepxLF=stepxLF*(displayWidth/120);
      stepyLF=stepyLF*(displayHeight/120);
      //customizes the stepx and stepy to the size of the screen
      xLF+=stepxLF;
      yLF+=stepyLF;
      //makes the x and y coordinate of the walker change
      constrain(xLF,(4*displayWidth)/6,displayWidth);
      constrain(yLF,0,displayHeight/2);
      //keeps the levy flight walker in the section for it
    }else{ //if the first random isn't qualified, the program will make the walker move in small random steps
      float r=random(1);
      stepsizeLF=(int) gen.nextGaussian();
      stepsizeLF=stepsizeLF*stepsdLF+stepmeanLF;
      if(r<.23){
        xLF=xLF+stepsizeLF;
      }else if (r<.45) {
        xLF=xLF-stepsizeLF;
      } else if (r < 0.75) {
        yLF=yLF+stepsizeLF;
      } else {
        yLF=yLF-stepsizeLF;
      }//all this code just moves the walker in small steps randomly, using acutal basic randomness
    }
    

  }
  
  void changeColor() {
    int R3=int(random(255));
    int G3=int(random(255));
    int B3=int(random(255));
  }//changes color
}
