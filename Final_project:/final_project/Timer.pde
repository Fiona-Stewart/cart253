
// TIMMER BORROWED FROM TEXTBOOK.
// Daniel Shiffman,Learning Processing Algorithms Lesson 5: Putting It All Together

class Timer {
  //PFont f;
  //int savedTime; // When Timer started
  //int totalTime; // How long Timer should last

  //Timer(int tempTotalTime) {
  //  totalTime = tempTotalTime;
  //}
  //void display() {

  //  printArray(PFont.list());
  //  f = createFont("SourceCodePro-Regular.ttf", 24);
  //  textFont(f);
  //}
  //// Start
  //void start() {
  //  savedTime = millis();
  //}
  //boolean isFinished() {
  //  //  time passeded
  //  int passedTime = millis()- savedTime;
  //  if (passedTime > totalTime) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}

  int startTime = 0, stopTime = 0;
  boolean running = false; 
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    } else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
  int hour() {
    return (getElapsedTime() / (1000*60*60)) % 24;
  }

  void draw() {
    fill(0);
    
    textAlign(CENTER);
    text(nf(timer.hour(), 2)+":"+nf(timer.minute(), 2)+":"+nf(timer.second(), 2), 150, 175);
  }
}