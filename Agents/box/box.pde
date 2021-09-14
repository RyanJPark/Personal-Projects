import shiffman.box2d.*;


Box2DProcessing box2d;

void setup(){
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
}

void draw(){
  box2d.step();
}

class Box{
  Box2DProcessing body;
  int w;
  int h;
  Box() {
    w = 16;
    h = 16;

    // Build body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX,mouseY));
    body = box2d.createBody(bd);

    // Build shape.
    PolygonShape ps = new PolygonShape();
    //[full] Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    //[end]
    ps.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    // Set physics parameters.
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Attach the Shape to the Body with the Fixture.
    body.createFixture(fd);
 }
}
