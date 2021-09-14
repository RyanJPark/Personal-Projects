//DCR: header?
//DCR: Nice color changes. 29/30.
import java.util.Iterator;
ArrayList<ParticleSystem> sys;//creates an arrayList of particle systems called sys

void setup() {
  size(2000,1280);
  smooth();
  sys = new ArrayList<ParticleSystem>();
  //set basic setup stuff, created an arrayList called sys
  
}

void draw() {
  background(255);
  for (ParticleSystem check: sys){
    check.run();
    check.addParticle();
  }       //runs the code, adds particles every draw cycle
}

void mousePressed(){
  sys.add(new ParticleSystem(new PVector(mouseX,mouseY), (int) random(255), (int) random(255), (int) random(255) ));
}//adds a new fountain every time the mouse is pressed
