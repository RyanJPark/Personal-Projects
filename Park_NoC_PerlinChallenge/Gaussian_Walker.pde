import java.util.Random; //imports the random functions needed for the Gaussian walker

int xmeanG=(3*displayWidth)/4; //this variable determines the middle x coordinate relative to the screen's horizontal size
int ymeanG=displayHeight/4; //this variable determines the middle y coordinate relative to the screen's vertical size
int sdG=40; //this variable determines the distance the paint splatters are from the xmean and ymean
int diameterG=8; //this determines the size of the paint splatters
float R2; //this will determine the red value of each paint splatter
float G2; //this will determine the green value of each paint splatter
float B2; //this will determine the blue value of each paint splatter
float circlexG; //this determines the x coordinate of each circle
float circleyG; //this determines the y coordinate of each circle
float xred;
Random generator; //this declares a random number generator for the splatter
WalkerG G; //this declares a splatter called G

class WalkerG{
  void drawG(){
    circlexG=(float) generator.nextGaussian(); //this randomizes the circle's x coordinate via gaussian randomness
    circleyG=(float) generator.nextGaussian(); //this randomizes the circle's y coordinate via gaussian randomness
    circlexG=circlexG*sdG+xmeanG; //this customizes the circle's actual x coordinate, since the generator only gives values between -1 and 1
    circleyG=circleyG*sdG+ymeanG; //this customizes the circle's actual y coordinate, since the generator only gives values between -1 and 1
  
    R2= (int) map(circlexG,displayWidth/2,displayWidth,0,255); //makes a gradient for the red value from left to right
    G2= (int) map(circleyG,displayWidth/2,displayWidth,0,255); //makes a gradient for the green value from left to right
    B2= (int) map(circlexG,displayWidth/2,displayWidth,0,255); //makes a gradient for the blue value from left to right
    stroke(R2,G2,B2); //sets the outline color for the circles
    fill(R2,G2,B2); //sets the inside color for the circles
    ellipse(circlexG,circleyG,diameterG,diameterG); //draws the circle
  }
}
