import processing.serial.*;
import controlP5.*;

Serial myPort;
ControlP5 cp5;

boolean play = false;

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  fullScreen();
  game_setup();
  cp5 = new ControlP5(this);
  cp5.addButton("Play")
    .setPosition(width / 2 - 200, height / 2 - 50)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(0, 225, 255))
    .setSize(400, 100);
}

void draw() {
  background(0, 0, 0);
  if (play) {
    hide();
    game_draw();
  }
}

void serialEvent(Serial myPort) {
  String tempLine = myPort.readStringUntil('\n');
  if (tempLine != null) {
  }
}

void controlEvent(ControlEvent event) {
  if (event.isController()) {
    if (event.getController().getName().equals("Play")) {
      play = true;
    }
  }
}

void hide() {
  cp5.getController("Play").setPosition(width + 1000, height + 1000);
  cp5.getController("Play").setSize(0, 0);
}
