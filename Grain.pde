class Grain{
  int r, b, shade = -1, size = (int)random(3,8);//random size
  float x, y;
  Grain(int x, int y, int shade){//if grey block then it takes an x, y and shape
    this.x = x;
    this.y = y;
    this.shade = shade;
  }
  
  Grain(int x, int y, int r, int b){//else it gets an x, y, red, and blue value
    this.x = x;
    this.y = y;
    this.r = r + x/12;
    this.b = b + y/7;
  }
  //I made this a function in case I wanted to add any other features to the grain
  void run(){
    display();
  
  }
 
  void display(){//display the grain
    //the colour of the rectangle is determined by if shade has a value
    noStroke();
    if(shade == -1) fill(r,0,b);
    else fill(shade);
    
    rect(x-size/2,y-size/2,2*size,2*size);
  }
}
