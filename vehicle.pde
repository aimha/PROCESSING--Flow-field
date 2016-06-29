class Vehicle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float maxSpeed;
  float maxForce;
  float r;
  
  float lifespan;
  
  
  color from;
  color to;
  
  Vehicle() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    maxSpeed = 1;
    maxForce = 0.04;
    
    lifespan = 1000;
    
    //colorMode(HSB,100);
    from = #01A2A6;
    to = #BDF271;
  }
  
  public void run() {
    update();
    //borders();
    display();
  }
    
  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void applyForce (PVector f) {
    PVector force = f.get();
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -=1;
  }
  
  void display() {
    color interA = lerpColor(from, to, lifespan/1000);
    stroke(interA,sin((lifespan/1000)*PI)*5);
    noFill();
    point(location.x,location.y);
  }

  void borders() {
    if (location.x < 0) location.x = width;
    if (location.y < 0) location.y = height;
    if (location.x > width) location.x = 0;
    if (location.y > height) location.y = 0;
  }
  
  boolean isDead() {
    if (lifespan < 0 ) {
      return true;
    } else {
      return false;
    }
  }
}