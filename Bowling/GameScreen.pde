int ballAngle = 0;
int ballX, ballY;
boolean ballReleased = false;

BowlingPin[] row = new BowlingPin[10];

int laneX = 500;
int laneY = 0;
int laneWidth = 500;
int laneHeight = 900;

int gutter1X = 400;
int gutter2X = 1000;
int gutterY = 0;
int gutterWidth = 100;
int gutterHeight = 900;

String message = "";

void game_setup() {
  setup_pins();
}

void game_draw() {
  background(0, 0, 0);
  fill(150, 105, 25);
  rect(gutter1X, gutterY, gutterWidth, gutterHeight);
  fill(150, 105, 25);
  rect(gutter2X, gutterY, gutterWidth, gutterHeight);
  fill(194, 178, 128);
  rect(laneX, laneY, laneWidth, laneHeight);
  cp5.addTextlabel("Text")
    .setText(message)
    .setPosition(10, 10)
    .setFont(createFont("Arial", 50));
  update_pins();
  if (keyPressed) {
    if (key == 'w') {
      ballReleased = true;
    }
  }
  if (!ballReleased) {
    ballX = mouseX; ballY = mouseY;
  } else {
    ballY -= 10;
    if (ballY < 0) {
      message = checkResult();
      cp5.getController("Text").setStringValue(message);
      ballReleased = false;
    }
  }
  translate(ballX, ballY);
  rotate(ballAngle);
  imageMode(CENTER);
  image(loadImage("ball.png"), 0, 0, 75, 75);
  ballAngle++;
  rotate(-ballAngle+1);
}

void setup_pins() {
  for (int i = 0; i < 4; i++) {
    int x = i * width / 12 + 575;
    int y = 50;
    row[i] = new BowlingPin(x, y);
    image(loadImage("pin.png"), x, y, 35, 75);
  }
  for (int i = 4; i < 7; i++) {
    int x = (i-4) * width / 12 + 635;
    int y = 90;
    row[i] = new BowlingPin(x, y);
  }
  for (int i = 7; i < 9; i++) {
    int x = (i-7) * width / 12 + 695;
    int y = 130;
    row[i] = new BowlingPin(x, y);
  }
  for (int i = 9; i < 10; i++) {
    int x = (i-9) * width / 12 + 755;
    int y = 170;
    row[i] = new BowlingPin(x, y);
  }
}

void update_pins() {
  for (int i = 0; i < row.length; i++) {
    BowlingPin bp = row[i];
    if (bp.isStanding) {
      image(loadImage("pin.png"), bp.x, bp.y, 35, 75);
    } else {
      image(loadImage("pin_fall.png"), bp.x, bp.y, 75, 35);
    }
  }
}

String checkResult() {
  if (ballX > 400 && ballX < 500) {
    return "Gutter Ball";
  } else if (ballX <=400) {
    return "Gone Forever";
  } else if (ballX > 1000 && ballX < 1100) {
    return "Gutter Ball";
  } else if (ballX >= 1100) {
    return "Gone Forever";
  } else {
    if (ballX >= 500 && ballX < 600) {
      row[0].isStanding = false;
      return "1 Down";
    } else if (ballX > 900 && ballX <= 1000) {
      row[3].isStanding = false;
      return "1 Down";
    } else if (ballX >= 600 && ballX < 700) {
      row[0].isStanding = false;
      row[1].isStanding = false;
      row[4].isStanding = false;
      return "3 Down";
    } else if (ballX >= 800 && ballX < 900) {
      row[2].isStanding = false;
      row[3].isStanding = false;
      row[6].isStanding = false;
      return "3 Down";
    } else {
      for (int i = 0; i < row.length; i++) {
        row[i].isStanding = false;
      }
      return "Strike";
    }
  }
}
