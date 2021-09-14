/* Ryan P    9/9/19
"Bouncing Balls with Vectors"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create balls that bounce off the walls with vectors"

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
//DCR:  10 / 10  pts
import java.util.Random;
int displayWidth=375;
int displayHeight=390;
PVector loc1= new PVector(random(0,displayWidth),random(0,displayHeight));
PVector loc2= new PVector(random(0,displayWidth),random(0,displayHeight));
PVector loc3= new PVector(random(0,displayWidth),random(0,displayHeight));
PVector loc4= new PVector(random(0,displayWidth),random(0,displayHeight));
PVector bmove1 = new PVector(5,7);
PVector bmove2 = new PVector(6,4);
PVector bmove3 = new PVector(2,40);
PVector bmove4 = new PVector(5,30);
int R=100;
int G=70;
int B=99;
int R2=10;
int G2=200;
int B2=150;
int R3=200;
int G3=175;
int B3=33;
int R4=225;
int G4=225;
int B4=225;

int ballDiameter=30;
int ballD2=40;
int ballD3=60;
int ballD4=50;


void setup(){
  size(displayWidth,displayHeight);
}

 void draw(){
  background(150,70,255); 
  //set the background color, clears away any previous balls
    
  loc1.add(bmove1);
  //moves the circle
  
  if(loc1.x<=0+(ballDiameter/2) || loc1.x>=displayWidth-(ballDiameter/2)){
    bmove1.x=bmove1.x*-1;
  } //bounces ball off vertical walls, when edge touches
  
  if(loc1.y<=0+(ballDiameter/2) || loc1.y>=displayHeight -(ballDiameter/2)){
    bmove1.y = bmove1.y * -1;
  } //bounces ball off horizontal walls, when edge touches
  
  fill (R,G,B);
  //set the color of the circle
  
  ellipse(loc1.x,loc1.y,ballDiameter,ballDiameter);
  //draws the circle

//starting code for second ball

  loc2.add(bmove2);
  //moves the circle
  
  if(loc2.x<=0+(ballDiameter/2) || loc2.x>=displayWidth-(ballDiameter/2)){
    bmove2.x=bmove2.x*-1;
  } //bounces ball off vertical walls, when edge touches
  
  if(loc2.y<=0+(ballDiameter/2) || loc2.y>=displayHeight -(ballDiameter/2)){
    bmove2.y = bmove2.y * -1;
  } //bounces ball off horizontal walls, when edge touches
  
  fill (R2,G2,B2);
  //set the color of the circle
  
  ellipse(loc2.x,loc2.y,ballD2,ballD2);
  //draws the circle

//draws the third circle
  loc3.add(bmove3);
  //moves the circle
  
  if(loc3.x<=0+(ballDiameter/2) || loc3.x>=displayWidth-(ballDiameter/2)){
    bmove3.x=bmove3.x*-1;
  } //bounces ball off vertical walls, when edge touches
  
  if(loc3.y<=0+(ballDiameter/2) || loc3.y>=displayHeight -(ballDiameter/2)){
    bmove3.y = bmove3.y * -1;
  } //bounces ball off horizontal walls, when edge touches
  
  fill (R3,G3,B3);
  //set the color of the circle
  
  ellipse(loc3.x,loc3.y,ballD3,ballD3);
  //draws the circle
  
  //draws the fourth
    loc4.add(bmove4);
  //moves the circle
  
  if(loc4.x<=0+(ballDiameter/2) || loc4.x>=displayWidth-(ballDiameter/2)){
    bmove4.x=bmove4.x*-1;
  } //bounces ball off vertical walls, when edge touches
  
  if(loc4.y<=0+(ballDiameter/2) || loc4.y>=displayHeight -(ballDiameter/2)){
    bmove4.y = bmove4.y * -1;
  } //bounces ball off horizontal walls, when edge touches
  
  fill (R4,G4,B4);
  //set the color of the circle
  
  ellipse(loc4.x,loc4.y,ballD4,ballD4);
  //draws the circle
}
