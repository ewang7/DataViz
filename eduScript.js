
"use strict";


/* Assign unique numeric ID to each td and canvas element */
var blendedStats = document.querySelectorAll("td.blendedPercent");
var blendedID = 0;

for (var i = 0; i < blendedStats.length; i++) {
  blendedStats[i].id = blendedID;
  blendedID++;
}


var remoteStats = document.querySelectorAll("td.remotePercent");
var remoteID = 1000;

for (var i = 0; i < remoteStats.length; i++) {
  remoteStats[i].id = remoteID;
  remoteID++;
}

var canvasCollection = document.querySelectorAll("canvas.barGraphs");
var canvasID = 2000;

for (var i = 0; i < remoteStats.length; i++) {
  canvasCollection[i].id = canvasID;
  canvasID++;
}

/* Data visualization via canvas for barGraphs */

// parseInt is originally used below due to commas in the data, hence the
// extra parenthasees around certain variables
for (var i = 0; i < canvasCollection.length; i++) {
  var barGraphsContext = document.getElementById(i+2000).getContext("2d");
  var leftLength = document.getElementById(i).innerHTML;
  leftLength = leftLength.substring(0, leftLength.length - 1); //remove percent symbol
  var rightLength = document.getElementById(i+1000).innerHTML;
  rightLength = rightLength.substring(0, rightLength.length - 1); //remove percent symbol
  barGraphsContext.fillStyle = "purple";
  barGraphsContext.fillRect(0,0,(leftLength),20);
  barGraphsContext.fillStyle = "green";
  barGraphsContext.fillRect((leftLength),0,(rightLength),20);
}



/* Data visualization via canvas for pieChart */
var blendedCountTotal = 0;
var remoteCountTotal = 0;
var enrollmentSumTotal = 0;

var totalEnroll = document.querySelectorAll("td.totalEnroll");
var blendedCount = document.querySelectorAll("td.blendedCount");
var remoteCount = document.querySelectorAll("td.remoteCount");

for (var i = 0; i < totalEnroll.length; i++) {
  enrollmentSumTotal = enrollmentSumTotal + parseInt(totalEnroll[i].innerHTML);
  blendedCountTotal = blendedCountTotal + parseInt(blendedCount[i].innerHTML);
  remoteCountTotal = remoteCountTotal + parseInt(remoteCount[i].innerHTML);
}

console.log(enrollmentSumTotal);
console.log(blendedCountTotal);
console.log(remoteCountTotal);


var pieChartContext = document.getElementById("pieChart").getContext("2d");

pieChartContext.strokeStyle = "Purple";
pieChartContext.fillStyle = "Purple";
pieChartContext.lineWidth = 1;
pieChartContext.beginPath();
pieChartContext.arc(250,250,100,0,(blendedCountTotal/enrollmentSumTotal)*2*Math.PI, true);
pieChartContext.lineTo(250,250);
pieChartContext.lineTo(350,250);
pieChartContext.stroke();
pieChartContext.fill();



pieChartContext.strokeStyle = "Green";
pieChartContext.fillStyle = "Green";
pieChartContext.lineWidth = 1;
pieChartContext.beginPath();
pieChartContext.arc(250,250,100,0,(remoteCountTotal/enrollmentSumTotal)*2*Math.PI, false);
pieChartContext.lineTo(250,250);
pieChartContext.lineTo(350,250);
pieChartContext.stroke();
pieChartContext.fill();
