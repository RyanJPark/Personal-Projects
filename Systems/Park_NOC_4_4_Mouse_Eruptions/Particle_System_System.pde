/*
import java.util.Iterator;

class ParticleTwiceRemoved{
  ArrayList <ParticleSystem> allTheParticles;
  PVector fountainpos;
  ParticleTwiceRemoved(){
    allTheParticles = new ArrayList <ParticleSystem>();
  }
  void addFountain(PVector FountainPosition){
    if (mousePressed){
      fountainpos=FountainPosition.get();
      allTheParticles.add(new ParticleSystem(fountainpos));
    }
    
  }
  
  void run() {
    Iterator <ParticleSystem> its = ParticleSystem.iterator;
    while (its.hasNext()) {
      ParticleSystem p = its.next();
      p.run();
    }
  }
  
}
*/
