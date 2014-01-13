interface iVisualizer {
  public int gridSize = 8;
  int gridCenter = round(gridSize / 2);
  int sampleFactor = gridCenter + 1;
  int bandsCount = 11;

  public int[][] tiles = new int[gridSize][gridSize];
  
  public void init();
  public void tick();
  public void setActive(boolean active);
}
