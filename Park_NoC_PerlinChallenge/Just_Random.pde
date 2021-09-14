int R1=int(random(255)); //changes the red every time the program is run
int G1=int(random(255)); //changes the green every time the program is run
int B1=int(random(255)); //changes the blue every time the program is run
float x1=displayWidth/4; //sets the starting x position of the first walker
float y1=displayHeight/4; //sets the starting y position of the first walker
Walker1 w1; //declares the existence of a walker of the basic random class

class Walker1{ 

  //starts the walker in the middle of the screen
  
  void display(){
    stroke(100);
    fill(100);
    rect(0,0,displayWidth/2,displayHeight/2); //refreshes the background for the section
    stroke(255);  //sets the color of the outline of the circle
    fill(255);  //sets the color of the fill of the circle
    ellipse(x1,y1,6,6);  //draws the circle
    
  }//draws the "walker"
  
  void step() {
    float r1=random(1);
    if(r1<.25){ //there a twenty five percent change of the walker moving to the right
      x1+=5;
      constrain(x1,0,displayWidth/2);  //keeps the walker in its area
      constrain(y1,0,displayHeight/2);  //keeps the walker in its area
    }else if (r1 < 0.5) { //twenty five % to the left
      x1-=6;
      constrain(x1,0,displayWidth/2);  //keeps the walker in its area
      constrain(y1,0,displayHeight/2);  //keeps the walker in its area
    } else if (r1 < 0.75) { //25% up
      y1+=5;
      constrain(x1,0,displayWidth/2);  //keeps the walker in its area
      constrain(y1,0,displayHeight/2);  //keeps the walker in its area
    } else { //25% down
      y1-=5;
      constrain(x1,0,displayWidth/2);  //keeps the walker in its area
      constrain(y1,0,displayHeight/2);  //keeps the walker in its area
    }
  }//moves the walker randomly
}
//created a class of object called walker, with only the most basic randomness
