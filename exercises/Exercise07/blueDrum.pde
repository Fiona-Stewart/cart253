
class blueDrum {
  // Location and size
  float x;
  float y;
  float vx;
  float vy;
  float r;
  // Create the doorbell
  blueDrum(float x_, float y_, float vx_, float vy_, float r_ ) {
    x = x_;
    y = y_;
    r = r_;
    vx = vx_;
    vy = vy_;
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
      fill(#50B0F7);
    } else {
      fill(175);
    }
    stroke(0);
    strokeWeight(4);
    ellipse(x, y, r, r);
  }
}

//ellipse( 410, 125, 50, 50);