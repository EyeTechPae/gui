class Map {   //<>//
  Car[] cars;
  Car[] tcars; 
  String[] splitCentroids;
  float[] tpos;
  float[] trot;
  PVector rotation;
  PVector position1, positionAll, originalPosition;
  int carNumber;
  int currentFreeCars;
  boolean scaled, waiting;


  Map(PVector _rotation, PVector _position1, PVector _positionAll) {

    rotation=_rotation.get();
    position1=_position1.get();
    positionAll=_positionAll.get();
    originalPosition=positionAll.get();
    // initialize all cars
    PVector pos, rot;
    carNumber=43;//!!
    int currentFreeCars=0;
    scaled=false;
    waiting=true;




    cars=new Car[carNumber];
    tcars=new Car[15];
    rot=new PVector(0, 0, 0);
    pos=new PVector(-40, 52, 372);
    cars[0]=new Car(0, 0, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 360);
    cars[1]=new Car(0, 1, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 348);
    cars[2]=new Car(0, 2, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 336);
    cars[3]=new Car(0, 3, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 324);
    cars[4]=new Car(0, 4, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 312);
    cars[5]=new Car(0, 5, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 300);
    cars[6]=new Car(0, 6, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 288);
    cars[7]=new Car(0, 7, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 276);
    cars[8]=new Car(0, 8, rot, pos);


    rot.set(0, 0, 0);
    pos.set(-40, 52, 169);
    cars[9]=new Car(0, 9, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 153);
    cars[10]=new Car(0, 10, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 137);
    cars[11]=new Car(0, 11, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 121);
    cars[12]=new Car(0, 12, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 105);//X
    cars[13]=new Car(0, 13, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 89);
    cars[14]=new Car(0, 14, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 73);
    cars[15]=new Car(0, 15, rot, pos);
    rot.set(0, 0, 0);
    pos.set(-40, 52, 57);
    cars[16]=new Car(0, 16, rot, pos);
    ////second row
    rot.set(0, PI, 0);
    pos.set(90, 52, -410);
    cars[17]=new Car(0, 17, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -398);
    cars[18]=new Car(0, 18, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -386);
    cars[19]=new Car(0, 19, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -374);
    cars[20]=new Car(0, 20, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -362);
    cars[21]=new Car(0, 21, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -350);
    cars[22]=new Car(0, 22, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -338);

    cars[23]=new Car(0, 23, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -326);
    cars[24]=new Car(0, 24, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -314);
    cars[25]=new Car(0, 25, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -302);
    cars[26]=new Car(0, 26, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -290);
    cars[27]=new Car(0, 27, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -278);
    cars[28]=new Car(0, 28, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -266);
    cars[29]=new Car(0, 29, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -254);
    cars[30]=new Car(0, 30, rot, pos);
    ///D6
    rot.set(0, PI, 0);
    pos.set(90, 52, -200);
    cars[31]=new Car(0, 31, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -187);
    cars[32]=new Car(0, 32, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -174);
    cars[33]=new Car(0, 33, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -161);//xA tots
    cars[34]=new Car(0, 34, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -148);
    cars[35]=new Car(0, 35, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -135);
    cars[36]=new Car(0, 36, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -122);
    cars[37]=new Car(0, 37, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -109);
    cars[38]=new Car(0, 38, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -96);
    cars[39]=new Car(0, 39, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -84);
    cars[40]=new Car(0, 40, rot, pos);
    rot.set(0, PI, 0);
    pos.set(90, 52, -71);
    cars[41]=new Car(0, 41, rot, pos);

    rot.set(0, PI, 0);
    pos.set(90, 52, -59);

    cars[42]=new Car(0, 42, rot, pos);


    rot.set(0, -3*PI/2, 0);
    pos.set(0, 0, 0);
    tpos=new float[15];
    trot=new float[15];
    for (int i=0; i<2; i++) {
      tcars[i]=new Car(0, i, rot, pos);
      tpos[i]=0;
      trot[i]=0;
    }
  }

  void displayModeMAP() {


    float rotateMAP=0;
    //this mode shows the rotating parking and hide the cameras
    //hide cameras
    m.update();
    background(#66E58B);
    textSize(30);
    textFont(font);
    fill(0);
    text("MOTION MODE", 20, 50);

    pushMatrix();
    translate(500, 32, 466);//y32
    rotateX(-0.47);
    rotateY(-1.27);
    rotateZ(0.36);
    pushMatrix(); 
    //   if (mousePressed) {
    rotateMAP=0.825;
    //  } else {
    // rotateMAP=(millis()*0.0001);
    // }
    rotateX(rotation.x);
    rotateY(rotation.y+rotateMAP);
    rotateZ(rotation.z+PI);
    translate(-223, -381, -91);
    translate(position1.x, position1.y, position1.z);

    /////////// 

    /////////////


    for (int i=0; i<cars.length; i++) {
      if (cars[i].state==1)cars[i].display();
    }

    opencv3.loadImage(cam3);
    opencv3.updateBackground();
    opencv4.loadImage(cam4);
    opencv4.updateBackground();
    tracking();

    for (int i=0; i<2; i++) { //m.splitCentroids.length
      PVector testpos=new PVector(0, 0, 0);
      PVector testrot=new PVector(0, 0, 0);
      m.tpos[i]=tCentroid(i);

      testpos.x=-30-m.tpos[i] ;
      testpos.y=58;
      testpos.z=-74;
      testrot.x=0.000;
      testrot.y=-3*PI/2+m.trot[i]; //NO
      testrot.z=0.000;
      //rotateY(park(i));
      m.tcars[i].position=testpos;
      m.tcars[i].rotation=testrot;
      m.tcars[i].display();
    }    
    t1=10000;
    t2=10000;
    shape(parking);
    popMatrix();
    popMatrix();
  } 
  void displayModeALL() {
    m.update();

    pushMatrix();   


    translate(positionAll.x, positionAll.y, positionAll.z);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z+PI);
    for (int i=0; i<cars.length; i++) {      
      cars[i].display();
    }
    //test
    // println((mouseX +"-x-"));//389 454
    // println((mouseY+"-y-" ));
    //
    parking.setFill(#6497A5);
    shape(parking);

    popMatrix();
  }


  //long last = millis();

  void update() {
    int free=0;

    if (timer(1000)) {
      myClient.write(new byte[]{0});//&&&

      //println("request send");
    }
    if (myClient.available()>43) {
      String occupancy=myClient.readString();
      //println("occupancy and plates recived");

      for (int i=0; i<carNumber; i++) {

        cars[i].state=occupancy.charAt(i)-48;    
        if (cars[i].state==0)free++;
      }
      currentFreeCars=free;
      carNumber=cars.length;
    }
  }
  void initCars() {
    for (int i=0; i<m.cars.length; i++) {
      cars[i].initCar();
    }
  }
}