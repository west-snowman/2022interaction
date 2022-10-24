void setup(){
  size(400,300);
  textSize(50);
  fill(255,0,0); ///紅字
}
int stage=1; ///1、2、3
void draw(){
  background(255,255,0);
  fill(255,0,0);
  textSize(80);
  if(stage==1){///舞台1
    text("stage 1",100,100);
  }
  else if(stage==2){///舞台2
    text("stage 2",100,100);
  }
}
void mousePressed(){
  if(stage==1) stage=2;
  else if(stage==2) stage=1;
}
