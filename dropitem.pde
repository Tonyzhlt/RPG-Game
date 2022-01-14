class dropitem extends GameObject {
  int randomdrop;
  int randomdropGunOrHealth;
  int type;
  Weapon w;
  dropitem (float x, float y, int rx, int ry) {
    randomdropGunOrHealth = int(random(0, 1));
    randomdrop = int(random(0, 3));
    if (randomdropGunOrHealth == 0) {
      type = GUN;
    }
    if (randomdropGunOrHealth ==1) {
      type = HEALTH;
    }
    if (randomdrop == 0) {
      w = new machinegun();
    }
    if (randomdrop == 1) {
      w = new sniper();
    }
    if (randomdrop == 2) {
      w = new ElegyForTheEnd();
    }
    if (randomdrop == 3) {
      w = new pistol();
    }
    //type = GUN;
    //w = new sniper();
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size =  20;
    roomX = rx;
    roomY = ry;
    c = yellow;
  }

  void show() {
    if (randomdropGunOrHealth == 0) {
      textSize(10);
    image(chest,location.x,location.y,40,40);
    }
    if (randomdropGunOrHealth == 1) {

     image(chest,location.x,location.y,40,40);
    }


    //stroke(black);
    //strokeWeight(2);
    //fill(c);
    //circle(location.x,location.y,size);
  }

  void act() {
  }
}
