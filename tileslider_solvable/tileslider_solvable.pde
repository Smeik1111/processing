import java.util.Arrays;
PImage img;
int row;
int column;
int tiles = 4;
int gap=5;
PImage[] Bild = new PImage[tiles*tiles];
int[] arr = new int[tiles*tiles];
//boolean alligned =false;
solve solve;
String arr1;
boolean done=false;

//---------------------------------------------------------
void settings(){
  if(displayWidth>displayHeight){
    int x =displayWidth/2;
    while(x%tiles!=0){
     --x; 
    }
    size(x,x);
  }else{
     int x =displayHeight/2;
    while(x%tiles!=0){
     --x; 
    }
  }
 
  //find out which side is the shorter one
  //if(img.width>img.height){
  //  size(img.height+(gap*(tiles-1)),img.height+(gap*(tiles-1)));
  //}else{
  //  size(img.width+(gap*(tiles-1)),img.width+(gap*(tiles-1)));
  //}
}
//--------------------------------------------------
void setup(){
 
  //create arry with 16 elements
  for(int i = 0; i < arr.length;i++){
    arr[i] = i;
  }
  arr1 = Arrays.toString(arr);
  
   //Load Image named "test1.jpg"
  img = loadImage("test1.jpg");
  
  //4kpicsupport
  
  //square image
  image(img, 0, 0);
  if(img.width>img.height){
   img = get((img.width-img.height)/2,0,img.height,img.height);
  }else{
   img = get(0,(img.height-img.width)/2,img.width,img.width);
  }
  background(0);
  


  int tilesize = ((width-(gap*(tiles-1)))/tiles);
  //capture single tiles
  image(img,0,0,tilesize*tiles,tilesize*tiles);
  for(int i = 0; i<Bild.length; ++i){
    if(i%tiles==0&&i!=0){
      column += tilesize;
      row=0;
    }
    Bild[i] = get(row,column,tilesize,tilesize);
    row+=tilesize;
  }
  background(0);
  
  
  
  
  
  
  random(10000);  
  displaytiles();
  println(Arrays.toString(arr).equals(arr1));
  println(Arrays.toString(arr));
  println(arr1);
  int t = millis();
  int i=0;
  
    while(done == false){
      if(Arrays.toString(arr).equals(arr1)){
       print("Done in ");
       print(millis() -t);
       done = true;
     }

     int rand4 = (int) (Math.random() * 5);
     //int rand3 = (int) (Math.random() * 4);
     int rand3=1;
     switch (rand4) {
       case 1: left(rand3);
         break;
       case 2:  right(rand3);
         break;
       case 3:  up(rand3);
         break;
       case 4:  down(rand3);
         break;
     }
    if(millis()-t>1000){
      println(i+" tries per second");
      i=0;
      t=millis();
      displaytiles();
    }
    ++i;
  }
 
  

}


//--------------------------------------------------
void draw(){
  
}
//--------------------------------------------------
void allignWindow(){
  //if( alligned == false)
  //{
    frame.setLocation(400,333);
    //alligned = true;
  //}
}
void random(int x){
  int t = millis();
  for(int i=0;i<x;++i){
   int rand4 = (int) (Math.random() * 5);
   int rand3 = (int) (Math.random() * 4);
   switch (rand4) {
     case 1:  left(rand3);
       break;
     case 2:  right(rand3);
       break;
     case 3:  up(rand3);
       break;
     case 4:  down(rand3);
       break;
    }
  }

  println("randomized "+x+" times in "+(millis()-t)+" milliseconds");
}

void displaytiles(){
  row=0;
  column=0;
   
  //display Single tiles  
  for(int i = 0; i<Bild.length; ++i){
    if(i%tiles==0&&i!=0){
      column+=Bild[i].width+gap;
      row= 0;
      print("\n");
    }
    int x = arr[i];
    image(Bild[x],row,column);
    text(x,row+gap,column+gap*3);
    print(arr[i]+",");
    row+=Bild[i].width+gap;
  }  
  println("");

}

int pos0(){
  int i=0;
  while(arr[i] != 0){
  ++i;
  }
  return i;
}

void left(int x){
  //move the zero left x times
  for(int i=0; i<x;++i){
    int a = pos0();
    if((a)%tiles!=0){
      int change= arr[a];
      arr[a] = arr[a-1];
      arr[a-1] = change;
    }
  }  
}

void right (int x){
  //move the zero right x times
  for(int i =0; i<x;++i){
    int a = pos0();
    if((a+1)%tiles!=0){
      int change= arr[a];
      arr[a] = arr[a+1];
      arr[a+1] = change; 
    }
  }
}

void up(int x){
  //move the zero up x times
  for(int i=0; i<x; ++i){
    int a = pos0();
    if((a-tiles)>=0){
      int change= arr[a];
      arr[a] = arr[a-tiles];
      arr[a-tiles] = change;  
    }
  }   
}

void down(int x){
  //move the zero down x times
  for(int i=0; i<x; ++i){
    int a = pos0();
    if((a+tiles)<(tiles*tiles)){
      int change= arr[a];
      arr[a] = arr[a+tiles];
      arr[a+tiles] = change;
    }
  }   
}


//*/
//------------------------------------------

//---------------------------------------
