//put in text


/* Ryan P  "9/5/19"
"Name of the activity"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create a new sketch that uses PerlinNoise or to modify existing code to illustrate how Perlin Noise is visually different from other kinds of randomness"
Source(s):

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR: Thorough commentary! Very visually pleasing. M
//Might benefit from some screen text
//DCR: 24  / 20  pts

int displayWidth=1280; //this variable sets the width of the screen
int displayHeight=1000;  //this variable sets the height of the screen


void setup() {
  String BR="Basic Randomness";
  String GR="Gaussian Randomness";
  String LF="Levy Flight Randomness";
  String PN="Perlin Noise Randomness";
  fill(255);
  text(BR,displayWidth/6, displayHeight-30);
  
  
  
  frameRate(30); //sets the framerate of the big master program, the number of times the program runs per second
  background (100); //made the background gray
  size(displayWidth,displayHeight); //set the size of the canvas
  w1=new Walker1(); //makes the first normal random walker
  generator=new Random(); //makes the generator for the gaussian walker
  G=new WalkerG(); //this declares a new object of the class WalkerG, or Gaussian Paint Splatter (called walker for consistency)
  gen=new Random(); //this creates a random number generator for the Gaussian walker
  wLF=new WalkerLF(); //this creates a new object of the class WalkerLF, or Levy Flight Walker
  genPN=new Random(); //this creates a random number generator for the perlin noise walker
  wpn=new WalkerPN(); //this creates a new object of the class WalkerPN, or Perlin Noise Walker
}

void draw(){
  w1.step(); //this calls the step function for the first normal random walker
  w1.display(); //this literally draws the first walker, so it can be seen
  G.drawG(); //this calls both the step and the draw function for the Gaussian Walker
  wLF.step(); //this calls the function that moves the Levy Flight (LF) walker
  wLF.display(); //this calls the function that draws the LF walker
  wpn.step(); //this calls the function that moves the Perlin Noise (PN) walker
  wpn.display(); //this calls the function that moces teh PN walker
}
