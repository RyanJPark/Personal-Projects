/* Ryan P  8/29/19
"Gaussian Circle Drawing"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create an object that moves randomly"
Source(s): "Identify any sources for your inspiration or code. Include hyperlinks to external sites or which example folder was used."

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR:  20 / 20  pts
import java.util.Random;

int displayWidth=1280;
int displayHeight=800;
int xmean=displayWidth/2;
int ymean=displayHeight/2;
int sd=100;
int diameter=30;
int R;
int G;
int B;
float circlex;
float circley;
Random generator;

void setup(){
  size(displayWidth,displayHeight);
  generator = new Random();
  frameRate(1000);
}

void draw(){
  circlex=(float) generator.nextGaussian();
  circley=(float) generator.nextGaussian();
  circlex=circlex*sd + xmean;
  circley=circley*sd + ymean;
  
  R=(int)random(0,255);
  G=(int)random(0,255);
  B=(int)random(0,255);
  stroke(R,G,B);
  fill(R,G,B);
  ellipse(circlex,circley,diameter,diameter);
}
