AnimatedGIF gongzi1;
class Gunman extends Enemy {
  int shotTimer, threshold;
  int brust1;
  int brust2;
  int brusttimer;
  int brusttimer1;
  int width1;
  int length1;
  int GIFcount1;
  Gunman(int x, int y) {
    super(1000, 50, x, y, 700, 425);
    shotTimer = 0;
    threshold = 20;
  }

  void show() {
    noStroke();
    noFill();
    size = 50;
    circle(location.x, location.y, size);
    image (gongzi, location.x, location.y);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y - 35);
    fill(0, 255, 0);
    rect(location.x, location.y + 35, 50, 5);
    fill(255, 0, 0);
    rect(location.x, location.y + 35, brust1/15, 5);
  }

  void act() {
    super.act();
    shotTimer++;
    brust1++;
    brust2++;
    for (int i = 0; i < 50; i++) {
      if (shotTimer > threshold) {
        myObjects.add(new enemybullet (location.x, location.y));
        shotTimer = 0;
      }
    }
    if (brust2 >= 750) {
      if (GIFcount1 == 0) {
        GIFcount1 = 49;
      }

      if (GIFcount1 >= 0) {
        GIFcount1--;
        gongzi1.show();
      }
      if (GIFcount1 == 1) {
        brust2 = 0;
      }
    }
    if (brust1 >= 750) {
      brusttimer++;
      noFill();
      stroke(0);
      strokeWeight(5);
      rect(location.x, location.y, 300, 900);
      rect(location.x, location.y, 1400, 300);
      if (brusttimer >= 100) {
        brusttimer1 ++;
        length1 = length1 + 12;
        width1 = width1 + 19;
        noStroke();
        fill(255, 0, 0);
        rect(location.x, location.y, 300, length1);
        rect(location.x, location.y, width1, 300);
        if (myHero.location.y < 575 && myHero.location.y > 275 ) {
          myHero.hp = myHero.hp - 5;
        }
        if (myHero.location.x < 850 && myHero.location.x > 650 ) {
          myHero.hp = myHero.hp - 5;
        }
      }
      if (brusttimer1 >= 150) {
        width1 =0;
        length1 =0;
        brusttimer=0;
        brusttimer1=0;
        brust1 = 0;
        brust2 = 0;
      }
    }
  }
}
