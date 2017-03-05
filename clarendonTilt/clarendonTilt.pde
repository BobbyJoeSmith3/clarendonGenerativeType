PFont clarendonStd;

void setup() {
  size(800, 800);
  background(255);
  
  // String[] fontList = PFont.list();
  // println(fontlist);
  
  clarendonStd = createFont("../Fonts/ClarendonLTStd.ttf", 48);
  textFont(clarendonStd, 272);
  translate(400, 400);
  
  for(int i = 0; i < 4; i++) {
    fill(random(0, 256), random(0,256), random(0,256),random(0,256));
    textAlign(RIGHT);
    pushMatrix();
    rotate(PI*i/random(30, 65));
    text("A", 0, 0);
    popMatrix();
  }
}