void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
  myShuffle();
}
void myShuffle(){
  String [] flower = {"黑桃","紅心","方塊","梅花"};//陣列[花色]
  face1 = flower[int(random(4))] + int(random(13)+1);
  face2 = flower[int(random(4))] + int(random(13)+1);
  face3 = flower[int(random(4))] + int(random(13)+1);
  face4 = flower[int(random(4))] + int(random(13)+1);
                                ///random(13)=0~12，因此要+1，int()要取整
}

void mousePressed(){
  myShuffle();
}

int W=20;
String face1, face2, face3, face4; ///牌的字

void draw(){
  drawPokerCard(100,100, face1 );
  drawPokerCard(130,150, face2 );
  drawPokerCard(160,200, face3 );
  drawPokerCard(190,250, face4 );
}///變數:          int=整數   ， String=字串

void drawPokerCard(int x, int y, String face){
  fill(255);
  rect(x-W/2, y-W/2, 150+W, 250+W, 20);
  fill(#E3BB1B);
  rect(x, y, 150, 250, 20);
  ///fill(0);
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1) fill(#FF0000);
  else fill(0);
  textSize(30);
  text(face, x+10,y+35);
}
