class Path {
  PVector start;
  PVector end;
  //start and end points
  float radius;
  //size of path
  ArrayList<PVector> points;
  //has all the points in the path

  Path() {
    radius = 20;
    start = new PVector(0,random(height) );
    points=new ArrayList<PVector>();
    //.setting intial values
  }
  
   void addPoint(float x, float y) { 
    PVector point = new PVector(x,y);
    points.add(point);
  }

    void display() {
    stroke(200);
    strokeWeight(radius);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x,v.y);
    }
    endShape();
    //gray area
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
    //sharp line "Path"
  }
}//creates and displays a random path
