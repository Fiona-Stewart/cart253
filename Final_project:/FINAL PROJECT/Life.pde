

class Life {

  float health = 100;
  float MAX_HEALTH = 100;
  float rectWidth = 200;


  Life() {
  }

  void update() {
  }

  void display() {

    // Change color
    if (health < 25)
    {
      fill(255, 0, 0);
      exit();
    } else if (health < 50)
    {
      fill(255, 200, 0);
       
    } else
    {
      fill(0, 255, 0);
   
  }
  //bar
  noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(100, 100, drawWidth, 15);

  //outline
  stroke(0);
  strokeWeight(5);
  noFill();
  rect(100, 100, rectWidth, 15);
}

//void collide(){

//  if (health > 0 && keyCode == LEFT)
//  {
//    health -= 10;
//  }
//  if (health < 100 && keyCode == RIGHT)
//  {
//    health += 10;
//  }
//}
}  