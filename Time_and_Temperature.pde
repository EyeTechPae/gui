void displayTT(){
   textFont(font2);
fill(0);

text( ( year() + "-"+nf(month(),2) +"-"+ nf(day(),2) + "--"  + nf(hour(),2) +"-"+ nf(minute(),2) +"-"+ nf(second(),2)),1080,15);
}