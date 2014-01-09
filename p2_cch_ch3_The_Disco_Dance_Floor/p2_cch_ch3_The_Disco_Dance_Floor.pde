import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

iVisualizer vis1;
Minim minim;
AudioPlayer player;
FFT fft;

int bandsCount = 4;

void setup() {
  size(600, 300);
  
  minim = new Minim(this);
  
//  player = minim.loadFile("01-dun_an_doras-the_lowlands_of_holland-piad.mp3", 256);
  player = minim.loadFile("01. Rabovali Turci.mp3");
  
  vis1 = new Vis1();
  vis1.setActive(true);
  Thread t = new Thread() {
    public void run() {
      for(;;) {
        vis1.tick();
        delay(125);
      }
    }
  };
  t.start();
  
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
  
  float w = 300 / vis1.gridSize;
  for (int x = 0; x < vis1.gridSize; x++) {
    for (int y = 0; y < vis1.gridSize; y++) {
      stroke(255);
      
      float tileValue = vis1.tiles[x][y]; 
      
      fill(tileValue, 0, 0);
      if (tileValue > 32) {
        vis1.tiles[x][y] -= (tileValue - 32) / 25;
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
