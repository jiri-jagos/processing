import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

iVisualizer vis;
iVisualizer[] visualizers;
Minim minim;
AudioPlayer player;
FFT fft;

int bandsCount = 11;

void setup() {
  size(600, 300);
  
  minim = new Minim(this);
  
//  player = minim.loadFile("01-dun_an_doras-the_lowlands_of_holland-piad.mp3", 256);
  player = minim.loadFile("01. Rabovali Turci.mp3", 512);
  
  visualizers = new iVisualizer[] {
    new Vis2(),
    new Vis1()
  };
  
  vis = visualizers[0];
  vis.setActive(true);
  Thread t = new Thread() {
    public void run() {
      for(;;) {
        vis.tick();
        delay(125);
      }
    }
  };
  t.start();
  
  Thread t0 = new Thread() {
    public int visIndex = 0;
    
    public void run() {
      for(;;) {
        vis.setActive(false);
        if (visIndex == visualizers.length) visIndex = 0;
        vis = visualizers[visIndex];
        vis.init();
        vis.setActive(true);
        visIndex++;
        delay(1000);
      }
    }
  };
  t0.start();
  
  fft = new FFT(player.bufferSize(), player.sampleRate());
  fft.logAverages(11, 1);
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i + 1, 0, player.bufferSize(), 0, width);
    
    line (x1, 75 + player.mix.get(i) * 75, x2, 75 + player.mix.get(i + 1) * 75);
  }
  
  noStroke();
  fill(255, 255, 0);
  fft.forward(player.mix);
  float step = width / bandsCount;
  for (int i = 0; i < bandsCount; i++) {
    float value = fft.getAvg(i) * 3;
    rect(step * i, height - value, step, value);
  }
  
  float w = 300 / vis.gridSize;
  for (int x = 0; x < vis.gridSize; x++) {
    for (int y = 0; y < vis.gridSize; y++) {
      stroke(255);
      
      float tileValue = vis.tiles[x][y]; 
      
      fill(tileValue, 0, 0);
      if (tileValue > 32) {
        vis.tiles[x][y] -= (tileValue - 32) / 25;
      }
      rect(w * x, w * y, w, w);
    }
  }
  
}

void mousePressed() {
  if (player.isPlaying()) {
    player.pause();
  } else {
    player.loop();
  }
}
