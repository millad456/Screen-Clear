class Bubble{
  int frame = 0, maxSize = 150, type = 1;
  float x, y, radius = 1;
  
  //constructor overload 
  Bubble(int x, int y){
    this.x = x;
    this.y = y;
  }
  Bubble(int x, int y, int type){
    this.x = x;
    this.y = y;
    this.type = type;
  }
  
  void run(){
    fill(255);
    noStroke();
    //circle(x,y,radius);//draws a circle
    
    if(radius < maxSize && type == 1){//increases radius using the easing equation for regular bubbles
      float targetX = maxSize;
      float dx = targetX - radius;
      radius += dx * 0.1;
    }else{//if win bubble
      if (radius < 2000)radius = radius*1.2;
    }
    removeGrain();
    removePOI();
  }
  
  void removeGrain(){//this function checks every grain if it is within the expanding circle, then 
    for (int i = 0; i < g.size(); i++){
      if(sqrt(((g.get(i).x-x)*(g.get(i).x-x)) + ((g.get(i).y-y)*(g.get(i).y-y))) < radius/2){
        if(type == 1)for(int j = 0; j < 3; j++)p.add(new Particle(g.get(i).x, g.get(i).y, g.get(i).r, g.get(i).b, g.get(i).shade));//create 3 particles the same colour as the grain
        else{
          int maybe = (int) random(4);
          if (maybe != 1) p.add(new Particle(g.get(i).x, g.get(i).y, g.get(i).r, g.get(i).b, g.get(i).shade));//in the case of the end screen, only some grains turn into particles
        }
        g.remove(i);//remove grain
      }
    }
  }
  void removePOI(){//this function is the same as removeGrain but for POI's
    for (int i = 0; i < poi.size(); i++){
      if(sqrt(((poi.get(i).x-x)*(poi.get(i).x-x)) + ((poi.get(i).y-y)*(poi.get(i).y-y))) < radius/2){
        poi.remove(i);//remove grain
      }
    }
  }
}
