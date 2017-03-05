import processing.pdf.*;
PFont clarendonStd;
PGraphics A,B,C,D;
PGraphics[] layer = {A, B, C, D};

String letters = "";
boolean record;
char[] alpha = {
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
  'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
  'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
  '(', ')', '&', '/', '?', '!', ':', ';', ',', '.', '#', '%', '@', '$', '"', '\'',
  '~', '+', '=', '-', '_', '—'};
  
char[] testalpha = { 'A', 'W', 'g' };

int variations = 3;
int currentChar = 0;
int counter = 0;

void setup() {
  size(325, 325, P2D);
  background(0);
  frameRate(1);
  
  // create 4 PGraphics layers
  for (int i = 0; i < layer.length; i++) {
    layer[i] = createGraphics(width, height); 
  }
  
  // String[] fontList = PFont.list();
  // println(fontlist);
  clarendonStd = createFont("../Fonts/ClarendonLTStd.ttf", 48);
  blendMode(LIGHTEST);
}

void draw() {
  if (currentChar < alpha.length) {
    // Create the number of letter variants needed
    for(int j = 0; j < variations; j++){
      beginRecord(PDF, "frame-####.pdf");
      background(0);
      // Draw a letter on each layer
      for(int i = 0; i < layer.length; i++) {
        drawLetter(layer[i], alpha[currentChar], i);
        image(layer[i], 0, 0);
      }
      endRecord();
    }
    println(alpha[currentChar]);
  } else {
    println("done");
    exit();
  }
  if (frameCount % 4 == 0) {currentChar++;}
}

void drawLetter(PGraphics layer, char phrase, int i) {
  layer.beginDraw();
  layer.clear();
  layer.textFont(clarendonStd, 272);
  layer.translate(275, 250);
  //layer.fill(random(0, 256), random(0,256), random(0,256),random(0,256));
  layer.fill(random(0, 256));
  layer.textAlign(RIGHT);
  layer.pushMatrix();
  layer.rotate(PI*i/random(30, 65));
  layer.text(phrase, 0, 0);
  layer.popMatrix();
  layer.endDraw();
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (letters.length() > 0) {
      letters = letters.substring(0, letters.length()-1);
    }
  } else if (textWidth(letters+key) < width) {
    letters = letters + key;
  }
}

void mousePressed() {
  record = true;
}