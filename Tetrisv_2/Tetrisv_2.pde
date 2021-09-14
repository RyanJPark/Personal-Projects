/* Ryan P    "3/6/20"
"B6.4Milestone-AnalogRender"
Information Engineering  '19-20     St. Mark's School of Texas 

Code Abstract: "What is the purpose of this code?"
Source(s): https://www.openprocessing.org/sketch/313016/

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/




import processing.serial.*;
Serial port;


int w = 10;
int h = 20;
int q = 20;//blocks width and height
int dt;// delay between each move
int currentTime;
Grid grid;
Piece piece;
Piece nextPiece;
Pieces pieces;
Score score;
int r = 0;//rotation status, from 0 to 3
int level = 1;
int nbLines = 0;

int txtSize = 20;
int textColor = color(34, 230, 190);

Boolean gameOver = false;
Boolean gameOn = false;
//set starting values for global variables

void setup(){
  size(600, 480, P2D);
  textSize(20);
  //set up size of screen/text size
  
  //printArray(Serial.list());
  port = new Serial(this,"COM3",9600);
  port.bufferUntil('\n');
  //sets up communication with arduino
  
}

void initialize() {
  level = 1;
  nbLines = 0;
  dt = 1000;
  currentTime = millis();
  score = new Score();
  grid = new Grid();
  pieces = new Pieces();
  piece = new Piece(-1);
  nextPiece = new Piece(-1);
}//sets up a new game and all objects needed

void draw(){
 
  
  
  background(60);

  if(grid != null){
    grid.drawGrid();
    int now = millis();
    if (gameOn) {
      if (now - currentTime > dt) {
        currentTime = now;
        piece.oneStepDown();
      }
    }//moves pieces one square down every cycle
    piece.display(false);
    score.display();
  }
  if (gameOver) {//ends the game if game should be over
    noStroke();
    fill(255, 60);
    rect(110, 195, 240, 2*txtSize, 3);
    fill(textColor);
    text("Game Over", 120, 220);
  }
  if (!gameOn) { //starts the game if p is pressed
    noStroke();
    fill(255, 60);
    rect(110, 250, 255, 2*txtSize, 3);
    fill(textColor);
    text("press 'p' to start playing!", 120, 280);
  }
}

void goToNextPiece() {
  //println("-- - nextPiece - - --");
  piece = new Piece(nextPiece.kind);
  nextPiece = new Piece(-1);
  r = 0;
}//generates next piece

void goToNextLevel() {
  score.addLevelPoints();
  level = 1 + int(nbLines / 10);
  dt *= .8;
  //soundLevelUp();
}//adds to level, and changes speed of pieces

void serialEvent(Serial port){  
  
  String inString = port.readStringUntil('\n');
  
  if(inString!= null){
    inString = trim(inString);
    float[]vals=float(split(inString,",") );
    if(vals.length>=2){
      
    /*int move2 = (int)map(vals[0],0,1023,9,0);
    if ( grid.pieceFits(new PVector (move2,piece.y) ) ){
      piece.x=move2;
    }*/
    
      if(vals[1]>500){
        piece.inputKey(UP);
      }
    }
  }
}//reads input from the arduino

void keyPressed() { //lets you play tetris with the keys (not commented out for easier debugging)
  if (key == CODED && gameOn) {
    switch(keyCode) {
    case LEFT:
    case RIGHT:
    case DOWN:
    case UP:
    case SHIFT:
      piece.inputKey(keyCode);
      break;
    }
  } else 
  if (keyCode == 80) {// "p"
    if(!gameOn){
      initialize();
      //soundGameStart();
      gameOver = false;
      gameOn = true;
    }
  } else if (keyCode == 77) {// "m"
    //muteSound();
  }
}
