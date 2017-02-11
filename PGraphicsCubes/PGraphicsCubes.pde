PGraphics cubeA;
PGraphics cubeB;

void setup() {
  size(1280,720, P3D);
  cubeA = createGraphics(width, height, P3D);
  cubeB = createGraphics(width, height, P3D);
  noCursor(); 
}

void draw() {
  background(0);
  drawCubeA();
  drawCubeB();
  float alphaA = map(mouseX, 0, width, 0, 255);
  tint(255, alphaA);
  image(cubeA, 0, 0);
  //map tint values of cubeB to Y position of mouse
  float alphaB = map(mouseY, 0, height, 0, 255);
  image(cubeB, 0, 0);
}

void drawCubeA() {
  cubeA.beginDraw();
  cubeA.lights();
  cubeA.clear();
  cubeA.noStroke();
  cubeA.translate(width/2, height/2);
  cubeA.rotateX(frameCount/100.0);
  cubeA.rotateY(frameCount/200.0);
  cubeA.box(height/2);
  cubeA.endDraw(); 
}

void drawCubeB() {
  // initiate PGraphic drawing
  cubeB.beginDraw();
  // sets the default ambient light, directional light, falloff, and specular values
  cubeB.lights();
  // make unassigned pixels in background transparent
  cubeB.clear();
  // no stroke
  cubeB.noStroke();
  // place cube in center of screen
  cubeB.translate(width/2, height/2);
  // rotate x and y axis of cubeB slightly faster than cubeA
  cubeB.rotateX(frameCount/150.0);
  cubeB.rotateY(frameCount/250.0);
  // create 3D primitive and specify size
  cubeB.box(height/2);
  // end PGraphic drawing
  cubeB.endDraw();
}