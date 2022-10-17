//存檔，mp3拉進來，Ctrl-K看檔案
import processing.sound.*; ///音樂功能
///使用外掛， 裝音樂外掛!
///Sketch-library-manage，找sound 下載第6個

SoundFile file1, file2, file3, file4; ///不用一直重複讀檔
void setup(){
  file1 = new SoundFile(this,"Intro Song_Final.mp3");
  file2 = new SoundFile(this,"In Game Music.mp3");
  file3 = new SoundFile(this,"Monkey 1.mp3");
  file4 = new SoundFile(this,"Monkey 2.mp3");
  
  file1.play(); ///程式執行，播放第1個mp3(播一次而已)
}
void draw(){
  
}
void mousePressed(){ ///點滑鼠，播放第2個mp3
  file2.play();
}
void keyPressed(){ ///按鍵盤任意鍵，播放第3個mp3
  file3.play();
}
