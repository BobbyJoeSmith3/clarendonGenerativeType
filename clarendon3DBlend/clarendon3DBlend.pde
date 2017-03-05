
// import the required libraries
import geomerative.*;              // geomerative livrary for text manipulation and point extraction
import wblut.processing.*;         // hemesh library section for displaying shapes
import wblut.hemesh.*;             // hemesh library section with main HE_Mesh class
import wblut.geom.*;               // hemesh lbirary section with geometry classes


// globals
RFont font;                        // geomerative font used for creating the 3Dtext
WB_Render3D render;                  // hemesh class for displaying shapes
HE_Mesh mesh;                      // the main HE_Mesh instance to hold the 3D mesh
String input = "A";                // the input string that is transfomed into a 3D mesh

PGraphics layer1;                  // Pgraphics layer for first layer


void setup() {
  size(1280, 720, P3D);  // needs the 3D renderer
  smooth(16);  // improve rendering performance
  
  layer1 = createGraphics(width, height, P3D);  // PGraphics layer
  render = new WB_Render3D(this);
  create();
}

void draw() {
  background(55);
  drawLayer(layer1);
  image(layer1, 0, 0);
}

void create() {
  HEC_Geodesic creator = new HEC_Geodesic().setRadius(250);
  mesh = new HE_Mesh(creator);
}

void drawLayer(PGraphics layer) {
  layer.beginDraw();
  layer.lights();
  layer.translate(width/2, height/2, 0);
  layer.rotateY(map(mouseX, 0, width, -PI, PI));
  layer.rotateX(map(mouseY, 0, height, PI, -PI));
  layer.noStroke();
  layer.fill(255);
  render.drawFaces(mesh);
  layer.stroke(0);
  layer.noFill();
  render.drawEdges(mesh);
}