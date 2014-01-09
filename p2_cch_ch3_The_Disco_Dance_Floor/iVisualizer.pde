interface iVisualizer {
  public int gridSize = 4;
  public int[][] tiles = new int[gridSize][gridSize];
  
  public void init();
  public void tick();
  public void setActive(boolean active);
}
