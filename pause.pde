int pauseClick;
int countdown;
void pause() {
 image(back,700,425,1400,850);
  //text
  textAlign(CENTER);
  orbitron = createFont("Orbitron-VariableFont_wght.ttf", 100);
  fill(0);
  textFont( orbitron);
  textSize (50);
  text(score, 700, 50);
  text("RESUME", 700, 750);
  textSize(25);
  text("EXPERIENCE POINTS", 700, 100);
  text("Press number to use experience points", 700, 150);
  text("1  Increase speed with 1500 experience points", 700, 250);
  text("Hero speed:", 100, 250);
  text(herospeed, 200, 250);
  text("Maximum speed: 8", 1200, 250);
  text("2  Increase health by 500 with 500 experience points", 700, 400);
  text("Hero health:", 100, 400);
  text(myHero.hp, 230, 400);
  
   if (onekey) {
     if (herospeed <=8 ) {
       if (countdown <= 0){
     if (score >= 1500) {
      herospeed = herospeed + 1;
      score = score - 1500; 
      countdown = 15;
     }
     }
     }
    }
       if (twokey) {
     if (countdown <= 0){
     if (score >= 500) {
      myHero.hp = myHero.hp + 500;
      score = score - 500; 
     countdown = 15;
     }
    }
       }
    
    countdown--;
    
}
void pauseClick() {
  if (mouseY > 700) {
    
      mode=1;
    
  }
}
