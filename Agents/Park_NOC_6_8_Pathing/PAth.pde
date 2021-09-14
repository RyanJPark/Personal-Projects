class Path {
  PVector start;
  PVector end;
  float radius;

  Path() {
    radius = 20;
    start = new PVector(0,random(height) );
    end = new PVector(width,random(height) );
  }

  void display() {
    strokeWeight(radius*2);
    stroke(150,100);
    line(start.x,start.y,end.x,end.y);
    strokeWeight(1);
    stroke(0);
    line(start.x,start.y,end.x,end.y);
  }
}//creates and displays a random path
