void init() {
  background(background.x, background.y, background.z);
  image(logo, posLogo.x, posLogo.y);
  image(start, 527, 455);
  if (keyCode==ENTER||mousePressed==true && mouseX>527 && mouseX<660 && mouseY>455 && mouseY<500) state="initTools";
}
void initTools() {
  background(background.x, background.y, background.z);//191,242,238

  background.x=background.x+(191-background.x)*0.01;
  background.y=background.y+(242-background.y)*0.01;
  background.z=background.z+(238-background.z)*0.01;

  pushMatrix();
  image(logo, posLogo.x, posLogo.y);
  tint(255, 255-background.x*1.3-64);
  popMatrix();
  available.displayAvailable();
  displayTT();
  
  fill(0);
  cp5.addTextfield("Add plate")
    .setPosition(1051, 522)
    .setSize(98, 30)
    .setFont(font2)
    .setFocus(false)
    .setColor(color(255))
    ;
    
    cp5.addTextfield("Send message")
    .setPosition(1051, 222)
    .setSize(98, 30)
    .setFont(font2)
    .setFocus(false)
    .setColor(color(255))
    ;
   ButtonBar b = cp5.addButtonBar("bar")
     .setPosition(1031, 190)
     .setSize(160, 20)
     .addItems(split("Clear Info Alert Server"," "))
     ;
  b.onRelease(new CallbackListener(){
    public void controlEvent(CallbackEvent ev) {
      ButtonBar bar = (ButtonBar)ev.getController();
      msgType=bar.hover();
      println(bar.hover());
      
    }
  });
  
  

  if (background.x>140)state="initMap";
  
}
void initMap() {
  tint(255);
  background(background.x, background.y, background.z);
  image(littleLogo, 20, 20);
  m.displayModeALL();
  m.initCars();
  

  

  plates.displayPlatesModeALL();
  available.displayAvailable();
  displayTT();
  m.positionAll.y=m.positionAll.y+(430-m.positionAll.y)*0.05;
  if (m.positionAll.y<431)state="initCameras";
}
void fullLoad() {
   
  background(background.x, background.y, background.z);
  fill(255);
  image(littleLogo, 20, 20);
  image(trackingImage,925,550);

if (!tracking && mousePressed && timer(100) && mouseX>925 && mouseX<1025 && mouseY>550 && mouseY<650) tracking=true;
  if(tracking && !cp5.get(Textfield.class,"Add plate").isFocus() && !cp5.get(Textfield.class,"Send message").isFocus()
) {  
    m.displayModeMAP();
    displayTT();
    fill(255);
    image(back,920,500);
    if (tracking && mousePressed && timer(400) && mouseX>920 && mouseX<1020 && mouseY>500 && mouseY<600) tracking=false;
  } else {
    manualUpdate();
    available.displayAvailable();
    displayTT();
    dbButton();
    logoInfo();
    m.displayModeALL();
    m.initCars();

      cameras();
              plates.displayPlatesModeALL();  

    if(mousePressed)key=' ';

  }
}