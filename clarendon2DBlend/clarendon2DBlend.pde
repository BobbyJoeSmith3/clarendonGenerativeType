PFont clarendonStd;
PGraphics A,B,C,D;
PGraphics[] layer = {A, B, C, D};

void setup() {
  size(800, 800, P2D);
  frameRate(2);
  blendMode(LIGHTEST);
  for (int i = 0; i < layer.length; i++) {
    layer[i] = createGraphics(width, height);  
  }
  
  // String[] fontList = PFont.list();
  // println(fontlist);
  clarendonStd = createFont("../Fonts/ClarendonLTStd.ttf", 48);
}

void draw() {
  background(0);
  for(int i = 0; i < 4; i++) {
    drawLetter(layer[i], "A", i);
    image(layer[i], 0, 0);
  }
}

void drawLetter(PGraphics layer, String phrase, int i) {
  layer.beginDraw();
  layer.clear();
  layer.textFont(clarendonStd, 272);
  layer.translate(400, 400);
  //layer.fill(random(0, 256), random(0,256), random(0,256),random(0,256));
  layer.fill(random(0, 256), random(0,256), random(0,256));
  layer.textAlign(RIGHT);
  layer.pushMatrix();
  layer.rotate(PI*i/random(30, 65));
  layer.text(phrase, 0, 0);
  layer.popMatrix();
  layer.endDraw();
}