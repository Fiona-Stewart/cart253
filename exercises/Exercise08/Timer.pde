
// TIMMER BORROWED FROM TEXTBOOK.
// Daniel Shiffman,Learning Processing Algorithms Lesson 5: Putting It All Together

class Timer {
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  // Start
  void start() {
    savedTime = millis();
  }
  boolean isFinished() {
    //  time passeded
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}   