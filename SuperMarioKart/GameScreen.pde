int playerX, playerY; // Player's position
int playerSpeed = 10;

String direction = ".png";

int boundaryX = 100; // Left boundary
int boundaryY = 100; // Top boundary
int boundaryWidth = 1200; // Width of the boundary
int boundaryHeight = 700; // Height of the boundary

void game_setup() {
  playerX = width / 2;
  playerY = height / 2;
}

void game_draw() {  
  background(80, 200, 120);
  // Draw the boundary
  fill(169);
  noStroke();
  rect(boundaryX, boundaryY, boundaryWidth, boundaryHeight);
  // Character
  image(loadImage(character + direction), playerX, playerY, 75, 75);
  if (keyPressed) {
    int nextX = playerX;
    int nextY = playerY;
    if (key == 'w') {
      direction = ".png";
      image(loadImage(character + direction), playerX, playerY, 75, 75);
      playerY -= playerSpeed;
    } else if (key == 's') {
      direction = "D.png";
      image(loadImage(character + direction), playerX, playerY, 75, 75);
      playerY += playerSpeed;
    } else if (key == 'a') {
      direction = "L.png";
      image(loadImage(character + direction), playerX, playerY, 75, 75);
      playerX -= playerSpeed;
    } else if (key == 'd') {
      direction = "R.png";
      image(loadImage(character + direction), playerX, playerY, 75, 75);
      playerX += playerSpeed;
    }
    // Check if the next position is within the boundary
    if (nextX <= boundaryX) {
      playerX = nextX+5;
    }
    if (nextX >= boundaryX+boundaryWidth-80) {
      playerX = nextX-5;
    }
    if (nextY <= boundaryY) {
      playerY = nextY+5;
    }
    if (nextY >= boundaryY+boundaryHeight-80) {
      playerY = nextY-5;
    }
  }
}
