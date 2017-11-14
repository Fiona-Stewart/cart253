
import processing.sound.*;
SoundFile dingdong;
SoundFile dingdong2;
SoundFile dingdong3;
SoundFile dingdong4;

blueDrum blueDrum;
greenDrum greenDrum;
redDrum redDrum;
yellowDrum yellowDrum;

PFont f;

void setup() {  
  size(600, 600);
  f = createFont("Arial", 56);
  background(loadImage("DrumAngle.jpg"));
  dingdong = new SoundFile(this, "Bass drum sound effect.mp3");
  dingdong2 = new SoundFile(this, "SpongeBob Ocean Man Cover.mp3");
  dingdong3 = new SoundFile(this, "Mii channel music but its on fire.mp3");
  dingdong4 = new SoundFile(this, "doodledoot2 1.mp3");

  blueDrum = new blueDrum (width/1.4, height/4.5, 410, 125, 70);
  greenDrum = new greenDrum(width/1.2, height/2, 470, 300, 80);
  redDrum = new redDrum (width/6, height/7, 75, 100, 70);
  yellowDrum = new yellowDrum (width/2.3, height/9.5, 250, 60, 70);
}
void draw() {

  textFont(f, 20);
  fill(0);
  textAlign(DOWN);
  text ("Not so functional\nfunctioning drum set.", 10, 250);
  blueDrum.display(mouseX, mouseY);
  greenDrum.display(mouseX, mouseY);
  redDrum.display(mouseX, mouseY);
  yellowDrum.display(mouseX, mouseY);
}
void mousePressed() {
  // If the user clicks on the doorbell, play the sound!
  if (blueDrum.contains(mouseX, mouseY)) {
    dingdong.play();
  }
  if (yellowDrum.contains(mouseX, mouseY)) {
    dingdong2.play();
  }
  if (redDrum.contains(mouseX, mouseY)) {
    dingdong3.play();
  }
  if (greenDrum.contains(mouseX, mouseY)) {
    dingdong4.play();
  }
}