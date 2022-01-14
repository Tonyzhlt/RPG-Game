void gameover() {
  //background(0); 
  image (gover,700 , 425, 1400, 850);
  text("Click To Restart",700,600);
}

void gameoverClick() {
  
  myHero.hp = 3000;
  mode = 0;
  score = 0;
  //load gifs
  manUp = new AnimatedGIF(4, 10, "man/up/sprite_", ".png");
  manDown = new AnimatedGIF(4, 10, "man/down/sprite_", ".png");
  manLeft = new AnimatedGIF(4, 10, "man/left/sprite_", ".png");
  manRight = new AnimatedGIF(4, 10, "man/right/sprite_", ".png");
  myGIF = new AnimatedGIF(61, "frame_", "_delay-0.02s.png", 700, 450, 1400, 900);
  raiden = new AnimatedGIF(35, "frame_", "_delay-0.04s.png", 700, 450, 1900, 900);
  gongzi1 = new AnimatedGIF(49, "frame_", "_delay-0.04s.jpg", 700, 450, 1900, 900);

  //hero
  herospeed = 2;
  
  //enemy count
  enemycount = 134;

  //import images
  youwin = loadImage("youwin.jpg");
  hole = loadImage("hole.png");
  paimeng = loadImage("paimeng.png");
  keli = loadImage("keli.png");
  bullet = loadImage("bullet.png");
  chest = loadImage("chest.png");
  sgun = loadImage("sgun.png");
  ngun = loadImage("ngun.png");
  mgun = loadImage("mgun.png");
  pgun = loadImage("pgun.png");
  diluke = loadImage("diluke.png");
  back = loadImage("2468.jpg");
  hutao = loadImage( "hutao.png");
  map = loadImage("MicrosoftTeams-image (4).png");
  riden= loadImage("Riden1.png");
  Genshin =  loadImage("Genshin.png");
  shilaimu = loadImage("shilaimu.png");
  gongzi = loadImage("gongzi.png");
  huoshilaimu = loadImage("huoshilaimu.png");
  blackhole = loadImage("blackhole.png");
  floor = loadImage("floor.png");
  gover = loadImage("gover.jpg");

  mode = 0;

  bkg = white;
  blueButton  = new Button("START", 700, 775, 200, 150, blue, pink);
  myHero= new Hero();
  myObjects = new ArrayList<GameObject>(1000);

  //initialize loading enemy =====================================================
  x=0;
  y=0;
  while ( y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == pink) {
      myObjects.add( new Follower(x, y));
      myObjects.add(new missile(x, y));
      myObjects.add(new paimeng4(x, y));
    }
    if (roomColor == yellow) {

      myObjects.add(new missile(x, y));
      myObjects.add(new paimeng(x, y));


      myObjects.add(new paimeng4(x, y));
      myObjects.add(new  Gunman1(x, y));
      myObjects.add(new  Gunman(x, y));
    }
    if (roomColor == blue) {


      myObjects.add(new paimeng2(x, y));
      myObjects.add(new paimeng4(x, y));
      myObjects.add(new  Gunman(x, y));
    }
    if (roomColor == red) {
      myObjects.add(new paimeng(x, y));
      myObjects.add(new paimeng2(x, y));
      myObjects.add(new paimeng3(x, y));
      myObjects.add(new paimeng4(x, y));
      myObjects.add(new missile(x, y));
    }
    if (roomColor == green) {
      myObjects.add(new  Gunman1(x, y));
      myObjects.add(new  Gunman(x, y));
      myObjects.add(new missile(x, y));
      myObjects.add(new missile1(x, y));
    }
    if (roomColor == black) {
    }
    x++;
    if (x == map.width) {
      x=0;
      y++;
    }
  }
  //============================================================================


  //add objects
  myObjects.add(myHero);


  //Darkness
  noStroke();
  darkness = new ArrayList<DarknessCell> (1000);
  float size = 5;
  rectMode(CORNER);
  float x = 0, y = 0;
  darkness.add(new DarknessCell(0, 0, size));
  while (x <= width && y <= height) {
    darkness.add(new DarknessCell(x, y, size));
    x = x + size;
    if (x==width) {
      y= y + size;
      x=0;
    }
  }

  
  
}
