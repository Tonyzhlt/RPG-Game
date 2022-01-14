// RPG game by Tony Zhong
// Some enemies have damge burst, be caution
// Different full screen GIFs added for enemies damage burst
// Most GIFs are from my favourite vedio game characters
// Immunity will only block the damage by bullets
// Enjoy!

PFont orbitron;
Hero myHero;
Enemy myEnemy;
int enemycount;
int x;
int y;
int score;
int herospeed;
AnimatedGIF manUp;
AnimatedGIF manDown;
AnimatedGIF manLeft;
AnimatedGIF manRight;

//Images
PImage youwin;
PImage hole;
PImage paimeng;
PImage keli;
PImage bullet;
PImage chest;
PImage sgun;
PImage mgun;
PImage ngun;
PImage pgun;
PImage gover;
PImage diluke;
PImage back;
PImage gongzi;
PImage hutao;
PImage map;
PImage riden;
PImage Genshin;
PImage shilaimu;
PImage huoshilaimu;
PImage floor;
PImage blackhole;
color northRoom, southRoom, eastRoom, westRoom;

//sound
import processing.javafx.*;
import processing.sound.*;
SoundFile file;
SoundFile introsong;


//GameObjects
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;

//dropitem
final int ammo = 7;
final int HEALTH = 8;
final int GUN = 9;


boolean upkey, downkey, leftkey, rightkey, spacekey, fkey, pkey, onekey, twokey, threekey, fourkey;

color blue   = #009BFF;

color pink   = #FA05DE;
color yellow = #FFF387;
color red = #FF1500;
color black = #000000;
color green = #66C100;


color white  = #FFFFFF;
int mode;
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int win = 3;
final int pause = 4;

void setup () {
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




  size (1400, 850, FX2D);
  imageMode(CENTER);




  rectMode(CENTER);
  //file = new SoundFile(this,"song.mp3");
  //introsong = new SoundFile(this,"introsong.mp3");
}

void draw() {
  if (mode == intro) {
    intro();
  } else if (mode== game) {
    games();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == win) {
    win();
  } else if (mode == pause) {
    pause();
  }
}

void keyPressed() {
  if (keyCode == 'w' || keyCode == 'W') upkey = true;
  if (keyCode == 's' || keyCode == 'S') downkey = true;
  if (keyCode == 'a'|| keyCode == 'A') leftkey = true;
  if (keyCode == 'd'|| keyCode == 'D') rightkey = true;
  if (keyCode == ' ') spacekey = true;
  if (keyCode == 'f'|| keyCode == 'F') fkey = true;
  if (keyCode == 'p'|| keyCode == 'P') pkey = true;
  if (keyCode == '1'|| keyCode == '1') onekey = true;
  if (keyCode == '2'|| keyCode == '2') twokey = true;
  if (keyCode == '3'|| keyCode == '3') threekey = true;
  if (keyCode == '4'|| keyCode == '4') fourkey = true;
}

void keyReleased() {
  if (keyCode == 'w'|| keyCode == 'W') upkey = false;
  if (keyCode == 's'|| keyCode == 'S') downkey = false;
  if (keyCode == 'a'|| keyCode == 'A') leftkey = false;
  if (keyCode == 'd'|| keyCode == 'D') rightkey = false;
  if (keyCode == ' ') spacekey = false;
  if (keyCode == 'f'|| keyCode == 'F') fkey = false;
  if (keyCode == 'p'|| keyCode == 'P') pkey = false;
  if (keyCode == '1'|| keyCode == '1') onekey = false;
  if (keyCode == '2'|| keyCode == '2') twokey = false;
  if (keyCode == '3'|| keyCode == '3') threekey = false;
  if (keyCode == '4'|| keyCode == '4') fourkey = false;
}
