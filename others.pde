void trakingCross(PVector[] centroids){
  fill(#FF0000);
 for(int i=0;i<4;i++){
    
 rect(centroids[i].x,centroids[i].y,40,5);
 rect(centroids[i].x+18,centroids[i].y-18,5,40);
 }
}

void manualUpdate() {
  realPositions[0].set(390, 455);
  realPositions[1].set(407, 452);
  realPositions[2].set(424, 451);
  realPositions[3].set(442, 447);

  realPositions[4].set(460, 446);
  realPositions[5].set(478, 444);
  realPositions[6].set(494, 441);
  realPositions[7].set(509, 438);
  realPositions[8].set(527, 436);

  realPositions[9].set(655, 417);
  realPositions[10].set(674, 414);
  realPositions[11].set(690, 411);
  realPositions[12].set(707, 409);
  realPositions[13].set(724, 407);
  realPositions[14].set(740, 405);
  realPositions[15].set(758, 403);
  realPositions[16].set(773, 400);
  realPositions[17].set(324, 519);
  realPositions[18].set(347, 516);
  realPositions[19].set(371, 512);
  realPositions[20].set(392, 507);
  realPositions[21].set(415, 504);
  realPositions[22].set(436, 502);
  realPositions[23].set(458, 498);
  realPositions[24].set(478, 494);
  realPositions[25].set(498, 490);
  realPositions[26].set(518, 486);
  realPositions[27].set(537, 484);
  realPositions[28].set(555, 479);
  realPositions[29].set(574, 477);
  realPositions[30].set(591, 472);
  realPositions[31].set(667, 461);
  realPositions[32].set(684, 458);
  realPositions[33].set(703, 455);
  realPositions[34].set(718, 451);
  realPositions[35].set(735, 449);
  realPositions[36].set(751, 445);
  realPositions[37].set(765, 442);
  realPositions[38].set(780, 440);
  realPositions[39].set(795, 437);
  realPositions[40].set(809, 436);
  realPositions[41].set(824, 434);
  realPositions[42].set(838, 431);


  for (int i=0; i<m.cars.length; i++) {
    fill(0);
    if ( abs(mouseX-realPositions[i].x)<7 &&  abs(mouseY-realPositions[i].y)<7 ) {
      m.cars[i].selected=true;
      if (mousePressed && timer(50)) {
       Client myClientCS=new Client(this,"46.101.132.172",3335);
        myClientCS.write(new byte[]{2}); //&&&
        myClientCS.write( new byte[] { (byte)(m.cars[i].ID & 0xFF) });//&&&
       myClientCS.write( new byte[] { (byte)(m.cars[i].state & 0xFF) });//&&&
        myClientCS.stop();
        
        println("car "+m.cars[i].ID+" wants to change to state: ");
      }
    } else m.cars[i].selected=false;
  }
}
boolean timer(int t) {
  if (millis()-timer>t) {
    timer=millis();
    return true;
  } else {
    return false;
  }
}
void logoInfo() {
  if (mousePressed==true && abs(mouseX-46)<29 && abs(mouseY-55)<29) {

    link("http://eye-tech.orgfree.com/");
  }
}

void controlEvent(ControlEvent theEvent) {
  
  
  
  if(theEvent.isAssignableFrom(Textfield.class) && keyCode ==ENTER && (cp5.get(Textfield.class,"Add plate").isFocus() )) {
      Client myClientAP=new Client(this,"46.101.132.172",3335);
            println("plate::"+theEvent.getStringValue());
           myClientAP.write(new byte[]{1}); //&&&
            myClientAP.write(theEvent.getStringValue());
            myClientAP.stop();

  
}
  if(theEvent.isAssignableFrom(Textfield.class) && keyCode ==ENTER && (cp5.get(Textfield.class,"Send message").isFocus() )) {
  Client myClientMess=new Client(this,"46.101.132.172",3335);
       myClientMess.write(new byte[]{0,byte(msgType)}); //&&&
        myClientMess.write( theEvent.getStringValue()); 
                    println("message:"+theEvent.getStringValue()+"of type: "+msgType);
        myClientMess.stop();

  }
}