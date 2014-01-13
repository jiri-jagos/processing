/**
 * tiled oscilloscope
 */

public class Vis4 implements iVisualizer, AudioListener {
  boolean active = false;
  
  public Vis4() {
    init();
  }
  
  public void tick() {}
  
  public void init() {
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        tiles[x][y] = 0;
      }
    }
  }
  
  void samples(float[] sample) {
    samples(sample, sample);
  }
  
  void samples(float[] sampleLeft, float[] sampleRight) {
    if (active) {
      
      for (int x = 0; x < gridSize; x++) {
        float val = 0;
        
        for (int i = 0; i < sampleFactor; i++) {
          val = sampleLeft[x * sampleFactor + i] * gridSize;
        }
        
        for (int y = (-1 * gridCenter); y < gridCenter; y++) {
          if (val > y && val < (y + 1)) {
            tiles[x][y + gridCenter] = 255;
          } else {
            tiles[x][y + gridCenter] -= tiles[x][y + gridCenter] / gridCenter;
          }
        }
      }
    }
  }
  
  public void setActive(boolean active) {
    this.active = active;
  }
}
