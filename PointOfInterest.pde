class PointOfInterest{
  int x, y;
  PointOfInterest(int x, int y){
    this.x = x;
    this.y=y;
  }
  
  void run(){//for debugging purposes only
    fill(0,255,0);
    circle(x,y,10);
  }

}
