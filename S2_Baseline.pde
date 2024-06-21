int interval = 1000;
int duration = 30;
int dotAffect,count,percent = 0;


void baseLineDataCollector(){
  
  pushStyle();
  background(100, 100, 100);
  fill(255);
  
  if (count == 3){
    percent += 10;
    count = 0;
  }
  
  switch (dotAffect){
    case 0:
         text ("Calculating Baseline. ", width/2 - 1, height / 2 -50);
         text (" "+ percent + "% done", width/2 - 1, height / 2 +50);


    break;
    
    case 1:
         text ("Calculating Baseline.. ", width/2 -2, height / 2 -50);
         text (" "+ percent + "% done", width/2 - 1, height / 2 +50);
     break;
     
    case 2:
      text ("Calculating Baseline... ", width/2 - 3, height / 2 -50);
         text (" "+ percent + "% done", width/2 - 1, height / 2 +50);
    break;
    
    case 3:
        text ("Calculating Baseline.... ", width/2 - 4, height / 2 -50);
         text (" "+ percent + "% done", width/2 - 1, height / 2 +50);
    break;
    
    case 4:
         text ("Calculating Baseline ", width/2, height / 2 -50);
         text (" "+ percent + "% done", width/2 - 1, height / 2 +50);
        dotAffect = 0;

    break;
  
  }
  
  text (" " + duration + " ", width/2, height / 2);
  
  //print 30 sec countdown
  int curr_time = millis();
  textAlign(CENTER,CENTER);
  if ( curr_time - dur_start >= interval){
  dotAffect++;
  duration --;
  count ++;
  dur_start = curr_time;
  }
  
  if (duration == 0){
   text (" 100% done", width/2 - 1, height / 2 +50);
   screen++; 
   duration = 30;
   percent = 0;
   
  }
  //move to next page

}
