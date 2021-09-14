//DCR: Needs header

//DCR: Needs more commentary throughout the sketch!

float r;
float theta;


void setup() {
  size(1280, 800);
  background(255);
  smooth();
  frameRate(200);
  // Initialize all values
  r = 10;
  theta = 0;
}

void draw() {
  
  //background(255);
  noStroke();
  fill(255,5);
  //rect(0,0,width,height);
    
  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  
  // Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  fill(127);
  stroke(0);
  strokeWeight(2);
  //line(0,0,x,y);
  ellipse(x, y, 10, 10);
  
  // Increase the angle over time
  theta += 0.01;
  r+=.05;

}
