/* Ryan P    8/29/19
"Bouncing Ball"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "To create balls that bounce off the walls"

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/
int x=15;
int y=115;
int x2=270;
int y2=330;
int x3=100;
int y3=230;
int x4=80;
int y4=300;
int ballMovementX = 5;
int ballMovementY = 7;
int ballMovementX2 = 6;
int ballMovementY2 = 4;
int ballMovementX3 = 2;
int ballMovementY3 = 4;
int ballMovementX4 = 5;
int ballMovementY4 = 3;
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
int displayWidth=375;
int displayHeight=390;
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
    
  x=x+ballMovementX;
  y=y+ballMovementY; //<>//
  //moves the circle
  
  if(x<=0+(ballDiameter/2) || x>=displayWidth-(ballDiameter/2)){
    ballMovementX=ballMovementX * -1;
  } //bounces ball off vertical walls, when edge touches
  
  if(y<=0+(ballDiameter/2) || y>=displayHeight -(ballDiameter/2)){
    ballMovementY=ballMovementY * -1;
  } //bounces ball off horizontal walls, when edge touches

  if(R<=0){
    R=R+15;
  }else if(R>=225){
    R=R-20;
  }//changes the red value of the ball
  
  if(B<=0){
    B=B+15;
  }else if(B>=225){
    B=B-20;
  }//changes the blue value of the ball
  
  if(G<=0){
    G=G+15;
  }else if(G>=225){
    G=G-20;
  }//changes the green value of the ball
  
  fill (R,G,B);
  //set the color of the circle
  
  ellipse(x,y,ballDiameter,ballDiameter);
  //draws the circle

//starting code for second ball

  x2=x2+ballMovementX2;
  y2=y2+ballMovementY2;
  //moves the circle

  if(x2<=0+((ballD2)/2) || x2>=displayWidth-((ballD2)/2)){
    ballMovementX2=ballMovementX2 * -1;
  } //bounces ball off vertical walls, when edge touches
  
  if(y2<=0+(ballD2/2) || y2>=displayHeight -(ballD2/2)){
    ballMovementY2=ballMovementY2 * -1;
  } //bounces ball off horizontal walls, when edge touches

  if(R2<=0){
    R2=R2+15;
  }else if(R2>=225){
    R2=R2-20;
  }//changes the red value of the ball
  
  if(B2<=0){
    B2=B2+15;
  }else if(B2>=225){
    B2=B2-20;
  }//changes the blue value of the ball
  
  if(G2<=0){
    G2=G2+15;
  }else if(G2>=225){
    G2=G2-20;
  }//changes the green value of the ball
  
  fill (R2,G2,B2);
  //set the color of the circle
  
  ellipse(x2,y2,ballD2,ballD2);
  //draws the circle
  
//starting the third

  x3=x3+ballMovementX3;
  y3=y3+ballMovementY3;
  //moves the circle
  
  if(x3<=0+(ballD3/2) || x3>=displayWidth-(ballD3/2)){
    ballMovementX3=ballMovementX3 * -1;
  } //bounces ball off vertical walls, when edge touches
  
  if(y3<=0+(ballD3/2) || y3>=displayHeight -(ballD3/2)){
    ballMovementY3=ballMovementY3 * -1;
  } //bounces ball off horizontal walls, when edge touches

  if(R3<=0){
    R3=R3+30;
  }else if(R3>=225){
    R3=R3-10;
  }//changes the red value of the ball
  
  if(B3<=0){
    B3=B3+60;
  }else if(B3>=225){
    B3=B3-69;
  }//changes the blue value of the ball
  
  if(G3<=0){
    G3=G3+82;
  }else if(G3>=225){
    G3=G3-12;
  }//changes the green value of the ball
  
  fill (R3,G3,B3);
  //set the color of the circle
  
  ellipse(x3,y3,ballD3,ballD3);
  //draws the circle
  
//starting the fourth
  //starting the third

  x4=x4+ballMovementX4;
  y4=y4+ballMovementY4;
  //moves the circle
  
  if(x4<=0+(ballD4/2) || x4>=displayWidth-(ballD4/2)){
    ballMovementX4=ballMovementX4 * -1;
  } //bounces ball off vertical walls, when edge touches
  
  if(y4<=0+(ballD4/2) || y4>=displayHeight -(ballD4/2)){
    ballMovementY4=ballMovementY4 * -1;
  } //bounces ball off horizontal walls, when edge touches

  if(R4<=0){
    R4=R4+30;
  }else if(R4>=225){
    R4=R4-10;
  }//changes the red value of the ball
  
  if(B4<=0){
    B4=B4+60;
  }else if(B4>=225){
    B4=B4-69;
  }//changes the blue value of the ball
  
  if(G4<=0){
    G4=G4+82;
  }else if(G4>=225){
    G4=G4-12;
  }//changes the green value of the ball
  
  fill (R4,G4,B4);
  //set the color of the circle
  
  ellipse(x4,y4,ballD4,ballD4);
  //draws the circle

  //to make the circles bounce off eachother
/*
  if( sqrt(((x-x2)^2)+((y-y2)^2)) <= (ballDiameter+ballD2)/2 ){
    ballMovementX=ballMovementX*-1;
    ballMovementY=ballMovementY*-1;
    ballMovementX2=ballMovementX2*-1;
    ballMovementY2=ballMovementY2*-1;
  } //the first and second ball will interact
 
  if( sqrt(((x2-x3)^2)+((y2-y3)^2)) <= (ballD2+ballD3)/2 ){
    ballMovementX2=ballMovementX2*-1;
    ballMovementY2=ballMovementY2*-1;
    ballMovementX3=ballMovementX3*-1;
    ballMovementY3=ballMovementY3*-1;
  }//the second and third ball will bounce

  if( sqrt(((x-x3)^2)+((y-y3)^2)) <= (ballDiameter+ballD3)/2 ){
    ballMovementX=ballMovementX*-1;
    ballMovementY=ballMovementY*-1;
    ballMovementX3=ballMovementX3*-1;
    ballMovementY3=ballMovementY3*-1;
  }//the third and first ball will bounce
*/
}
