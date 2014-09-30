/* Bath Hack Sketch.
** Leaves on a Tree
** Mark (tingenek) & Sam Lawson
** For llamas everywhere
** Background from OpenStreetMap
** Tree from www.dreamstime.com
*/ 

//BackGround
PImage bg;
String bgFile = "bath_1280x800.jpg";
String treeFile = "tree.jpg";
PImage tree;

color l1 = #9CFF9C;
color l2 = #31FF00;
color l3 = #31CF00;
color c = #FFFF00;
color green = #319822;
color brown = #966428;
String s = "";

//Leaves
Leaves[] L;
int leaves = 250;
Table table;
int fCount = 0;
int offset = 0;

void setup() {
  size(1280,800,P2D);
  tree = loadImage(treeFile); 
  bg = loadImage(bgFile);
  //slow
  frameRate(30);
  noStroke();
  smooth();
  //read stored leaf positions 
  loadLeaves(c);  
  table = loadTable("windsor.csv", "header");
  fCount= table.getRowCount();
  textSize(14);
}

void draw() {
 //map 
 background(bg); 
 //tree transparent
 tint(255,64); 
 image(tree,70,20);
 //Work out data
 int q = int(table.getFloat(offset, "AvgNO2") * 1.91);
 int r = int(table.getFloat(offset, "AvgPPM"));
 float inter = map(r, 1, 50, 0, 1);
 color c = lerpColor(green, brown, inter);
 float inter2 = map(q, 1, 100, 0, 1);
 color c2 = lerpColor(green, brown, inter2);
 //Render  
 displayLeaves(); 
 displayText();
 if (frameCount % 20 == 0) {
   offset = offset+1 % fCount;
    L[5].nearest(c);
    L[155].nearest(c2);
    L[70].nearest(int(c2));
    L[100].nearest(int(c));
    L[175].nearest(int(c));
 }
}

/* Tools */

void loadLeaves(color c) {
  String[] data;
  String[] stuff = loadStrings("positions.txt");
  leaves = stuff.length;
  L = new Leaves[leaves];
//  println(stuff.length);
  for(int i = 0; i < leaves; i++) {
    data = split(stuff[i],',');
    L[i] = new Leaves(float(data[0]),float(data[1]),c);
  }
}

void displayLeaves() {
 for(int i = 0; i < leaves; i++) {
   L[i].display();
  }
}

void displayText() {
  fill(0);
//  rect(10,height-140,120, height);
  String s;  
  s=table.getString(offset, "Date");
  s=s + "\n AvgNO2: " +nf(table.getFloat(offset, "AvgNO2") * 1.91, 3, 2);
  s=s + "\n AvgPPM: " +nf(table.getFloat(offset, "AvgPPM"),3,2);
  text(s,10,height-140,120, height);    
}

//Keys
void keyPressed() {
  if (key == '1') {
 
  } else if (key == '2') {

  } else if (key == '3') {
 
  } else if (key == '0') {
     exit();  // Stops the program
  }
}




