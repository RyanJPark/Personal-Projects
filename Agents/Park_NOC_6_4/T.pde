class Target{
  PVector loc;
  float stepSize,pnx,pny,stepx,stepy,maxStep;
  
  Target(){
    loc = new PVector(random(0,width),random(0,height));
    pnx=20;
    pny=1300;
    maxStep=5;
  }
  void run(){
    move();
    display();
  }
  
  void move(){
    stepx=map(noise(pnx),0,1,-maxStep,maxStep);
    stepy=map(noise(pny),0,1,-maxStep,maxStep);
    loc.x= constrain(loc.x+stepx,0, displayWidth);
    loc.y= constrain(loc.y+stepy,0,displayHeight);
    pnx+=.01;
    pny+=.01;
    if (mousePressed) loc=new PVector (mouseX,mouseY);
  }
  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(loc.x,loc.y,30,30);
    fill(255);
    ellipse(loc.x,loc.y,20,20);
    fill(255,0,0);
    ellipse(loc.x,loc.y,10,10);
    fill(255);
    ellipse(loc.x,loc.y,5,5);
  }
}
