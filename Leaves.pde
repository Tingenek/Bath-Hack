/* Leaves Class
** Mark (tingenek) & Sam Lawson
** For llamas everywhere
*/ 

class Leaves {
PShape s;
color shade;
int opacity = 200;
float pointShift = random(-10,10);
PVector v;

Leaves (float _x, float _y,color _c) {
 // create a leaf
  v = new PVector(_x, _y);
  shade= _c;
  s = createShape();
  s.beginShape(); 
  s.fill(shade,opacity);
  s.vertex(20,45);
  s.bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); 
  s.bezierVertex(60 + pointShift,55, 30,65, 20,45); 
  s.rotate(random(TWO_PI)); // rotate in a random direction
  s.translate(-20,-45);
  s.scale(random(0.8,1.2)); // scale slightly
  s.endShape();
 }

   
void display() {
    s.setFill(shade);
    shape(s,v.x,v.y);
  }
  
void change(color c) {
    shade=c;
  }  

//Change every leaf nearby to this colour  
void nearest(color c) {
  for(int i = 0; i < leaves; i++) {
    float d = PVector.dist(L[i].v,v);
      if (d < 100) {
       L[i].change(c);  
      } 
    }
}

//Closest leaf to this leaf
int getClosest() {
float closest = 999999999;
int mynode = 0;
  for(int i = 0; i < leaves; i++) {
    float d = PVector.dist(L[i].v,v);
    if (d < closest) {
     closest = d;
      mynode = i;
    } 
}
return mynode;
}


// end of Claas    
}
