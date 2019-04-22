int difficulty =  1  ; //small is harder, 1 is normal
int[][] landingpad = new int[4][3];
float[] world;
float[] xyr = {100, 100, 0};//new float[3];
PShape spaceship;
double velocityvertical=0;
double velocityhorizontal=0;
double timedeltatime=0;
double last=0;
boolean up;
boolean left;
boolean right;



//adjustable
int fuel= 1000;
double gravity=0.2;
double drag=0.1;
double rotationspeed=1;
double burnintensity=0.3;


void setup() {
  size(500, 500);
  surface.setResizable(true);
  background(0);
  noSmooth();
  world = new float[width];
  textSize(height/50);

  //adjustable
  float noise = 200;  //less is more noise

  //create spaceship
  spaceship = createShape();
  spaceship.beginShape();
  // You can set fill and stroke
  spaceship.fill(102);
  spaceship.stroke(255);
  spaceship.strokeWeight(0);
  // Here, we are hardcoding a series of vertices
  spaceship.vertex(5, 0);
  spaceship.vertex(10, 10);
  spaceship.vertex(0, 10);
  spaceship.endShape(CLOSE);


  generateworld(world, landingpad, noise, spaceship.width);
  drawworld(world);
}


void draw() {
  physics(xyr);
  drawworld(world);
  spaceship(xyr);
  wincondition();
  gui();
}

void generateworld(float[] world, int[][]landingpad, float noise, float shipsize) {
  for (int i=0; i<world.length; ++i) {
    world[i] = (height/5)+(int)(noise((float)i/noise) * (height-(height/5)));
  }
  for (int i=0; i<landingpad.length; ++i) {
    landingpad[i][2] = Math.round(random(1, 3));
    float landingpadsize = landingpad[i][2]*(shipsize*difficulty);
    landingpad[i][0]= (int)(((width/4)*i)+(int)random((float)(width/4-landingpadsize)));
    landingpad[i][1]= landingpad[i][0]+(int)landingpadsize;
  }
  // Landingpad[x1][x2][multiplier]
}


void physics(float[] xyr) {
  timedeltatime = (float)millis()/1000-last;
  velocityvertical += gravity*timedeltatime;
  if (velocityhorizontal>0) {
    velocityhorizontal -= drag*timedeltatime*velocityhorizontal;
  }
  if (velocityhorizontal<0) {
    velocityhorizontal += drag*timedeltatime*velocityhorizontal;
  }
  if (velocityvertical>0) {
    velocityvertical -= drag*timedeltatime*velocityvertical;
  }
  if (velocityvertical<0) {
    velocityvertical += drag*timedeltatime*velocityvertical;
  }
  
  if (up==true&&fuel>0) {
    velocityhorizontal+=(burnintensity*sin(xyr[2])*timedeltatime);
    velocityvertical-=(burnintensity*cos(xyr[2])*timedeltatime);
    --fuel;
  }
  if (right==true) {
    println("rigth");
    xyr[2]+= (rotationspeed*timedeltatime);
  }
  if (left==true) {
    println("left");
    xyr[2]-= (rotationspeed*timedeltatime);
  }

  xyr[0] += velocityhorizontal;
  xyr[1] += (float)velocityvertical; 
  last=(float)millis()/1000;  //could theoretically be missused to timedeltatime to save on variables
}

void drawworld(float[] world) {
  background(0);
  for (int i=0; i<world.length; ++i) {
    stroke(200);
    line(i, world[i], i, width);
    //stroke(100);
    //line(i, world[i], i+1, world[i+1]);
  }
  for (int i=0; i<landingpad.length; ++i) {
    float y = world[landingpad[i][1]];
    if (world[landingpad[i][1]]>world[landingpad[i][0]]) {
      y = world[landingpad[i][0]];
    }
    //line(landingpad[i][0],y,landingpad[i][1],y);
    for (int n=landingpad[i][0]; n<landingpad[i][1]; ++n) {
      stroke(255);
      line(n, world[n], n, y);      //line from world to plattform
      for (int b=1; b<(height/20); ++b) {
        stroke(constrain((int)(200-((255/20)*b)), 0, 255));
        line(n, y-b, n, y-b);
      }
    }
    textAlign(CENTER);
    text("x"+landingpad[i][2], (landingpad[i][0]+landingpad[i][1])/2, y-height/200);
  }
}

void spaceship(float[] xyr) {
  translate(xyr[0], xyr[1]);
  rotate(xyr[2]);
  stroke(255);
  shape(spaceship, 0-(spaceship.width/2), 0+(spaceship.height-(height/27)));
  point(0, 0);

  //fill(100);
  //circle(0,0,5);
}

void wincondition() {
}
void gui() {
  //println(fuel);
}

void keyPressed() {
  if (keyCode== UP) {
    up=true;
  }
  if (keyCode==RIGHT) {
    right=true;
  }
  if (keyCode==LEFT) {
    left=true;
  }
}
void keyReleased() {
  if (keyCode== UP) {
    up=false;
  }
  if (keyCode==RIGHT) {
    right=false;
  }
  if (keyCode==LEFT) {
    left=false;
  }
}
