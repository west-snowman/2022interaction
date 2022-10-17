//存檔，mp3拉進來，Ctrl-K看檔案
import processing.sound.*; ///音樂功能
///使用外掛， 裝音樂外掛!

void setup(){
  SoundFile file = new SoundFile(this, "Intro Song_Final.mp3");
  file.play();
}
void draw(){
  
}
void mousePressed(){
  SoundFile file2 = new SoundFile(this, "In Game Music.mp3");
  file2.play();
}
