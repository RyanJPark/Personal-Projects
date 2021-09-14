class vcl{
  FF a;
  PVector position, velocity;
  int r;
  vcl(FF a_){
    position = new PVector( random(width), random(width) );
    velocity= new PVector (-5,0);
    a=a_;
    r=10;
  }
  void run(){
    move();
    borders();
    display();
  }
  void move(){
    velocity = a.lookup(position);
    position.add(velocity);
  }
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
    void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    noStroke();
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
}
