
class Text {
  
  PFont f;
    
  void display() {
  
    printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
}

  void draw () {
    
    textAlign(LEFT);
    drawType (width * 0.25);
  }
  
  void drawType (float x) {
    fill(#E9ED1D);
  text("click to add Ball", 100, 455);
  }
  
}  