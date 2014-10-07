float heroX, heroY, heroRadius;
float yVel;
boolean alive;
float enemyX, enemyY, enemyH, enemyW;
float xVel;
float gravity;
int myScore;
int hiScore;
PFont score;

void setup() {
  size(800, 600);
  heroX = width/4;
  heroY = height/2;
  heroRadius = 75;
  gravity = .2;
  yVel = 0;
  alive = true;
  score = createFont("Arial", 16, true);
  myScore = 0;
  hiScore = 0;
  xVel = 5;
}

void draw() {
  if (alive) {
    background(#000000);
    yVel += gravity;
    myScore += 1;
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

    textFont(score, 36);
    fill(#FFFFFF);
    text("Score: " +myScore, 10, 40);

    enemyX -= xVel;
    spawnEnemy();
    collision();
    fill(#FF0000);
    stroke(255, 255, 255);
    rect(enemyX, enemyY, enemyW, enemyH);

    fill(255, 0, 0);
    stroke(255, 255, 255);
    ellipse(heroX, heroY, heroRadius, heroRadius);
  } else {
    background(255, 0, 0);
    textFont(score, 40);
    fill(#000000);
    text("Game Over!", 250,300);
    text("Your Score was: " +myScore, 250, 350);
    text("Your Highest Score is: " +hiScore, 250, 400);
  }
}


void spawnEnemy() {
  if (enemyX < 0 - enemyW) {
    enemyX = width;
    enemyW = random(100, 300);
    enemyH = random(200, 470);
    enemyY = random(45, height - enemyH);
  }
}


void collision() {
  if (heroX >= enemyX && heroX <= enemyX + enemyW) {
    if (heroY >= enemyY && heroY <= enemyY + enemyH) {
      alive = false;
    }
  }
}

void keyPressed() {
  yVel -= 5;
  if (!alive) {
    if(myScore > hiScore) {
      hiScore = myScore;
    }
    
    alive = true;
    enemyX = 0 - enemyW - 10;
    heroY = width/2;
    yVel = 0;
    myScore = 0;
    spawnEnemy();
  }
}

