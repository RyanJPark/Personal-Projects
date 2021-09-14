ParticleSystem ps;

void setup() {
  size(1280,800);
  smooth();
  ps = new ParticleSystem(new PVector(width/2,height/2));
  import java.util.Iterator;
}

void draw() {
  background(255);
  ps.addParticle();
  ps.run();
}
