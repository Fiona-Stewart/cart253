
//import processing.sound.*;
//SoundFile drumming;
  //drumming = new SoundFile(this, "Bass drum sound effect.mp3");
  //red = new Red(width/2, height/2, 64);

 class redDrum {
  // Location and size
  float x;
  float y;
  float r;
  // Create the doorbell
  redDrum(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
  }
  // Is a point inside the doorbell? (used for mouse rollover, etc.)
  boolean contains(float mx, float my) {
    if (dist(mx, my, x, y) < r) {
      return true;
    } else {
      return false;
    }
  }
  // Show the doorbell (hardcoded colors, could be improved)
  void display(float mx, float my) {
    if (contains(mx, my)) {
      fill(100);
    } else {
      fill(175);
    }
    stroke(0);
    strokeWeight(4);
    ellipse(x, y, r, r);
  }
}

 
// ellipse( 75, 100, 50, 50);
    