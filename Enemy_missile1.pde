class missile1 extends Enemy {
  int shotTimer, threshold;
  int brust;


  int GIFcount;
  missile1(int x, int y) {

    super(1000, 50, x, y, 400, 300);


    shotTimer = 0;
    threshold = 80;
  }

  void show() {
    noStroke();
    //fill(255, 255, 0);
    noFill();
    size = 50;
    circle(location.x, location.y, size);
    image (riden, location.x, location.y);
    fill(255, 0, 0);
    textSize(20);
    text(hp, location.x, location.y + 35);
    fill(0, 255, 0);
    rect(location.x, location.y-35, 500/10, 5);
    fill(255, 0, 0);
    rect(location.x, location.y-35, brust/10, 5);
  }

  void act() {
    super.act();
    brust++;

    PVector enemyaimVector = new PVector( myHero.location.x, myHero.location.y);

    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new enemybullet2 (enemyaimVector, location.x, location.y));

      shotTimer = 0;
    }


    if (brust >= 500) {
      raiden.show();
      GIFcount++;
      for (int i = 0; i < 50; i++) {

        enemyaimVector.rotate(random(-PI/10, PI/10));
        enemyaimVector.setMag(5);
        myObjects.add(new enemybullet3(enemyaimVector, location.x, location.y));
        shotTimer = 0;
      }
      for (int ii = 0; ii < 50; ii++) {

        enemyaimVector.rotate(random(-PI/10, PI/10));
        enemyaimVector.setMag(5);
        myObjects.add(new enemybullet3(enemyaimVector, location.x, location.y));
        shotTimer = 0;
      }
      if (GIFcount >= 35 ) {
        brust = 0;
        GIFcount = 0;
      }
    }
  }
}
