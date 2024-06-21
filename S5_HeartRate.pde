FloatList xHeartRate = new FloatList();
FloatList yHeartRate = new FloatList();
float yAxis2,start_time2,currTime2 = 0;
float duratio2 = 1000;

void HeartRate(){

  outline();
  currTime = millis();
  if (currTime - start_time1 >=duration1){//how seconds are incremented
   yAxis++;
   start_time1 = currTime;
  }
 
  XYChart heartRateGraph =  createGraph(xHeartRate,yHeartRate);//creating a new graph and adding values
  
  heartRateGraph.draw(100, 100, width - 200, height - 200); // Draw the scatter plot
}
