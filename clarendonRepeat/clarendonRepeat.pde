PFont clarendonBold;

void setup() {
  size(800,800);
  String[] fontList = PFont.list();
  printArray(fontList);
  clarendonBold = createFont("ClarendonLTStd-Bold", 100);
  for(int n = 0; n < 3; n++) {
    textFont(clarendonBold, 1000);
    textAlign(CENTER, CENTER);
    fill(75*n);
    text("a", 250 + noise(n)*255, 250 + noise(n)*255);
  }
}


void draw() {
  
}