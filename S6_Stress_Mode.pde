int buttonX1 = 275; // X-coordinate of the button
int buttonY1 = 150; // Y-coordinate of the button
int buttonWidth1 = 100; // Width of the button
int buttonHeight1 = 100; // Height of the button
  
int buttonX2 = 425; // X-coordinate of the button
int buttonY2 = 150; // Y-coordinate of the button
int buttonWidth2 = 100; // Width of the button
int buttonHeight2 = 100; // Height of the button

float restingHeartRate = rest_bpm; 
float currHeartRate = bpm; 
 

int musicScreenTimeStart; 
int riddleScreenTimeStart; 

void stress_mode() {
  pushStyle();
   
  textSize(50); 
  textAlign(CENTER, CENTER);
  background(153, 171, 209);
  PFont myFont1= createFont("Osaka" , 40); 
   
  // button for music mode 

  color buttonColor1 = color(171, 136, 191); // Color of the button
  fill(buttonColor1);
  rect(buttonX1, buttonY1, buttonWidth1, buttonHeight1);
  
  // Display text on the button
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(myFont1, 20); 
  text("Music Mode", buttonX1, buttonY1, buttonWidth1, buttonHeight1);
  
  // button for music mode 
  color buttonColor2 = color(129, 196, 126); // Color of the button
  fill(buttonColor2);
  rect(buttonX2, buttonY2, buttonWidth2, buttonHeight2);
  
  // Display text on the button
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(myFont1, 20); 
  text("Riddle Mode", buttonX2, buttonY2, buttonWidth2, buttonHeight2);
  
  
  fill(0);
  textSize(40); 
  textAlign(CENTER, CENTER); 
  text("MODE II: RELAXED VS. STRESSED MODE", width/2, 30); 
  
  
 
  popStyle(); // Pop the style changes back to default
  
  // add resting heart rate in corner if we are able to calcualte that. 
}
void mouseClicked() {
  if (mouseX > buttonX1 && mouseX < buttonX1 + buttonWidth1 && mouseY > buttonY1 && mouseY < buttonY1 + buttonHeight1) {
    println("Button 1 clicked!");
    screen=6; 
    musicScreenTimeStart=millis(); 
  }
  
  if (mouseX > buttonX2 && mouseX < buttonX2 + buttonWidth2 && mouseY > buttonY2 && mouseY < buttonY2 + buttonHeight2) {
    println("Button 2 clicked!");
    screen = 7; 
    riddleScreenTimeStart=millis(); 
  }
}
  
void musicScreen(){
  pushStyle();
  background(214, 96, 110);
  
  fill(255);
   
  PFont myFont1= createFont("Osaka" , 40); 
  textAlign(CENTER, CENTER);
  textFont(myFont1, 30); 
  
  if (millis()-musicScreenTimeStart > 3000){// should be time elapsed since song starts 
     if (currHeartRate > restingHeartRate) {
        background(255, 0, 0);
        fill(255); // Set text color to white
        text("You are not calm!",  width/2, height/2+10);
    } else {
        background(0, 255, 0);
        fill(255); // Set text color to white
        text("You are calm!", width/2, height/2+10);
    }
    
    //textFont(myFont1, 20); 
    //text("Your average heart rate: " + avgHeartRate,  width/2, height/2+60); 
    //text("Your average breathing rate: " + avgBreathingRate,  width/2, height/2+90); 
  }

  
  textFont(myFont1, 20); 
  text("Your resting heart rate: " + restingHeartRate , 650, 10); 
  
  
  textFont(myFont1); 
  text("Music Mode", width/2, 70);
  
  textAlign(CENTER,CENTER);
  textFont(myFont1, 20); 
  text("play a relaxing song", width/2, 130);
  
  popStyle();
  
}

void riddleScreen(){
  pushStyle();
  background(214, 96, 110);
  
  fill(255);
   
  PFont myFont1= createFont("Osaka" , 40); 
  textAlign(CENTER, CENTER);
  textFont(myFont1, 30); 
  
  if (millis()-riddleScreenTimeStart > 3000){// should be time elapsed since song starts 
     if (currHeartRate > restingHeartRate) {
        background(255, 0, 0);
        fill(255); // Set text color to white
        text("You are stressed!",  width/2, height/2+20);
    } else {
        background(0, 255, 0);
        fill(255); // Set text color to white
        text("You are calm!", width/2, height/2+20);
    }
  }

  
  textFont(myFont1, 20); 
  text("Your resting heart rate: " + restingHeartRate , 650, 10); 
  
  
  textFont(myFont1); 
  text("Riddle Mode", width/2, 70);
  
  textAlign(CENTER,CENTER);
  textFont(myFont1, 20); 
  text("solve the following riddle:\n A man who was outside in the rain without an umbrella\nor hat did not get a single hair on his head wet. Why?", width/2, 150);
  
  popStyle();
  
}
