public class Vis3 implements iVisualizer {
  PVector p = new PVector(0,0);
  PVector d = new PVector(1,1);
  
  public Vis3() {
    init();
  }
  
  public void tick() {
    tiles[int(p.x)][int(p.y)] = 255;
    if (d.x == 1 && (
          p.x == gridSize - 1 ||
          tiles[int(p.x + 1)][int(p.y)] != 0
        )
    ) {
      d = new PVector(0, 1);
    } else if (
      d.x == -1 && (
        p.x == 0 ||
        tiles[int(p.x - 1)][int(p.y)] != 0
      )
    ) {
      d = new PVector(0, -1);
    } else if (d.y == 1 && (
          p.y == gridSize - 1 ||
          tiles[int(p.x)][int(p.y + 1)] != 0
        )
    ) {
      d = new PVector(-1, 0);
    } else if (
      d.y == -1 && (
        p.y == 0 ||
        tiles[int(p.x)][int(p.y - 1)] != 0
      )
    ) {
      d = new PVector(1, 0);
    }
    
    if (p.x == gridCenter && p.y == gridCenter && tiles[gridCenter][gridCenter + 1] != 0) {
      init();
    } else {
      p.add(d);
    }
  }
  
  public void init() {
    p = new PVector(0, 0);
    d = new PVector(1, 0);
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        tiles[x][y] = 0;
      }
    }
  }
  
  public void setActive(boolean active) {}
}
