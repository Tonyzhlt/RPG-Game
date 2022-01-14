class paimeng3 extends Enemy {
  int shotTimer, threshold;




  paimeng3(int x, int y) {

    super(500, 50, x, y, 1300, 770);


    shotTimer = 0;
    threshold = 50;
  }

  void show() {
    noStroke();
    //fill(255, 255, 0);
    noFill();
    size = 50;
    circle(location.x, location.y, size);
    image (paimeng, location.x, location.y);
    fill(255, 0, 0);
    textSize(20);
    text(hp, location.x, location.y + 35);
    fill(0, 255, 0);
  
    
  }

  void act() {
    super.act();
    

    PVector enemyaimVector = new PVector( myHero.location.x, myHero.location.y);

    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new enemybullet4 (enemyaimVector, location.x, location.y));

      shotTimer = 0;
    }


  }
}
