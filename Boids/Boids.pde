/* Ryan P
"Boids"

Source(s):Craig Reynolds, Daniel Shiffman

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
 */
import java.util.Iterator;
Flock flock;
int fadeValue=20;
int Burst = 30;

void setup() {
  smooth();
  frameRate(30);
  size(2000, 1300);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
}

void draw() {
  //background(0);
  fill(0,fadeValue);
  rect(0,0,width,height);
  flock.run();
  if(keyCode == SHIFT) frameRate(200);
  else frameRate(30);
}

// Add a new boid into the System
void keyPressed(){
  if (keyCode==TAB) flock.addBoid(new Boid(mouseX,mouseY));
}

void mousePressed(){
  for (int i =0; i<Burst;i++) flock.addBoid(new Boid(mouseX,mouseY));
}
