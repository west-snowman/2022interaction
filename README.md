# 2022interaction
 2022互動技術概論 上課程式
 
 將java改成p5.js https://pde2js.herokuapp.com/

## 9/19
### 0. 複製上週程式
### 1. 加上myShuffle函式
```c
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
  myShuffle();
}
void myShuffle(){
  String [] flower = {"黑桃","紅心","方塊","梅花"};//陣列[花色]
  face1 = flower[int(random(4))] + int(random(13)+1);
  face2 = flower[int(random(4))] + int(random(13)+1);
  face3 = flower[int(random(4))] + int(random(13)+1);
  face4 = flower[int(random(4))] + int(random(13)+1);
                                ///random(13)=0~12，因此要+1，int()要取整
}

void mousePressed(){
  myShuffle();
}

int W=20;
String face1, face2, face3, face4; ///牌的字

void draw(){
  drawPokerCard(100,100, face1 );
  drawPokerCard(130,150, face2 );
  drawPokerCard(160,200, face3 );
  drawPokerCard(190,250, face4 );
}///變數:          int=整數   ， String=字串

void drawPokerCard(int x, int y, String face){
  fill(255);
  rect(x-W/2, y-W/2, 150+W, 250+W, 20);
  fill(#E3BB1B);
  rect(x, y, 150, 250, 20);
  ///fill(0);
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1) fill(#FF0000);
  else fill(0);
  textSize(30);
  text(face, x+10,y+35);
}
```

### 2. 想要做出52張的撲克牌
```c
void setup(){
  size(700,700);
}
void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){
    int x= (i%10)*60; ///餘數:0~9
    int y= int(i/10)*120; ///除數:0~9
    rect( x,y, 60,120 );
  }
}
```

### 3. 印出52張花色的撲克牌
```c
void setup(){
  size(700,700);
  PFont font = createFont("標楷體",10);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K"
};

void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){
    int x= (i%10)*60; ///餘數:0~9
    int y= int(i/10)*120; ///除數:0~9
    fill(255); rect( x,y, 60,120 );
    fill(0);   text(faces[i], x+25, y+80);
  }
}
```

### 4. 修改印出的花色顏色 + 字體大小 + 修改排版
```c
void setup(){
  size(800,600);
  PFont font = createFont("標楷體",16);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K"
};

void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){
    int x= (i%13)*60; ///餘數:0~9
    int y= int(i/13)*120; ///除數:0~9
    fill(255); rect( x,y, 60,120 );
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0); ///==-1:不等於
    else fill(255,0,0); ///紅色
    text(faces[i], x+10, y+60);
  }
}
```

### 5-1. 剛剛的程式加上mousePressed(滑鼠左鍵點擊): 交換牌
```c
void setup(){
  size(800,600);
  PFont font = createFont("標楷體",16);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K"
};

void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){
    int x= (i%13)*60; ///餘數:0~9
    int y= int(i/13)*120; ///除數:0~9
    fill(255); rect( x,y, 60,120 );
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0); ///==-1:不等於
    else fill(255,0,0); ///紅色
    text(faces[i], x+10, y+60);
  }
}

void mousePressed(){
  int a = int(random(52));
  int b = int(random(52));
  //目標:face[a] vs. face[b] 交換
  
  String temp = faces[a];
  faces[a] = faces[b];
  faces[b] = temp;
}
```

### 5-2. 剛剛的程式 將mousePressed 換成 mouseDragged(滑鼠左鍵拖拉): 交換牌
```c
void setup(){
  size(800,600);
  PFont font = createFont("標楷體",16);
  textFont(font);
}
String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K"
};

void draw(){
  background(#FFFFF2);
  for(int i=0; i<52; i++){
    int x= (i%13)*60; ///餘數:0~9
    int y= int(i/13)*120; ///除數:0~9
    fill(255); rect( x,y, 60,120 );
    if( faces[i].indexOf("紅心")==-1 && faces[i].indexOf("方塊")==-1) fill(0); ///==-1:不等於
    else fill(255,0,0); ///紅色
    text(faces[i], x+10, y+60);
  }
}

void mouseDragged(){
  int a = int(random(52));
  int b = int(random(52));
  //目標:face[a] vs. face[b] 交換
  
  String temp = faces[a];
  faces[a] = faces[b];
  faces[b] = temp;
}
```

### 6. 整合剛剛的洗牌程式 到上周的程式碼裡
```c
void setup(){
  size(500,500);
  PFont font = createFont("標楷體", 40);
  textFont(font);
  myShuffle();
}

String [] faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K"
};

void myShuffle(){
  for(int k=0; k<100000; k++){
    int a = int(random(52));
    int b = int(random(52));
    //目標:face[a] vs. face[b] 交換
    
    String temp = faces[a];
    faces[a] = faces[b];
    faces[b] = temp;
  }
  face1 = faces[0];
  face2 = faces[1];
  face3 = faces[2];
  face4 = faces[3];
}

void mousePressed(){
  myShuffle();
}

int W=20;
String face1, face2, face3, face4; ///牌的字

void draw(){
  drawPokerCard(100,100, face1 );
  drawPokerCard(130,150, face2 );
  drawPokerCard(160,200, face3 );
  drawPokerCard(190,250, face4 );
}///變數:          int=整數   ， String=字串

void drawPokerCard(int x, int y, String face){
  fill(255);
  rect(x-W/2, y-W/2, 150+W, 250+W, 20);
  fill(#E3BB1B);
  rect(x, y, 150, 250, 20);
  ///fill(0);
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1) fill(#FF0000);
  else fill(0);
  textSize(30);
  text(face, x+10,y+35);
}
```

## 9/26
### 彈珠遊戲
### 1. 做一顆球往右上移動(影像會重疊...)
```c
void setup(){
  size(500,500);
}
int x=250, y=250;//變數(位置)
void draw(){
  ellipse(x, y, 10, 10);//橢圓形
  x = x + 1; //往右跑
  y = y - 1; //往上跑
}
```

### 2. 球撞到四周的牆會反彈
```c
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
```

### 3. 多一個反彈的板子
```c
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
  if( y > 470 && x>boardX && x<boardX+100) vy = -vy;
}
```

### 4. 精化程式碼 and 按滑鼠左右鍵板子可以變長變短
```c
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
```
### 圍棋
### 5. 
```c
void setup(){
  size(500,500);
}

void draw(){
  //用迴圈畫很多棋子
  for(int x=50; x<=450; x+=50){
    for(int y=50; y<=450; y+=50){
      ellipse(x, y, 50, 50);
    }
  }
}
```

### 6. 用陣列畫圓+顏色
```c
void setup(){
  size(500,500);
}
int [][]go = {
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,1,0,0,0,0},
  {0,0,0,0,0,0,0,0,1},
  {0,1,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,1,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,1,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
};
void draw(){
  //用迴圈畫很多棋子
  for(int i=0; i<9; i++){ //左手i，對應y座標
    for(int j=0; j<9; j++){ //右手j，對應x座標
      if(go[i][j]==1) fill(0);
      else fill(255);
      //        x         y
      ellipse(50+j*50, 50+i*50, 50, 50);
    }
  }
}
```

### 7. 畫出棋盤上的線
```c
void setup(){
  size(500,500);
}
int [][]go = {
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,1,0,2,0,0},
  {0,0,0,0,0,0,0,0,1},
  {0,1,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,1,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {0,1,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
};
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
```

### 8. 可以互動的玩五圍棋了~
```c
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
```

