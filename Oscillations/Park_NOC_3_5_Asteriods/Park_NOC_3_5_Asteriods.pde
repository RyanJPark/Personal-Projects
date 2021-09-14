/* Ryan P "10/11/19"
"Asteriods"
Information Engineering  '18-19     St. Mark's School of Texas
Code Abstract: This piece of code is a simulation of asteriods, but just the spaceship for now
Source(s): My own code, Daniel Shiffman
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Extremely responsive! 30/30
Rocket Player;
float heading = 0;//inital direction of the rocket

void setup() {
  size(1600, 1200);
  smooth();
  //basic setup stuff
  Player = new Rocket();
  //creates the player
}

void draw() {
  background(255); 
  
  Player.update();
  Player.wrapEdges();
  Player.display();
  Player.thrust();
   //makes the player move and show up

  fill(0);
  text("left right arrows to turn, up to go forward, down to go backward",20,height-10);
  text("Forward thrust is a toggle", 20, height-20);
  text("Click to start", 20, height-30);
  //instructions
  if (keyPressed) {
    if (key == CODED && keyCode == LEFT) {
      Player.turn(-0.15);
    } else if (key == CODED && keyCode == RIGHT) {
      Player.turn(0.15);
  }//makes the keys work
  }
}
