import java.sql.Time;
import java.util.Arrays;

  float[] xy = new float[2];
  double anglesteigung=0;
  long t1=0;
  float farbe;
  int i = 0;
      
    //changeable parameters
    float radius = 20;
    double lengthbetween = 20;
    double lengthdilation = .1;
    double angle = 0;
    int time = 500;
    float timescale = 3;
    //---
  
  void setup(){
    size(700,700);
    surface.setResizable(true);
    colorMode(HSB);
    noStroke();
    xy[0] = width / 2;
    xy[1] = height / 2;
    
  }
   
  void draw() {
    //reset condition
    //if(xy[0] <= width || xy[0] >= 0 || xy[1] <= height || xy[1] >= 0){
    //if(i>100){
    if(time < millis()- t1 ) {
    t1 = millis();
    
    xy[0] = width / 2;
    xy[1] = height / 2;
    i=0;
    anglesteigung+=0.1;
    }
   
    if(farbe<(255*timescale)){farbe+=1;}else{farbe=0;}
    color c = color((int)(farbe/timescale), 255, 255);
    fill(c);
    circle(xy[0],xy[1], radius*2);
    xy[0] += (lengthbetween * Math.cos(Math.toRadians(angle)));
    xy[1] += (lengthbetween * Math.sin(Math.toRadians(angle)));
    //lengthbetween += lengthdilation;
    angle += anglesteigung;  
    ++i;
    //print(Arrays.toString(xy));
  }
