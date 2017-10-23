// Griddies
// by Pippin Barr
// MODIFIED BY: 
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int[] xpos = new int[80];
int[] ypos = new int[80];

int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[1];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }


  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}
// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(#4D5050);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // the letter j is equal to the meaning/importance of i
      if (j != i) {
        // QUESTION: What does this line check?
        // checks if the griddies collide
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }

  for (int i = 0; i < xpos.length - 1; i++) {
    xpos[i] = xpos[i + 1];
    ypos[i] = ypos[i + 1];
  }
  // New location
  xpos[xpos.length - 1] = mouseX;
  ypos[ypos.length - 1] = mouseY;
  // Draw everything
  for (int i = 0; i < xpos.length; i++) {
    noStroke();
    fill(255 - i*3.5);
    ellipse(xpos[i], ypos[i], i, i);

    fill(mouseX, 0, mouseY);
    ellipse(mouseX-19, mouseY-5, 16, 32);
    ellipse(mouseX+19, mouseY-5, 16, 32);
  }
}
void mousePressed() {
  // A new ball object
  Griddie b = new Griddie(mouseX, mouseY, 20);
  // Append to array
  griddies = (Griddie[]) append(griddies, b);
}