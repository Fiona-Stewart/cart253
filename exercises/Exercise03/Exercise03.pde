
// telling the computer about the bouncer variables created
color backgroundColor = color(200,150,150);
//CHANGED ADDED new boucers
Bouncer bouncer;
Bouncer bouncer2;
Bouncer bouncer3;
Bouncer bouncer4;

Square square;

// initial set up
void setup() {
  size(840,680);
  background(backgroundColor);
  
  // set the bouncer colour, width, height, and where they will begin and initially go
  // CHANGED i didnt like how the bouncers were slightly soft around the edges and wanted a stronger colour so 
  // I discovered that by imputing a colour code instead of in numbers it would remove that
  //also ADDED new boucer
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(#A01B17),color(#E8332C));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(#1222C6),color(#1A7FFF));
  bouncer3 = new Bouncer(width/2,height/2,3,2,50,color(#910EC6),color(#D096F7));
  bouncer4 = new Bouncer(width/2,height/2,-5,2,50,color(#2B830F),color(#4DEA1A));
  
  square = new Square();
}

// this allows the bouncers to be a "thing" thus creating them as objects in the program
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer3.update();
  bouncer4.update();
  bouncer.draw();
  bouncer2.draw(); 
  bouncer3.draw(); 
  bouncer4.draw(); 
  
  square.draw();
  
}