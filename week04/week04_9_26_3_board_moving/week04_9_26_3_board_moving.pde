void setup(){
  size(500,500);
}
float x=250, y=250;//變數(位置)，浮點數數值會比較細緻
float vx=2.0, vy=-1.5;
void draw(){
  background(#FFFFF2); //背景，去除殘影
  int boardX = mouseX;
  rect(boardX, 470, 100, 20, 3); //控制的板子
  ellipse(x, y, 10, 10);//橢圓形
  x = x + vx; //往右跑
  y = y + vy; //往上跑
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx;
  if( y > 470 && x>boardX && x<boardX+100) vy = -vy; //x->跟板子的長度有關
}
