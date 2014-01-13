public class Vis2 implements iVisualizer {
  int px = 0;
  private int count = 0;
  
  public Vis2() {
    init();
  }
  
  public void tick() {
    count++;
    if (count < gridCenter) return;
    
    count = 0;
    for (int i = 0; i < gridSize; i++) {
      tiles[min((gridSize - 1), px)][i] = 255;
    }
    
    if (px >= gridSize && tiles[gridSize - 1][gridSize - 1] != 0) {
      init();
    } else {
      px += 1;
    }
  }
  
  public void init() {
    px = 0;
   
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        tiles[x][y] = 0;
      }
    }
  }  

  public void setActive(boolean active) {}  
}
