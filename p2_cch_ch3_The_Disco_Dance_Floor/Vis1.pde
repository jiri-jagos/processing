public class Vis1 implements iVisualizer {
  int p = 1;
  int count = 0;
  
  public Vis1() {
    init();
  }
  
  public void init() {
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        tiles[x][y] = 0;
      }
    }
  }
  
  public void tick() {
    count++;
    if (count < gridCenter) {
      return;
    }
    
    count = 0;
    if (p == 1) {
      p = 0;
    } else {
      p = 1;
    }
    
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        tiles[x][y] = 255 * ((x + y + p) % 2);
      }
    }
  }
  
  public void setActive(boolean active) {}
}
