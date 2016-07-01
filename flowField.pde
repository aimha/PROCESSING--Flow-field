class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution;
  
  FlowField(int r_) {
    resolution= r_;
    cols = width/resolution;
    rows = height/ resolution;
    field = new PVector[cols][rows];
    init();
  }
  
  void init() {
    noiseSeed((int)random(10000));
    noiseDetail(8,0.75);
    float xoff =0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j=0;j<rows; j++) {
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.03;
      }
    xoff += 0.03;
    }
  }
  
  PVector lookup(PVector l_) {
    int column = int(constrain(l_.x/resolution,0,cols-1));
    int row = int(constrain(l_.y/resolution,0,rows-1));
    return field[column][row].get();
  }
  
  
}