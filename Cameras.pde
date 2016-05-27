
void cameras() {

  float x, y, w, h=0;
  int j=0;
  textSize(30);
  textFont(font);
  fill(255);


  image(cam1, 225, 50, 250, 150);
  text("CAM1", 225, 195);
  image(cam2, 475, 50, 250, 150);
  text("CAM2", 475, 195);
  image(cam3, 725, 50, 250, 150);
  text("CAM3", 725, 195);
  image(cam4, 225, 200, 250, 150);
  text("CAM4", 225, 345);
  image(cam5, 475, 200, 250, 150);
  text("CAM5", 475, 345);
  image(cam6, 725, 200, 250, 150);
  text("CAM6", 725, 345);


  boolean writing=cp5.get(Textfield.class, "Add plate").isFocus() || cp5.get(Textfield.class, "Send message").isFocus();

  if ((key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6')&& !writing)background(0);
  
  if (key=='1'&& !writing ) {
    image(cam1, 0, 0, 1200, 600) ;
    text("CAM1", 0, 590);
  }
  if (key=='2'&& !writing) {
    fill(255);
    image(cam2, 0, 0, 1200, 600) ;
    text("CAM2", 0, 590);
    opencv2.loadImage(cam2);
    opencv2.updateBackground();
   trakingCross(centroids2);
  }
  if (key=='3' && !writing) {
    fill(255);
    image(cam3, 0, 0, 1200, 600) ;
    text("CAM3", 0, 590);
    opencv3.loadImage(cam3);
    opencv3.updateBackground();
  trakingCross(centroids3);
  }
  if (key=='4' && !writing) {
    fill(255);
    image(cam4, 0, 0, 1200, 600) ;
    text("CAM4", 0, 590);
    opencv4.loadImage(cam4);
    opencv4.updateBackground();
    trakingCross(centroids4);
  }
  if (key=='5' && !writing) {
    fill(255);
    image(cam5, 0, 0, 1200, 600) ;
    text("CAM5", 0, 590);
    opencv5.loadImage(cam5);
    opencv5.updateBackground();
    trakingCross(centroids5);
  }
  if (key=='6' && !writing ) {
    image(cam6, 0, 0, 1200, 600) ;
    text("CAM6", 0, 590);
  }
  //int i=0;
  tracking();
}
void initializeCameras() {
  frameRate(30);
  cam1=new Movie(this, "vid1.mp4");
  cam2=new Movie(this, "vid2.mp4");
  cam3=new Movie(this, "vid3.mp4");
  cam4=new Movie(this, "vid4.mp4");
  cam5=new Movie(this, "vid5.mp4");
  cam6=new Movie(this, "vid6.mp4");

  cam1.play();
  cam2.play();
  cam3.play();
  cam4.play();
  cam5.play();
  cam6.play();
}
void movieEvent(Movie m) {
  m.read();
}