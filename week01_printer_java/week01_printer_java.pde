void setup(){///只會執行一次
  size(500,500);
  background(#F0DAA5);
  stroke(255,0,0); ///筆觸->紅色
}
void draw(){
  if( mousePressed ){
    line(mouseX,mouseY, pmouseX,pmouseY);
  }
}
void keyPressed(){
  if(key == '1') stroke(#FA0F0F);
  if(key == '2') stroke(#FAAC0F);
  if(key == '3') stroke(#F5FA0F);
  if(key == '4') stroke(#45FA0F);
  if(key == '5') stroke(#0FF4FA);
  if(key == '5') stroke(#B70FFA);
}
