void setup(){
  size(400,300);
}
float fruitX=200, fruitY=300;///水果的位置 X、Y有小數點，精確
float fruitVX=2, fruitVY=-13; ///水果的速度 VX VY
boolean flying=true;
void draw(){
  background(255,255,0);//背景
  
  ellipse(fruitX, fruitY, 50, 50);//圓
  if(flying){ ///如果再飛，水果的位置會改變
    fruitX += fruitVX;
    fruitY += fruitVY;
    fruitVY += 0.98/3;  //重力加速度
  }
}
void keyPressed(){
  flying=false;
  fruitReset(); ///重新準備另一個水果
}
void fruitReset(){
  fruitX=random(100,300);
  fruitY=300;//固定飛的高度
  fruitVX=random(-2,+2);
  fruitVY=-13;
  flying=true;
}
