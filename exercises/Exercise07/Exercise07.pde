
import processing.sound.*;
SoundFile dingdong;

blueDrum blueDrum;
greenDrum greenDrum;
redDrum redDrum;
yellowDrum yellowDrum;


void setup() {  
  size(600, 600);
background(loadImage("DrumAngle.jpg"));
  dingdong = new SoundFile(this, "Bass drum sound effect.mp3");

  blueDrum = new blueDrum (width/1.4, height/4.5, 410, 125, 70);
  greenDrum = new greenDrum(width/1.2, height/2, 470, 300, 80);
  redDrum = new redDrum (width/6, height/7, 75, 100, 70);
  yellowDrum = new yellowDrum (width/2.3 , height/9.5, 250, 60, 70);
}
void draw() {
  

   blueDrum.display(mouseX, mouseY);
  greenDrum.display(mouseX, mouseY);
  redDrum.display(mouseX, mouseY);
  yellowDrum.display(mouseX, mouseY);


  // float volume = map(mouseX, 0, width, 0, 1);
  // song.amp(volume);

  //float speed = map(mouseY, 0, height, 0, 2)
  // song.rate(speed);

  //ellipse( 75, 100, 50, 50);

  //ellipse( 250, 60, 50, 50);

  //ellipse( 410, 125, 50, 50);

  //ellipse( 470, 300, 50, 50);
}