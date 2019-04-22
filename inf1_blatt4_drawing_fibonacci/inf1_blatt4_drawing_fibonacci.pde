import java.sql.Time;
import java.util.Arrays;

  float[] xy = new float[2];
  int anglesteigung=-1;
  long t1=0;
  int farbe;
  
  void setup(){
    size(1000,1000);
    surface.setResizable(true);
    colorMode(HSB);
    
  }
   
  void draw() {
    //changeable parameters
    float radius = 20;
    double lengthbetween = 1;
    double lengthdilation = 1;
    int angle = 0;
    int time = 500;
    //-------------------------
    
    xy[0] = width / 2;
    xy[1] = height / 2;
    
    
    if(time < millis()- t1 ) {
      ++anglesteigung;
      t1 = millis();
    }
    farbe+=1;
    if(farbe>255*4){farbe=0;}
    drawfibonaccistars(radius,lengthbetween, lengthdilation, angle, anglesteigung);
    print(Arrays.toString(xy));
  }

  public void drawfibonaccistars(float radius, double lengthbetween, double lengthdilation, int angle, int anglesteigung) {
    while (xy[0] <= width && xy[0] >= 0 && xy[1] <= height && xy[1] >= 0) {
      object(xy, radius, farbe);
      xy = fibonacci(xy, lengthbetween, angle);
      lengthbetween += lengthdilation;
      angle += anglesteigung;
    }
  }

  public float[] fibonacci(float[] xy, double lengthbetween, int angle) {
    xy[0] += (lengthbetween * Math.cos(Math.toRadians(angle)));
    xy[1] += (lengthbetween * Math.sin(Math.toRadians(angle)));
    return xy;
  }

  public void object(float[] xy, float radius, int farbe) {
      noStroke();
      color c = color(farbe/4, 255, 255);
      fill(c);
      circle(xy[0],xy[1], radius*2);
  }
