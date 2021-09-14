class vcl{
  FF a;
  PVector position, velocity;
  int r,R,G,B;
  vcl(FF a_,int R_,int G_,int B_){
    position = new PVector( random(width)+20, random(height) );
    velocity= new PVector (-1,0);
    a=a_;
    r=7;
    R=R_;
    G=G_;
    B=B_;
  }
  void run(){
    move();
    borders();
    display();
  }//runs the raindrops
  void move(){
    velocity = a.lookup(position);
    position.add(velocity);
  }//moves raindrops according to perlin noise grid
  void borders() {
    if (position.x < -r){ 
      position.x=random(width/2,width);
      position.y=random(height);
    }
    if (position.y < -r) { 
      position.x=random(width/2,width);
      position.y=random(height);
    }
    if (position.y > height+r) { 
      position.x=random(width/2,width);
      position.y=random(height);
    }
  }//randomly spawns raindrops on the left side of the screen if they leave the screen
    void display() {
    fill(R,G,B);
    stroke(0);
    noStroke();
    ellipse(position.x,position.y,r,r);
  }//draws "raindrops"
}
