class Vehicle {
  PVector location, velocity, acceleration, result,local, noise;
  float radius,maxSpeed,maxForce,lifespan,r,x,y,z,lon,lat,r1,r2;
  color from;
  color to;
  
  Vehicle() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    maxSpeed = 1;
    maxForce = 0.01;
    
    lifespan = 1000;
    
    //colorMode(HSB,100);
    from = #04756F;
    to = #FF8C00;
    
    radius = 300;
  }
  
  public void run() {
    update();
    borders();
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
 
  float supershape(float theta, float m, float n1, float n2, float n3) {
    float t1 = abs((1/a)*cos(m * theta / 4));
    t1 = pow(t1, n2);
    float t2 = abs((1/b)*sin(m * theta/4));
    t2 = pow(t2, n3);
    float t3 = t1 + t2;
    float r = pow(t3, - 1 / n1);
    return r;
  }
  
  
 void display() {
   
    local = location.copy();
    lon = map(local.x,0,width,0,TWO_PI);
    lat = map(local.y,0,height,-PI,PI);
    r1 = supershape(lon, m, n1, n2, n3);
    r2 = supershape(lat, m, n1, n2, n3);
    x = radius * r1 * sin(lat)*cos(lon);
    y = radius * r1 * sin(lat)*sin(lon);
    z = radius * r2 * cos(lat);
    result = new PVector(x,y,z);
    
    color interA = lerpColor(to, from, map(result.x,-300,300,0,1));
    stroke(interA,sin((lifespan/1000)*PI)*5); //sin((lifespan/1000)*PI)*5
    noFill();
    
    point(result.x,result.y,result.z);
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