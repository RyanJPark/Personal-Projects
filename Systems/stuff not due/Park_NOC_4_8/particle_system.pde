class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  //creates a particle system
  int R1,G1,B1;

  ParticleSystem(PVector location, int R4, int G4, int B4) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    //creates the location of the system
    R1=R4;
    G1=G4;
    B1=B4;
    //makes every foutain have differnt colors
  }

  void addParticle() {
    float r = random(0,1);
    if (r<.5){
      particles.add(new Particle(origin, R1,G1,B1));
    }else{
      particles.add(new Square(origin, R1,G1,B1) );
    }
    //adds a new particle every time it is called
    //particles.add(new Particle(origin, R1,G1,B1));
  }

  void run() {//checks if every particle should be dead and removed
    Iterator <Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}
