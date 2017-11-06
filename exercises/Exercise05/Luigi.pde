class Luigi {
  float tx = random(0, 100);
  float ty = random(0, 100);
  float x;
  float y;
  float n = random(0, 100);
  PImage img;
  float xoff = 0.06;
  float xincrement = 0.07; 
  float speed;

  int maxImages = 10; // Total # of images
  int imageIndex = 0; 
  PImage[] images = new PImage[4];



  //images[4] = loadImage("porcupine.jpg");

  void setup() {

    images[0] = loadImage("luigi.png");
    images[1] = loadImage("mario.gif");
    images[2] = loadImage("peach.gif");
    images[3] = loadImage("Shaq.jpg");

    String[]{ filenames = ("luigi.png", "mario.gif", "peach.gif", "Shaq.jpg") {
      for (int i = 0; i < filenames.length; i++) {
        images[i] = loadImage(filenames[i]);
      }
    }

    Luigi() {
    }
    void display() {


      image(images[imageIndex], 0, 0);


      x = width * noise(tx);
      y = height-90 * noise(ty);
      n = noise(xoff)*width;
      xoff += xincrement;
      imageMode(CENTER);
      image(images[imageIndex], n, y, 120, 100);
      ty += 0.10;
      n += 0.300;
    }
    void mousePressed() {
      imageIndex = int(random(images.length));
    }
  }