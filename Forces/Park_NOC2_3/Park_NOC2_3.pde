Mover[] movers = new Mover[200];

void setup() {
  size(2000, 1000);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), displayWidth/4, displayHeight/4);
  }
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

  }
}
