PGraphics cubeA;
PGraphics cubeB;

void setup() {
  size(1280,720, P3D);
  cubeA = createGraphics(width, height, P3D);
  cubeB = createGraphics(width, height, P3D);
  noCursor();
  blendMode(EXCLUSION);
}

void draw() {
  background(255);
  drawCube(cubeA, 100, 200);
  drawCube(cubeB, 150, 250);
  image(cubeA, 0, 0);
  image(cubeB, 0, 0);
}

void drawCube(PGraphics cube, float xd, float yd) {
  // initiate PGraphic drawing
  cube.beginDraw();
  // sets the default ambient light, directional light, falloff, and specular values
  cube.lights();
  // make unassigned pixels in background transparent
  cube.clear();
  // no stroke
  cube.noStroke();
  // place cube in center of screen
  cube.translate(width/2, height/2);
  // rotate x and y axis of cubeB slightly faster than cubeA
  cube.rotateX(frameCount/xd);
  cube.rotateY(frameCount/yd);
  // create 3D primitive and specify size
  cube.box(height/2);
  // end PGraphic drawing
  cube.endDraw();
}