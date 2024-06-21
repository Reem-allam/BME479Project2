void outline(){
  pushStyle();
    background(#95c8d8);
  fill(255);
   stroke(#5097a4);  // Set border color to black
  strokeWeight(20);  // Set border thickness
  noFill();  // Don't fill the rectangles, only draw borders
  
  // Draw top border
  rect(0, 0, width,0);
  
  // Draw bottom border
  rect(0, height, width, 0);
  
  // Draw left border
  rect(0, 0, 0, height);
  
  // Draw right border
  rect(width - 0, 0, 0, height);
}

void BaseLineData(){
  
  outline();
  
  textAlign(CENTER,CENTER);
  textSize(20);
  fill(0);
  text ("Resting Heart Rate: " + rest_bpm, width/2 - 280, height / 2 -160);
  text ("Current Heart Rate: " + bpm, width/2 - 280, height / 2 -120);
  //text ("Resting Zone : " + rest_bpm, width/2 - 30 , height / 2 -160);
  //text ("Current Zone : " + rest_bpm, width/2 - 30 , height / 2 -120);


   textAlign(CENTER,CENTER);
  textSize(20);
  fill(0);
  text ("Resting Respiratory Rate: " + rest_resp, width/2 + 240, height / 2 -160);
  text ("Current Respiratory Rate: " + resp, width/2 + 240, height / 2 -120);
  
  textAlign(CENTER,CENTER);
  textSize(20);
  fill(0);  
  text ("Press r for the your Respiratory Graph" , width/2 , height -250);
  text ("Press h for the your Heart Rate Graph",width/2 , height-200);
  text ("Press z for the Zone information", width/2 ,height  -150);
}
