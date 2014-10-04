float heroX, heroY, heroRadius;
float yVel;
boolean alive;
float enemyX, enemyY, enemyH, enemyW;
float xVel;
float gravity;

void setup() {
  size(800, 600);
  heroX = width/4;
  heroY = height/2;
  heroRadius = 75;
  gravity = .2;
  yVel = 0;
  alive = true;

  xVel = 5;
}

void draw() {
  if (alive) {
    background(#000000);
    yVel += gravity;

    if (yVel > 15) {
      yVel = 15;
    }
    if (yVel < -10) {
      yVel = -10;
    }

    heroY += yVel;

    if (heroY > height || heroY < 0) {
      alive = false;
    }

    enemyX -= xVel;
    spawnEnemy();
    collision();
    fill(#FF0000);
    stroke(255,255,255);
    rect(enemyX, enemyY, enemyW, enemyH);
    
     fill(255, 0, 0);
    stroke(255, 255, 255);
    ellipse(heroX, heroY, heroRadius, heroRadius);
  } else {
    background(255, 0, 0);
  }
}


void spawnEnemy() {
  if(enemyX < 0 - enemyW) {
    enemyX = width;
    enemyW = random(100,300);
    enemyH = random(200,400);
    enemyY = random(0, height - enemyH);
  }
}


void collision() {
  if(heroX >= enemyX && heroX <= enemyX + enemyW) {
    if(heroY >= enemyY && heroY <= enemyY + enemyH) {
      alive = false;
    }
  }
}

void keyPressed() {
  yVel -= 5;
  if(!alive){
    alive = true;
    enemyX = 0 - enemyW - 10;
    heroY = width/2;
    yVel = 0;
    spawnEnemy();
  }
}
