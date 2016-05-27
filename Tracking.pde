float tCentroid(int i) {
  if ( i==0) {
    return (1200-t1)/6;
  } else {
    return (200+((1200-t2)/8.5));
  }

}
float goTo(int i){
 
  return -(m.tpos[i]+(tCentroid(i)-m.tpos[i])*0.1);
  
}
void tracking() {

  float x, y, h, w;
  int j=0;
  x=y=h=w=0;
  for (int i=0; i<4; i++) {
    centroids2[i].set(-10000, -10000);
    centroids3[i].set(-10000, -10000);
    centroids4[i].set(-10000, -10000);
    centroids5[i].set(-10000, -10000);
  }

  for (Contour contour : opencv2.findContours()) {
    // opencv2.dilate();
    //opencv2.erode();
      if (j==4)j=0;
    x=contour.getBoundingBox().x;
    y=contour.getBoundingBox().y;
    h=(float)contour.getBoundingBox().getHeight();
    w=(float)contour.getBoundingBox().getWidth();
    if (w+h+(1200-x)/10>200 && y>100) {
      
      centroids2[j].x=x;
      centroids2[j].y=y;
      j++;
    }
  }

  for (int a=0; a<4; a++) {
    for (int b=0; b<4; b++) {
      if (centroids2[a].x-centroids2[b].x<50 && a!=b) {
        centroids2[a].set (-10000, -10000);
        break;
      }
    }
  }
  j=0;
    x=y=h=w=0;
  for (Contour contour : opencv3.findContours()) {
          if (j==4)j=0;
    x=contour.getBoundingBox().x;
    y=contour.getBoundingBox().y;
    h=(float)contour.getBoundingBox().getHeight();
    w=(float)contour.getBoundingBox().getWidth();
    if (w+h>150 && y<400 ) {
      t1=x;
      
      centroids3[j].x=x;
      centroids3[j].y=y;
      j++;
    
    }
  }
  for (int a=0; a<4; a++) {
    for (int b=0; b<4; b++) {
      if (centroids3[a].x-centroids3[b].x<50 && a!=b) {
        centroids3[a].set (-10000, -10000);
        break;
      }
    }
  }
  j=0;
    x=y=h=w=0;
  for (Contour contour : opencv4.findContours()) {
          if (j==4)j=0;
    x=contour.getBoundingBox().x;
    y=contour.getBoundingBox().y;
    h=(float)contour.getBoundingBox().getHeight();
    w=(float)contour.getBoundingBox().getWidth();
    if (w+h>100 ) {
      t2=x;
      centroids4[j].x=x;
      centroids4[j].y=y;
      j++;
      
    }
  }
  for (int a=0; a<4; a++) {
    for (int b=0; b<4; b++) {
      if (centroids4[a].x-centroids4[b].x<50 && a!=b) {
        centroids4[a].set (-10000, -10000);
        break;
      }
    }
  }
  j=0;
    x=y=h=w=0;
  for (Contour contour : opencv5.findContours()) {
          if (j==4)j=0;
    x=contour.getBoundingBox().x;
    y=contour.getBoundingBox().y;
    h=(float)contour.getBoundingBox().getHeight();
    w=(float)contour.getBoundingBox().getWidth();
    if (w+h>200 ) {
      centroids5[j].x=x;
      centroids5[j].y=y;
      j++;
    }
  }
  for (int a=0; a<4; a++) {
    for (int b=0; b<4; b++) {


      if (centroids5[a].x-centroids5[b].x<50 && a!=b) {
        centroids5[a].set (-10000, -10000);
        break;
      }
    }
  }
    x=y=h=w=0;

}