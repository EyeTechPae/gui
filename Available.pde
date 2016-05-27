class Available {
  PVector pos, rot;
  int free, total;
  Available(PVector _rot, PVector _pos, int _free, int _total) {
    rot=_rot;
    pos=_pos;
    free=_free;
    total=_total;
  }
  void displayAvailable() {
    free=m.currentFreeCars;
    total=m.carNumber;
    pushMatrix();
    textFont(font3);
    fill(0);
    text("Occupied", 10, 371);
    text("Parks", 10, 390);
    text(100*(total-free)/total +"%",30,410);
    popMatrix();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);

    rotateX(rot.x);
    rotateY(rot.y+millis()*0.0007);
    rotateZ(rot.z);

    pushMatrix();
    if(free>20)fill(0, 250, 10);
     else fill(250, 0, 10);

    translate(0, (43-free)*200/total/(-2), 0);
    box(50, (43-free)*200/total, 50);
    popMatrix();

    fill(200, 100, 50, 50);
    translate(0, -200/2, 0);
    box(55, 200, 55);

    popMatrix();
  }
}