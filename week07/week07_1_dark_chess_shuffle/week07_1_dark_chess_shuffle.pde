int [][]show={
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0}
};///再翻牌前，都不會show出來
int [][]board={
  {1, 2, 2, 3, 3, 4, 4, 5},
  {7, 7, 7, 7, 7, 7, 7, 7},
  {-1, -2, -2, -3, -3, -4, -4, -5},
  {-7, -7, -7, -7, -7, -7, -7, -7},
};//1:將 2:士 3:象 4:車 5:馬 6:炮 7:卒
String [] name = {"將", "士", "象", "車", "馬", "包", "卒"};
String [] name2 = {"帥", "仕", "相", "俥", "瑪", "炮", "兵"};
void setup() {
  size(500, 300);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  for(int k=0; k<1000; k++){///洗牌1000次
    shuffle_one();
  }
}
void shuffle_one(){
  int i1 = int(random(4)), j1 = int(random(8));
  int i2 = int(random(4)), j2 = int(random(8));
  int temp = board[i1][j1];
  board[i1][j1]=board[i2][j2];
  board[i2][j2]=temp;
}

void draw() {
  background(#D8B532);
  for (int x=50; x<=450; x+=50) { ///等差級數
    line(x, 50, x, 250);
  }
  for (int y=50; y<=250; y+=50) { ///10條
    line(50, y, 450, y);
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<8; j++) {
      if(show[i][j]==0){
        fill(255);
        ellipse(50+25+j*50, 50+25+i*50, 40, 40);
      }
      else{
        int id = board[i][j];
        drawChess(50+25+j*50, 50+25+i*50, id);
      }
    }
  }
}
void mousePressed(){
    shuffle_one();
    for (int i=0; i<4; i++) {///這是錯的，要改!!
      for (int j=0; j<8; j++) {
        if (dist(mouseX, mouseY, 50+25+j*50, 50+25+i*50)<20) {
          if(show[i][j]==0) show[i][j] = 1; //show出來
          //下次上
        }
      }
    }
}
void drawChess(int x, int y, int id) {
  fill(255);
  ellipse(x, y, 40, 40);
  if (id>0) {
    fill(0);
    text(name[id-1], x, y-3);/////老師程式有錯
  } else {
    fill(255, 0, 0);
    text(name2[-id-1], x, y-3);
  }
}
