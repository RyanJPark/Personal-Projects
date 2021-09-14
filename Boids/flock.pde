class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
    
  }

  void run() {
    
    Iterator <Boid> boidI = boids.iterator();
    while(boidI.hasNext()){
      Boid p = boidI.next();
      p.run(boids);
      if (p.Dead()) boidI.remove();
    }
    
    /*for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
      
    }*/
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}