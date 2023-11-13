import processing.serial.*;
import controlP5.*;

Serial myPort;
ControlP5 cp5;

String character = "characters/Mario";
boolean play = false;

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  fullScreen();
  game_setup();
  cp5 = new ControlP5(this);
  cp5.addTextlabel("CharacterLabel")
    .setText("Mario")
    .setPosition(10, 10)
    .setFont(createFont("Arial", 50));
  cp5.addButton("Logo")
    .setPosition(50, 50)
    .setImage(loadImage("logo.png"));
  cp5.addButton("Play")
    .setPosition(width / 2 - 700 / 2, height / 2 + 400 / 2)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(193, 225, 193))
    .setSize(400, 100);
  cp5.addButton("Mario")
    .setPosition(width - 400, height / 3 - 250)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(255,0,0))
    .setSize(400, 100);
  cp5.addButton("Luigi")
    .setPosition(width - 400, height / 3 - 150)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(0,255,0))
    .setSize(400, 100);
  cp5.addButton("Princess")
    .setPosition(width - 400, height / 3 - 50)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(255,192,203))
    .setSize(400, 100);
  cp5.addButton("Koopatroopa")
    .setPosition(width - 400, height / 3 + 50)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(240,230,140))
    .setSize(400, 100);
  cp5.addButton("Bowser")
    .setPosition(width - 400, height / 3 + 150)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(204,204,0))
    .setSize(400, 100);
  cp5.addButton("Donkey Kong")
    .setPosition(width - 400, height / 3 + 250)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(128,0,0))
    .setSize(400, 100);
  cp5.addButton("Toad")
    .setPosition(width - 400, height / 3 + 350)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(220,20,60))
    .setSize(400, 100);
  cp5.addButton("Yoshi")
    .setPosition(width - 400, height / 3 + 450)
    .setFont(createFont("Arial", 50))
    .setColorBackground(color(60,179,113))
    .setSize(400, 100);
}

void draw() {
  background(193, 225, 193);
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
    } else if (event.getController().getName().equals("Mario")) {
      cp5.getController("CharacterLabel").setStringValue("Mario");
      character = "characters/Mario";
    } else if (event.getController().getName().equals("Luigi")) {
      cp5.getController("CharacterLabel").setStringValue("Luigi");
      character = "characters/Luigi";
    } else if (event.getController().getName().equals("Princess")) {
      cp5.getController("CharacterLabel").setStringValue("Princess");
      character = "characters/Princess";
    } else if (event.getController().getName().equals("Koopatroopa")) {
      cp5.getController("CharacterLabel").setStringValue("Koopatroopa");
      character = "characters/Koopatroopa";
    } else if (event.getController().getName().equals("Bowser")) {
      cp5.getController("CharacterLabel").setStringValue("Bowser");
      character = "characters/Bowser";
    } else if (event.getController().getName().equals("Donkey Kong")) {
      cp5.getController("CharacterLabel").setStringValue("Donkey Kong");
      character = "characters/Donkey Kong";
    } else if (event.getController().getName().equals("Toad")) {
      cp5.getController("CharacterLabel").setStringValue("Toad");
      character = "characters/Toad";
    } else if (event.getController().getName().equals("Yoshi")) {
      cp5.getController("CharacterLabel").setStringValue("Yoshi");
      character = "characters/Yoshi";
    }
  }
}

void hide() {
  cp5.getController("Play").setPosition(width + 1000, height + 1000);
  cp5.getController("Play").setSize(0, 0);
  cp5.getController("CharacterLabel").setPosition(width + 1000, height + 1000);
  cp5.getController("CharacterLabel").setSize(0, 0);
  cp5.getController("Logo").setPosition(width + 1000, height + 1000);
  cp5.getController("Logo").setSize(0, 0);
  cp5.getController("Mario").setPosition(width + 1000, height + 1000);
  cp5.getController("Mario").setSize(0, 0);
  cp5.getController("Luigi").setPosition(width + 1000, height + 1000);
  cp5.getController("Luigi").setSize(0, 0);
  cp5.getController("Princess").setPosition(width + 1000, height + 1000);
  cp5.getController("Princess").setSize(0, 0);
  cp5.getController("Koopatroopa").setPosition(width + 1000, height + 1000);
  cp5.getController("Koopatroopa").setSize(0, 0);
  cp5.getController("Bowser").setPosition(width + 1000, height + 1000);
  cp5.getController("Bowser").setSize(0, 0);
  cp5.getController("Donkey Kong").setPosition(width + 1000, height + 1000);
  cp5.getController("Donkey Kong").setSize(0, 0);
  cp5.getController("Toad").setPosition(width + 1000, height + 1000);
  cp5.getController("Toad").setSize(0, 0);
  cp5.getController("Yoshi").setPosition(width + 1000, height + 1000);
  cp5.getController("Yoshi").setSize(0, 0);
}
