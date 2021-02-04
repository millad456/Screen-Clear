class Particle {
  PVector pos;
  PVector vel;
  int frame = 60, r, b, shade;

  Particle(float x, float y, int r, int b, int shade) {
    this.r = r;
    this.b = b;
    this.shade = shade;
    pos = new PVector(x, y);
    vel = PVector.random2D().mult((int)random(1, 4));
  }

  void run() {
    noStroke();
    if(shade == -1) fill(r,0,b);
    else fill(shade);
    circle(pos.x, pos.y, frame/12);
    pos = pos.add(vel);
    frame--;
  }
}
