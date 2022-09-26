void setup(){
  size(500,500);
}
int x=250, y=250;//變數(位置)
void draw(){
  ellipse(x, y, 10, 10);//橢圓形
  x = x + 1; //往右跑
  y = y - 1; //往上跑
}
