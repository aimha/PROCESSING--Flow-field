class VehicleSystem {
  ArrayList<Vehicle> vehicles;
  
  VehicleSystem ( ) {
    vehicles = new ArrayList();
  }
  
  void run(FlowField ff_) {
    vehicles.add(new Vehicle());
    Iterator<Vehicle> it = vehicles.iterator();
    while (it.hasNext()) {
      Vehicle v = it.next();
      v.follow(ff_);
      v.run();
      if (v.isDead()) {
        it.remove();
      }
    }
  }
  
}