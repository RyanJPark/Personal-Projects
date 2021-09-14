
int total = 1250;
ArrayList <Swimmer> swimmerslist = new ArrayList<Swimmer>();
PVector perlinTarget;
float px,py,delta;

void setup() {
  size(2000,1500);//sets the size of the canvas
  smooth();//makes the graphics of the program smoother than normal
  for (int i = 0; i < total; i++) {
    swimmerslist.add(new Swimmer()); //creates a new mover for every integer below the length of the Mover array
  }
  frameRate(200);
  px=random(10000);
  py=random(10000);
  delta=.01;
  
}

void draw() {
  perlinTarget = new PVector( map(noise(px), 0,1,100,width-100), map(noise(py), 0,1,100,height-100) );
  
  if( pow(random(0,1),2) < random(0,1) ){
    perlinTarget.add( new PVector(mouseX,mouseY).sub(perlinTarget).normalize().mult(2) );
  }
  
  
  //fill(255,100);
  //rect(0,0,width,height);;//redraws the background every time
  background(255);

  for (Swimmer p : swimmerslist) {
    if(mousePressed){ 
      p.seek(new PVector (mouseX,mouseY) );
    }else  p.seek(perlinTarget);
     p.run(swimmerslist);
    //moves and draws the mover
  }
  px+=delta;
  py+=delta;
  

  
  
  
  if(mousePressed){ 
      fill(0,255,0);
      ellipse(mouseX,mouseY,10,10);
    }else{
      fill(255,0,0);
      ellipse(perlinTarget.x,perlinTarget.y,10,10);
      fill(0,255,0);
      ellipse(mouseX,mouseY,10,10);
    }
      
  
}
