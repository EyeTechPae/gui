void dbButton(){
  image(dbButton,1021,70);
  if (dbReady && mousePressed==true && abs(mouseX-1096)<62 && abs(mouseY-124)<69) {
    launch("/home/enric/pae/Parkingv10/data/LicensePlateDatabase.exe" );
    while(!timer(2000))dbReady=false;
    dbReady=true;
  }
}