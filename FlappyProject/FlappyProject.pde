/*Ryan P 11/30/19 "Flappy Bird"
Sources:   
  Flappy Bird image source:https://www.pixilart.com/art/flappy-bird-22c3f5fd8323211
Notes: click to jump. Also, still working on hitboxing + graphics. also reset doesn't quite work.
*/


Bird Player;
Pipe Pipe;
Pipe Pipe2;
Score score;


void setup(){
  size(1280,800);
  background(#43D0F5);
  frameRate(30);
  smooth();
  
  Player = new Bird();
  Pipe = new Pipe();
  Pipe2 = new Pipe();
  Pipe2.gapLocation.x =+ width/2;
  score = new Score(Player, Pipe);

  
}


void draw(){
  background(#43D0F5);
  
  
  
  if(score.gameOver ){
    Player.gravity = new PVector(0,0);
    Player.velocity = new PVector(0,0);
    Player.runMinusJump();
    
    Pipe.velocity = new PVector (0,0);
    Pipe.run();
    Pipe2.velocity = new PVector (0,0);
    Pipe2.run();
    
    score.display();
    
    fill(0);
    textSize(60);
    if(score.count <=10){
      text("Try Again!", (width/2) -120 , (height/2) -120);
    }else if(score.count <= 30){
      text("WOW", (width/2) -120 , (height/2) -120);
    }else if(score.count <=50){
      text("Woah really good!", (width/2) -120 , (height/2) -120);
    }else if(score.count <=70){
      text("¡¡¡Godlike!!!", (width/2) -120 , (height/2) -120);
    }else if(score.count <=100){
      text("¡¡¡¡¡¡Hall of Fame worthy!!!!!!", (width/2) -120 , (height/2) -120);
    }
    
    score.reset(Pipe,Pipe2,Player);
    
    
    if(keyPressed == true && keyCode == SHIFT){
      Player = new Bird();
      Pipe = new Pipe();
      Pipe2 = new Pipe();
      Pipe2.gapLocation.x =+ width/2;
      score = new Score(Player, Pipe);
    }
  }else{
    Player.run();
    
    
    if(Pipe.gapLocation.x<-50){
      Pipe.gapLocation.x=width+10;
      Pipe.reset();
    } 
    if(Pipe2.gapLocation.x<-50){
      Pipe2.gapLocation.x=width+10;
      Pipe2.reset();
    }
    
    
    Pipe.run();
    Pipe2.run();
    

    score.run(Player,Pipe2);
    score.run(Player,Pipe);
    
    if(Player.position.y >= height-45){
      score.gameOver = true;
    }
    
  }
  
  
  fill(#23F216);
  stroke(0);
  strokeWeight(2);
  rect(-5,height-30,width+10,40);
  
  
  
}
