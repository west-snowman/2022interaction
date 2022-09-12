void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
}
int W=20;
void draw(){
  drawPokerCard(100,100, "黑桃1");
  drawPokerCard(130,150, "紅心1");
  drawPokerCard(160,200, "方塊1");
  drawPokerCard(190,250, "梅花1");
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
