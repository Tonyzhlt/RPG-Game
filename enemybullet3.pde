class enemybullet3 extends GameObject {
  int brust;
  int timer;
  PVector direction;

  enemybullet3( PVector v, float x, float y) {
    brust++;
    location = new PVector (myHero.location.x, myHero.location. y);
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    velocity = v;
    hp = 1;
    location = new PVector(x, y);

    size = 20;
  }

  void show() {
    noStroke();
    noFill();

    circle(location.x, location.y, size);
    image(shilaimu, location.x, location.y);
  }

  void act() {
    location.add(velocity);

    if (location.y <= 50)  hp=0;
    if (location.y >= 800) hp=0;
    if (location.x<=70) hp=0;
    if (location.x>=1330) hp=0;
  }
}
