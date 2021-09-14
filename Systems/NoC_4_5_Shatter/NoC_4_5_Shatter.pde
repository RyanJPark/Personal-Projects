//DCR: header?
//DCR: 58/60
import java.util.Iterator;//so we can use the iterator
ArrayList <Basic> fragments;

void setup(){
  fragments = new ArrayList <Basic>();
  background(255);
  size(1280,800);
  smooth();
  fill(0);
  stroke(0);
  strokeWeight(0);
  beginShape();
  vertex(width/4,height/4);
  vertex((3*width)/5, height/4);
  vertex((3*width)/5, (3*height)/5);
  vertex(width/4,(3*height)/5);
  endShape();
  //orgional shape drawn
  
  for (int x= width/4 ; x< (3*width)/5; x=x+5){
    for (int y= height/4 ; y< (3*height)/5; y=y+5){
      PVector fragL = new PVector (x,y);
      fragments.add(new Basic (fragL));
    }
  }//makes an array of basics for the shape
  
  
}

void draw(){  
  background(255);
  Iterator <Basic> d = fragments.iterator();
  while (d.hasNext() ){
    Basic n = d.next();
    n.run();
  }

  
  if( keyPressed == true && key == CODED){
    fragments = new ArrayList <Basic>();
  background(255);
  size(1280,800);
  smooth();
  fill(0);
  stroke(0);
  strokeWeight(0);
  beginShape();
  vertex(width/4,height/4);
  vertex((3*width)/5, height/4);
  vertex((3*width)/5, (3*height)/5);
  vertex(width/4,(3*height)/5);
  endShape();
  //orgional shape drawn
  
  for (int x= width/4 ; x< (3*width)/5; x=x+5){
    for (int y= height/4 ; y< (3*height)/5; y=y+5){
      PVector fragL = new PVector (x,y);
      fragments.add(new Basic (fragL));
    }
  }
  }
}
