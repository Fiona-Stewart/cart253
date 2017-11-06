
Ball ball;
Mario mario;
Luigi luigi;
ArrayList<Mario> marios = new ArrayList<Mario>();

void setup() {
  size(650, 650);

  ball = new Ball(width/2, height/2, 0, color(#A01B17));
  mario = new Mario(); 
  luigi = new Luigi();
}

void draw() {
  background(loadImage("landscape1.jpg"));

  ball.display();
  mario.display();
  luigi.display();
}