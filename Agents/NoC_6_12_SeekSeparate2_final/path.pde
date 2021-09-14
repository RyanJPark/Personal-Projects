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
    //setting intial values
  }
  
   void addPoint(float x, float y) { 
    PVector point = new PVector(x,y);
    
    points.add(point);
  }//adds a turn/point to the path

    void display() {//displays the path
    stroke(200,50);
    strokeWeight(radius);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x,v.y);
    }
    endShape();
    //gray area
  }
}//creates and displays a random path
