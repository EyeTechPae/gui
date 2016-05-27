import processing.video.*;
import controlP5.*;
//socket
import processing.net.*;
//motion
import gab.opencv.*;

OpenCV opencv5, opencv2, opencv3, opencv4;

Client myClient;
ControlP5 cp5;
long timer;
int msgType;
String textValue="";
//
Movie cam1, cam2, cam3, cam4, cam5, cam6;
PImage logo, start, littleLogo, dbButton, back, trackingImage;
PFont font, font2, font3;
Plates plates;
Map m;
Available available;
PVector rotM, posM1, posM2, rotP, posP, rotA, posA, posLogo;
PShape whiteCar;
PShape parking;
boolean dbReady, tracking;
String state;
PVector background;
PVector[] realPositions;
PVector[] centroids5, centroids2, centroids3, centroids4;
float t1, t2;

void setup() {
  background(0);
  surface.setTitle("EyeTech"); 
  surface.setIcon(littleLogo);

  cp5=new ControlP5(this);

  timer=0;
  msgType=0;
  t1=t2=0;
  state="init";
  dbReady=true;
  tracking=false;
  size(1200, 600, OPENGL);


  logo=requestImage("logo.png");
  start=requestImage("start.png");
  littleLogo=requestImage("littlelogo.png");
  dbButton=requestImage("database-logo.png");
  back=requestImage("back.png");
  trackingImage=requestImage("tracking.png");
  font=createFont("airstrike.ttf", 32);
  font2=createFont("Anke.ttf", 12);
  font3=createFont("airstrike.ttf", 20);




  rotM=new PVector(-PI/15, PI/10, 0);
  posM1=new PVector(0, 0, 0);
  posM2=new PVector(800, 600, 0); //init map outside display
  rotP=new PVector(0, 0, 0);
  posP=new PVector(1050, 340, 0);
  rotA=new PVector(0, 0, 0);
  posA=new PVector(165, 550, 0);
  posLogo=new PVector(450, 100, 0);
  background=new PVector(0, 0, 0);
  available=new Available(rotA, posA, 0, 4);
  m=new Map(rotM, posM1, posM2);
  plates=new Plates(rotP, posP);

  myClient=new Client(this, "46.101.132.172", 3336); 

  opencv5=new OpenCV(this, 1280, 720);
  opencv2=new OpenCV(this, 1280, 720);
  opencv3=new OpenCV(this, 1280, 720);
  opencv4=new OpenCV(this, 1280, 720);

  opencv5.startBackgroundSubtraction(20, 20, 0.5);
  opencv2.startBackgroundSubtraction(20, 20, 0.5);
  opencv3.startBackgroundSubtraction(20, 20, 0.5);
  opencv4.startBackgroundSubtraction(20, 20, 0.5);

  whiteCar=loadShape("cotxe.obj");
  whiteCar.scale(1.1);
  parking=loadShape("parquingReversed.obj");
  parking.scale(1.5);
  initializeCameras();
  centroids2=new PVector[4];
  centroids3=new PVector[4];
  centroids4=new PVector[4];
  centroids5=new PVector[4];
  for (int i=0; i<4; i++) {
    centroids5[i]=new PVector(-10000, -10000);
    centroids2[i]=new PVector(-10000, -10000);
    centroids3[i]=new PVector(-10000, -10000);
    centroids4[i]=new PVector(-10000, -10000);
  }


  realPositions=new PVector[44];
  for (int i=0; i<43; i++) {

    realPositions[i]=new PVector(0, 0);
  }
 
  frame.setTitle("EyeTech");
}
void draw() {
  

  lights();
  ambientLight(102, 102, 102);
  noStroke();
  smooth();
  if (state=="init") init();
  if (state=="initTools") initTools();
  if (state=="initMap")initMap();
  if (state=="initCameras")fullLoad();

}