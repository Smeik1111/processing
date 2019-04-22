class solve{
  public boolean test(){
    print("test");
    while(true){
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
     if(arr.equals(arr1)==true){
       print("Done");
       printArray(arr);
       return true;
         }
       }
    }
}
