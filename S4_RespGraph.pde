FloatList xCoords = new FloatList();
FloatList yCoords = new FloatList();
float yAxis,start_time1,currTime = 0;
float duration1 = 1000;


void RespGraph() {
  outline();

  // Create a new XYChart with the updated xCoords and yCoords
  XYChart respGraph = createGraph(xCoords, yCoords);
  
  if (millis() % 10000 == 0) {
      yCoords.append(rest_resp); // Add respiratory rate
      } else {
       yCoords.append(0); // Add 0 if not 10-second increment
       }
  // Draw the scatter plot
  respGraph.draw(100, 100, width - 200, height - 200);
}
