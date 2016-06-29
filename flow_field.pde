import java.util.Iterator;

boolean debug = true;

FlowField flow;
VehicleSystem vs;

void setup() {
  fullScreen(FX2D);
  smooth(8);
  background(#2F2933);
  flow = new FlowField(10);
  vs = new VehicleSystem();
  frameRate(1000);
  blendMode(BLEND);
}

void draw() {
  vs.run(flow);  
}

void mousePressed() {
   noLoop();
   saveFrame();
}