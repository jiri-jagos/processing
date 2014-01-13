/**
 * FFT tiled visualizer
 */
public class Vis5 implements iVisualizer, AudioListener {
  boolean active = false;
  FFT fft;
  
  public Vis5(AudioPlayer player) {
    init();
    fft = new FFT(player.bufferSize(), player.sampleRate());
    fft.logAverages(bandsCount, 1);
  }
  
  public void tick() {}
  
  public void init() {
    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        tiles[x][y] = 0;
      }
    }
  }
  
  void samples(float[] samples) {
    samples(samples, samples);
  }
  
  void samples(float[] sampleLeft, float[] sampleRight) {
    if (active) {
      fft.forward(sampleLeft);
      
      for (int x = 0; x < gridSize; x++) {
        float val = fft.getAvg(x) / (gridCenter * sampleFactor);
        for (int y = 0; y < gridSize; y++) {
          if (val > y) {
            tiles[x][gridSize - 1 - y] = 255;
          } else {
            tiles[x][gridSize - 1 - y] -= tiles[x][gridSize - 1 - y] / gridCenter;
          }
        }
      }
    }
  }
  
  public void setActive(boolean active) {
    this.active = active;
  }
} 
