void setup(){
  size(700,700);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){
    int x= (i%10)*60; ///餘數:0~9
    int y= int(i/10)*120; ///除數:0~9
    rect( x,y, 60,120 );
  }
}
