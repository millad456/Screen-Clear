int gameState = 2;//state of the game
int density = 20000;//controls the number of grains on screen
ArrayList <Grain> g = new ArrayList();
ArrayList <Bubble> b = new ArrayList();
ArrayList <Particle> p = new ArrayList();
ArrayList <PointOfInterest> poi = new ArrayList();
int size = 5, tries = 15;//how many tries you have left
PFont f;
int textShiftx, textShifty;//changes the placement of the text
boolean win = false;

void setup() {
  size (1280, 720);
  background(255);
  reset();
  f = createFont("Arial",64,true);
  textFont(f,130);
}

void draw() {
  if (gameState == 2) {//main game run
    background(255);
    fill(127);
    text("STREAKS", 40 + textShiftx,110 + textShifty);//draws the message in a random place
    
    
    for (int i = 0; i < g.size(); i++) g.get(i).run();//display all grains
    //for (int i = 0; i < poi.size(); i++) poi.get(i).run();//show where all the POI's are
    for (int i = 0; i < b.size(); i++){
      b.get(i).run();//display all bubbles
      if(b.get(i).maxSize - b.get(i).radius < 0.0001 && b.get(i).type == 1)b.remove(i);
    }
    for (int i = 0; i < p.size(); i++) {
      p.get(i).run();
      if (p.get(i).frame == 0) p.remove(i);//remove all dead particles
    }
    
    //win state
    if(poi.size() == 0){
      win = true;
      b.add(new Bubble(390 + textShiftx, 60 + textShifty, 2));
      
    }
    
  }
  if (gameState == 3){
    background(255);
    fill(255,0,0);
    text("Game Over Big Boi",40,110);
  }
}

void mousePressed() {
  if (mouseButton == RIGHT && b.size() == 0) reset();//reset screen if right click
  else if (mouseButton == LEFT && tries >0 && !win){
    b.add(new Bubble(mouseX, mouseY));//add a new bubble if there are less than 13 on screen, subtract from your try total
    tries --;
    println("You have " + tries + " attempts left.");
  }else if (mouseButton == LEFT && tries == 0 && !win) gameState = 3;
}

void reset() {//responsible for setting up the game
  //display startup messages
  println("Can you find the hidden streaks message within 15 tries???");
  println("Press the right mouse button to reset");
  tries = 15;
  win = false;
  
  //generates random text position
  textShiftx = (int)random(600);
  textShifty = (int)random(600);

  for (int i = 0; i < g.size(); i++)g.remove(i);//remove all grains
  for (int i = 0; i < b.size(); i++)b.remove(i);//remove all bubbles
  for (int i = 0; i < p.size(); i++)p.remove(i);//remove all particles
  for (int i = 0; i < poi.size(); i++)poi.remove(i);//remove all POIs      //look. idk why I need to do this 4 times for it to work, but it really do be like that sometimes
  for (int i = 0; i < poi.size(); i++)poi.remove(i);//remove all POIs
  for (int i = 0; i < poi.size(); i++)poi.remove(i);//remove all POIs
  for (int i = 0; i < poi.size(); i++)poi.remove(i);//remove all POIs
  for (int i = 0; i < density; i++) {
    if (i <= density/4) {
      g.add(new Grain((int)random(width), (int)random(height), 127+(int)random(127)));//the first quarter of all grains are in greyscale
    } else {
      g.add(new Grain((int)random(width), (int)random(height), (int)random(155), (int)random(155)));//the rest are coloured
    }
  }
  
  
  for(int i = 0; i < 7; i++){//create new points of interests based on where the streaks message is
      poi.add(new PointOfInterest(50+textShiftx + i*95, 100+textShifty));
      poi.add(new PointOfInterest(50+textShiftx + i*95,30+textShifty));
    }
  
  gameState = 2;
}
