
import processing.sound.*;
SoundFile dingdong;

blueDrum blueDrum;
greenDrum greenDrum;
redDrum redDrum;
yellowDrum yellowDrum;


void setup() {  
  size(600, 600);

  dingdong = new SoundFile(this, "Bass drum sound effect.mp3");

  blueDrum = new blueDrum ( 410, 125, 50, 50);
  greenDrum = new reenDrum ( 470, 300, 50, 50);
  redDrum = new redDrum ( 75, 100, 50, 50);
  yellowDrum = new yellowDrum ( 250, 60, 50, 50);
}
void draw() {
  background(loadImage("DrumAngle.jpg"));

  blueDrum.display();
  greenDrum.display();
  redDrum.display();
  yellowDrum.display();


  // float volume = map(mouseX, 0, width, 0, 1);
  // song.amp(volume);

  //float speed = map(mouseY, 0, height, 0, 2)
  // song.rate(speed);

  //ellipse( 75, 100, 50, 50);

  //ellipse( 250, 60, 50, 50);

  //ellipse( 410, 125, 50, 50);

  //ellipse( 470, 300, 50, 50);
}