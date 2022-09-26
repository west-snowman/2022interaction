void setup(){
  size(500,500);
}
float x=250, y=250;//變數(位置)，浮點數數值會比較細緻
float vx=1.0, vy=-0.5;
void draw(){
  ellipse(x, y, 10, 10);//橢圓形
  x = x + vx; //往右跑
  y = y + vy; //往上跑
  if( x > 500 ) vx = -vx;
  if( y < 0 ) vy = -vy;
  if( x < 0 ) vx = -vx;
  if( y > 500 ) vy = -vy;
}
