void applyForce(PVector force) {
  PVector f = PVector.div(force,mass);
  acceleration.add(f);
}
