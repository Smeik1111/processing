PImage img;
int singletilex;
int singletiley;
int row;
int column;
int tiles = 4;
int gap=5;
int newscalex;
PImage[] Bild = new PImage[tiles*tiles];

  
void settings(){
  //Load Image named "test1.jpg"
  img = loadImage("test1.jpg");

  // Scale image to an multiple of "tiles"
  if(img.width%tiles!=0){
    newscalex = img.width;
      while(newscalex%tiles!=0){
        newscalex+=1;
      }
  }else{
    newscalex=img.width;
  }
  
  //set x and y size of the single tiles
  singletilex = newscalex/tiles;
  singletiley = newscalex/tiles;
  
  //screensize
  size(newscalex+(gap*(tiles-1)),newscalex+(gap*(tiles-1)));
}

void setup(){
  background(0); 
  
  //display scaled image for get() function
  image(img,0,0,newscalex,newscalex);
    
  //capture single tiles
  for(int i = 0; i<Bild.length; ++i){
    if(i%tiles==0&&i!=0){
      column +=singletiley;
      row=0;
    }
    Bild[i] = get(row,column,singletilex,singletiley);
    row+=singletilex;
  }
  
  //clear picture
  background(0);
}

void draw() {
  //clear used variables
  row=0;
  column=0;
  
  //display Single tiles
  for(int i = 0; i<Bild.length; ++i){
    if(i%tiles==0&&i!=0){
      column+=singletiley+gap;
      row= 0;
    }
    image(Bild[i],row,column);
    row+=singletilex+gap;
  }   
}
