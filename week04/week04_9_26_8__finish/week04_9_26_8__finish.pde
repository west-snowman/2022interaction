void setup(){
  size(500,500);
}
int [][]go = {
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
};
int N=0; //目前有幾個棋子
void mousePressed(){
  int j = (mouseX-25)/50; //右手j，對應x座標
  int i = (mouseY-25)/50; //左手i，對應y座標
  go[i][j] = (N%2==0) ? 1 : 2 ; //if(N%2==0) 用1，否則2
  N++;
}

void draw(){
  background(246, 194, 108); ///棋盤顏色
  for(int i=1; i<=9; i++){ //迴圈
    line(50, 50*i, 450, 50*i); //橫線
    line(50*i, 50, 50*i, 450); //縱線
  }
  
  for(int i=0; i<9; i++){ //左手i，對應y座標
    for(int j=0; j<9; j++){ //右手j，對應x座標
      if(go[i][j]==1){
        fill(0); //黑棋
        ellipse(50+j*50, 50+i*50, 40, 40);
      }
      else if(go[i][j]==2){
        fill(255); //白棋
        ellipse(50+j*50, 50+i*50, 40, 40);
      }
    }
  }
}
