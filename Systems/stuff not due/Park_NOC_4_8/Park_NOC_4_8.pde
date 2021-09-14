import java.util.Iterator;

ArrayList<ParticleSystem> sys;//creates an arrayList of particle systems called sys

void setup() {
  size(2000,1000);
  smooth();
  frameRate(50);
  sys = new ArrayList<ParticleSystem>();
  //set basic setup stuff, created an arrayList called sys
  
  //ALL = new ParticleTwiceRemoved();
}

void draw() {
  background(175);
  for (ParticleSystem check: sys){
    check.run();
    check.addParticle();
  }       //runs the code, adds particles every draw cycle
}

void mousePressed(){
  sys.add(new ParticleSystem(new PVector(mouseX,mouseY), (int) random(255), (int) random(255), (int) random(255) ));
}//adds a new fountain every time the mouse is pressed
