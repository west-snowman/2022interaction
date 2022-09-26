void setup(){
  size(500,500);
}
float x=250, y=250;//變數(位置)，浮點數數值會比較細緻
float vx=2.0, vy=-1.5;
float boardX, boardY=470, boardW=100, boardH=20;
void draw(){
  background(#FFFFF2); //背景，去除殘影
  boardX = mouseX-boardW/2; //讓滑鼠在板子中間移動
  rect(boardX, boardY, boardW, boardH, 3); //控制的板子
  ellipse(x, y, 10, 10);//橢圓形
  x = x + vx; //往右跑
  y = y + vy; //往上跑
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx;
  if(( y > boardY && y < boardY + boardH ) && 
     ( x > boardX && x < boardX + boardW )){ //x->跟板子的長度有關
       vy = -vy; 
       vx += (mouseX-pmouseX)/2; ///mouse的移動速度
     }
  if(mousePressed && mouseButton==LEFT) boardW *= 1.01;
  if(mousePressed && mouseButton==RIGHT) boardW *= 0.99;
}
