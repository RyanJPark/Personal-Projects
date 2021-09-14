PMover A;

void setup(){
  background(255);
  size(1280, 800);
  smooth();
  //set the size and color of the background
  
  textSize(25);
  text("Tips: if the ball goes off the screen, press tab.", displayWidth/3, displayHeight/3);
  //just a tip
  
  PMover A = new PMover(); //creates the PMover called A
}

void draw(){
  background(255);
  
  A.keymove();
  
  A.update();
  A.display();
  
  
  
}
