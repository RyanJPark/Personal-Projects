class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  //creates a particle system

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    //creates the location of the system
  }

  void addParticle() {
    particles.add(new Particle(origin));
    //adds a new particle every time it is called
  }

  void run() {//checks if every particle should be dead and removed and runs them
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
