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

### 5-1. 剛剛的程式 將mousePressed 換成 mouseDragged(滑鼠左鍵拖拉): 交換牌
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
