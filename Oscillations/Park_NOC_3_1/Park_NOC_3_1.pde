//DCR: Needs header
//DCR:  9.5 /  10 pts

float angle = 0;
float angle1 = .75;
float angle2 = 2;
//creates two different angles

void setup(){
  size(1280,800);
  smooth();
  background(255);
}

void draw(){
  fill(255,50);
  stroke(0);
  strokeWeight(0);
  rectMode(CORNER);
  rect(0,0,width,height);
  //creates the fade effect by drawing a faded rectangle the size of the screen rather than drawing a background each time
  
  fill(127);
  stroke(0);
  rectMode(CENTER);
  translate(width/2, height/2);
  //translates the coordinate system to the middle of the screen, to make the angle math easier
  
  rotate(angle);
  line(0, 0, 200, 0);
  stroke(0);
  strokeWeight(2);
  fill(random(255),random(255),random(255));
  ellipse(200, 0, 16, 16);
  angle += 0.1;
  //rotates and draws the outer track
  
  rotate(angle1);
  line(0, 0, 130,90);
  stroke(0);
  strokeWeight(2);
  fill(random(255),random(255),random(255));
  ellipse(130, 90, 16, 16);
  angle1 += 0.1;
  //rotates and draws the middle track
  
  rotate(angle2);
  line(0, 0, 100,70);
  stroke(0);
  strokeWeight(2);
  fill(random(255),random(255),random(255));
  ellipse(100, 70, 16, 16);
  angle2 += -.5;
  //rotates and draws the inside track
}
