


class Ball {

  float x;
  float n;
  float y;
  float time = 0.0;
  float increment = 0.01;
  float theta = 0;
  color fillColor;
  color defaultColor;
  PImage img;
  PImage img2;


  Ball(float tempX, float tempY, float tempN, color tempDefaultColor) {
    x = tempX;
    y = tempY;
    tempN = 0;
    defaultColor = tempDefaultColor;
    fillColor = defaultColor;
  }

  void display() {
    img = loadImage("chainchomp.png");
    float x = map(sin(theta), -1, 1, 0, 650);
    theta += 0.05;
    float n = noise(time) * width;
    imageMode(CENTER);
    fill(fillColor);
    line( width/2, 0, x, height/2);
    line( width/2, 0, x, height/2);
    image(img, x, height/2, n, n);

    time += increment;
  }
}