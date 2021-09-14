//DCR: Needs header
//DCR: 29/30
ParticleSystem ps;//creates the particle system

void setup() {
  size(1280,800);
  smooth();
  //basic setup stuff
  ps = new ParticleSystem(new PVector(width/2,height/2));
  import java.util.Iterator; //needed to run the arraylist function iterator
}

void draw() {
  background(255);
  ps.addParticle();
  ps.run();
  //runs the code, adds particles every draw cycle
}
