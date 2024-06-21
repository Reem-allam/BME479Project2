import processing.serial.*;
import org.gicentre.utils.stat.*;

int screen = 0;
int dur_start; //counter for the baseline screen
float bpm, prev_bpm,resp, prev_resp, baseline_bpm, baseline_resp = 0;
int baseline_bpm_counter = 0;
int baseline_resp_counter = 0;
boolean meditation = false; // Variable to track meditation state
int consecutiveReadings = 0; // Counter for consecutive readings over 199
int meditationStartTime = 0; // Variable to store the start time of meditation
float rest_bpm = 0;
float rest_resp = 0;


Serial myPort; // Create a serial object


/*
TODO

Read invalues and populate float lists
finsih zone screen
determine if stressed or not

*/

void setup(){
  size(800, 400);
  
  String portName = "/dev/cu.usbmodem123456781";
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  

}

void draw(){
   background(255);
     
  if (screen == 0) {
 
     Welcome();
     dur_start = millis();

  } else if (screen == 1) {
        baseLineDataCollector();
  } else if (screen == 2) {
    BaseLineData();
  }else if (screen == 3) {
    RespGraph();
    
    //delay(10000);
  }else if(screen == 4){
   HeartRate() ;
  }else if (screen == 5){
    stress_mode();
  }else if (screen == 6){
    musicScreen();
  }else if (screen == 7){
    riddleScreen();
  }

}



XYChart createGraph(FloatList lineChartX,FloatList lineChartY){
  XYChart scatterPlot = new XYChart(this);
  scatterPlot.setMinY(0); // Set minimum y-value
  scatterPlot.setMaxY(120); // Set maximum y-value
  scatterPlot.showXAxis(true); // Show x-axis
  scatterPlot.showYAxis(true); // Show y-axis
  scatterPlot.setXFormat("0"); // Format for x-axis labels
  scatterPlot.setYFormat("0"); // Format for y-axis labels
  scatterPlot.setPointSize(5); // Set point size
  
  float[] yVal = lineChartY.array();
  float[] xVal = new float[lineChartY.size()];
  
  //do something to populate the xval and y vals
  
  scatterPlot.setData(xVal, yVal); // Set data for scatter plot
  
  
  
  
  return scatterPlot;
}


void serialEvent(Serial myPort) {
  String serialData = myPort.readStringUntil('\n');
  if (serialData != null) {
    serialData = trim(serialData);
    
    // Check if the line contains heart rate data
    if (serialData.startsWith("BPM: ")) {
      // Extract heart rate value
      String[] parts = serialData.split(":");
      if (parts.length == 2) {
        try {
          float value = Float.parseFloat(parts[1].trim());
          if (value != 0) { // Check if heart rate value is not zero
            rest_bpm = (int)value; // Update resting heart rate
            prev_bpm = value;
            println("Heart rate:" + rest_bpm);
            xHeartRate.append(rest_bpm);
            yHeartRate.append(yAxis);
          }
          else{
            bpm = prev_bpm;
          }
          if (baseline_bpm_counter == 0){
           baseline_bpm = bpm;
           baseline_bpm_counter++;
          }
        } catch (NumberFormatException e) {
          println("Error parsing heart rate value: " + parts[1]);
        }
      }
    }
    
    // Check if the line contains oxygen level data
    else if (serialData.startsWith("FSR Reading: ")) {
      // Extract oxygen level value
      String[] parts = serialData.split(":");
      if (parts.length == 2) {
        try {
          float value = Float.parseFloat(parts[1].trim());
          if (value != 0) { // Check if oxygen level value is not zero
            rest_resp = (int)value; // Update resting respiratory rate
            prev_resp = value; // Update previous non-zero heart rate
            println("Oxygen level: " + rest_resp);
            start_time1 = millis();
            
            // Add time and respiratory rate to lists
            xCoords.append(millis()); // Add current time
            yCoords.append(rest_resp); // Add respiratory rate
          } else {
           rest_resp = prev_resp; // Use previous non-zero heart rate
          }
          
          if (baseline_resp_counter == 0){//took get the baseline value
          baseline_resp = resp;
          baseline_resp_counter++;//only runs once
          }
          
          if (resp > 199) {
              consecutiveReadings++; // Increment consecutive readings counter
              if (consecutiveReadings >= 3 && !meditation) { // If 3 consecutive readings over 199 and not already meditating
                meditation = true; // Set meditation to true
                meditationStartTime = millis(); // Record the start time of meditation
              }
            } else {
              consecutiveReadings = 0; // Reset consecutive readings counter if fsr is not over 199
            }
            
           // Check if meditation time has elapsed
            if (meditation && millis() - meditationStartTime >= 5000) { // If 5 seconds have elapsed since meditation started
              meditation = false; // Set meditation to false
            }
        } catch (NumberFormatException e) {
          println("Error parsing oxygen level value: " + parts[1]);
        }
      }
    }
  }
}
