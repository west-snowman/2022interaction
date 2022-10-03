int [][]board={
  {4, 5, 3, 2, 1, 2, 3, 5, 4},
  {0, 0, 0, 0, 0, 0, 0, 0, 0},
  {0, 6, 0, 0, 0, 0, 0, 6, 0},
  {7, 0, 7, 0, 7, 0, 7, 0, 7},
};//1:將 2:士 3:象 4:車 5:馬 6:炮 7:卒
String [] name = {"將","士","象","車","馬","炮","卒"};
void setup() {
  size(500, 550);
  PFont font = createFont("標楷體", 30);
  textFont(font);
  textAlign(CENTER,CENTER);
}
void draw() {
  for (int x=50; x<=450; x+=50) { ///等差級數
    line(x, 50, x, 250);
    line(x, 300, x, 500);
  }
  for (int y=50; y<=500; y+=50) { ///10條
    line(50, y, 450, y);
  }
  for(int i=0; i<4; i++){
    for(int j=0; j<9; j++){
      int id = board[i][j];
      if(id==0) continue;
      text(name[id-1], 50+j*50, 50+i*50);
    }
  }
}
