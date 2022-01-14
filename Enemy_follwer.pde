class Follower extends Enemy {
  Follower(int x, int y) {
    super(1000, 20, x, y, 700, 300);
  }
  void show() {
    size = 60;
    noStroke();
    fill(255, 255, 0);
    //circle(location.x, location.y, size);
    image (diluke, location.x, location.y, 60, 60);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y - 35);
  }

  void act() {
    super.act();
    velocity = new PVector( myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(herospeed - 0.25);
  }
}
