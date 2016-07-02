import java.util.Iterator;

boolean debug = true;

FlowField flow;
VehicleSystem vs;

import peasy.*;
PeasyCam cam;

float m, a, b, n1, n2, n3;

void setup() {
  fullScreen(P3D);
  smooth(8);
  background(#170413);
  flow = new FlowField(10);
  vs = new VehicleSystem();
  frameRate(500);
  
  cam = new PeasyCam(this, 0, 0, 0, 700);
  cam.rotateY(map(random(100),0,100,0,TWO_PI));
  
  m = 5.7;
  n1 = 0.5;
  n2 = 1;
  n3 = 2.5;
  a = 1;
  b = 1;
  
}

void draw() {
  //background(#170413);

  vs.run(flow);
}

void mousePressed() {
    background(#170413);
    flow = new FlowField(10);
    cam.rotateY(map(random(100),0,100,0,TWO_PI));
}