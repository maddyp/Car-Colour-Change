import g4p_controls.*;
PImage back, carasset,carassetmask;

GKnob knbRed, knbGreen, knbBlue;
GLabel label;
PShape car;
int r, g, b;
int kx, ky;


void setup() {
  fullScreen(P2D);
  car = loadShape("car.svg");
  back = loadImage("racetrack.png");
  carasset = loadImage("assetcar.png");
  carassetmask = loadImage("assetcarmask.png");
  carasset.mask(carassetmask);
  
  r = g = b = 160;
  kx = 500;
  ky = 50;

  knbRed = new GKnob(this, kx, ky, 150, 150, 0.9);
  knbRed.setTurnRange(150, 270);
  knbRed.setTurnMode(G4P.CTRL_ANGULAR);
  knbRed.setArcPolicy(true, true, true);
  knbRed.setLimits(r, 0, 255);
  knbRed.setLocalColorScheme(G4P.RED_SCHEME);

  knbGreen = new GKnob(this, kx + 8, ky, 150, 150, 0.9);
  knbGreen.setTurnRange(270, 30);
  knbGreen.setTurnMode(G4P.CTRL_ANGULAR);
  knbGreen.setArcPolicy(true, true, true);
  knbGreen.setLimits(g, 0, 255);
  knbGreen.setLocalColorScheme(G4P.GREEN_SCHEME);

  knbBlue = new GKnob(this, kx + 4, ky + 9, 150, 150, 0.9);
  knbBlue.setTurnRange(30, 150);
  knbBlue.setTurnMode(G4P.CTRL_ANGULAR);
  knbBlue.setArcPolicy(true, true, true);
  knbBlue.setLimits(b, 0, 255);
  knbBlue.setLocalColorScheme(G4P.BLUE_SCHEME);
}

void draw() {
  background(back);
  car.disableStyle(); 
  // Color sampler
  fill(r, g, b);
  shapeMode(CENTER);
  shape(car, 1130/*pos X*/, 545/*pos Y*/, 900 /*scale X*/, 330 /*scale Y*/);
  image(carasset,0,0);
}

void handleKnobEvents(GValueControl knob, GEvent event) {
  if (knob == knbRed) 
    r = knob.getValueI();
  else if (knob == knbGreen)
    g = knob.getValueI();
  else if (knob == knbBlue)
    b = knob.getValueI();
}
