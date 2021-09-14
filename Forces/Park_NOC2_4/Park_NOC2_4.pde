Mover[] movers = new Mover[10];
Player P1=new Player();

void setup() {
  background(255);
  textSize(25);
  text("Tips: if the ball goes off the screen, press tab.", displayWidth/3, displayHeight/3);
  text(" Press Ctrl for slo mo", (displayWidth/3) + 10, (displayHeight/3) + 10);
  text(" Press Shift to stop the ball", (displayWidth/3) + 20, (displayHeight/3) + 20);
  size(1280, 800);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), displayWidth/4, displayHeight/4);
  }
  P1= new Player();
}

void draw() {
  
  
  background(255);

  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);

   // movers[i].applyForce(wind);
   // movers[i].applyForce(gravity);

    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
    
    float avgf=85;
   if(keyCode == CONTROL){
     avgf=avgf*-1;
   }
   frameRate(115+avgf);
  }
  P1.keyPressed();
  P1.displayp();
  
  
  fill(0);
  textSize(20);
  text("Tips: if the ball goes off the screen, press tab.", 10, 15);
  text(" Press Ctrl for slo mo", 10, 35);
  text(" Press Shift to stop the ball", 10, 55);
  text(" Click to start", 10, 75);
}
