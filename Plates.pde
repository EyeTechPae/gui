
class Plates {
  PVector posP, rotP;
  String[] myPlates;

  Plates(PVector _rot, PVector _pos) {
    posP=_pos;
    rotP=_rot;
    myPlates=new String[6];
    myPlates[0]=("0000");
        myPlates[1]=("0000");
    myPlates[2]=("0000");
    myPlates[3]=("0000");
    myPlates[4]=("0000");
    myPlates[5]=("0000");

  }

  void displayPlatesModeALL() {  
      String recivedPlates=" , , , , , ";
    if (myClient.available()>80) { //change here
      //println(myClient.available());
      recivedPlates=myClient.readString();
      String[] plates=split(recivedPlates, ',');
      //println(plates);
      myPlates=plates;
    }

    pushMatrix();
    rotateX(this.rotP.x);
    rotateY(this.rotP.y);
    rotateZ(this.rotP.z);

    translate(this.posP.x, this.posP.y, this.posP.z); 
    textFont(font2);
    fill(#A1A29A);
    rect(0, 0, 100, 150, 8);
    fill(#61625A);
    rect(0, 0, 100, 30, 8);
    fill(255);
    text(" LAST 5 PLATES", 0, 20);
    fill(0);
    for (int i=1; i<6; i++) {
      text(myPlates[i], 10, 20+i*25);
    }
    popMatrix();
  }
}