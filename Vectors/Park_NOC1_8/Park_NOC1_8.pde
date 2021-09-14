Mover[] movers = new Mover[1000];
// Mover[] slowmovers = new Mover[20];

void setup() {
  size(2000,1500);//sets the size of the canvas
  smooth();//makes the graphics of the program smoother than normal
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); //creates a new mover for every integer below the length of the Mover array
  }
}

void draw() {
  
  background(200);//redraws the background every time

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display(); 
    //moves and draws the first type of mover, the red kind
    movers[i].update1();
    movers[i].display1();
    //moves and draws the purple kind of mover
    movers[i].update2();
    movers[i].display2();
    //moves and draws the blue kind of mover
  }
  
  /*
  for (int e = 0; e < bigg.length; e++) {
    bigg[e].update2();
    bigg[e].display2(); 
  }
  */
  
  /*
  for (int o=0; o< slowmovers.length; o++) {
    slowmovers[o].updateSlow();
    slowmovers[o].displaySlow();
  }*/
  //this code is supposed to create "background" movers that move unaffected by mouse pull, but will change when the mouse is clicked
}
