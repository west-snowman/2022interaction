void setup(){
  size(500,500);
}
int W=20;
void draw(){
  drawPokerCard(100,100, "S1");
  drawPokerCard(130,150, "H1");
  drawPokerCard(160,200, "D1");
  drawPokerCard(190,250, "C1");
}///變數:          int=整數   ， String=字串
void drawPokerCard(int x, int y, String face){
  fill(255);
  rect(x-W/2, y-W/2, 150+W, 250+W, 20);
  fill(#E3BB1B);
  rect(x, y, 150, 250, 20);
  fill(0);
  textSize(30);
  text(face, x+10,y+35);
}
