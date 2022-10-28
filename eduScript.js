
"use strict";


/* Assign unique numeric ID to each td and canvas element */
var blendedStats = document.querySelectorAll("td.blended");
var blendedID = 0;

for (var i = 0; i < blendedStats.length; i++) {
  blendedStats[i].id = blendedID;
  blendedID++;
}


var remoteStats = document.querySelectorAll("td.remote");
var remoteID = 1000;

for (var i = 0; i < remoteStats.length; i++) {
  remoteStats[i].id = remoteID;
  remoteID++;
}

var canvasCollection = document.querySelectorAll("canvas");
var canvasID = 2000;

for (var i = 0; i < remoteStats.length; i++) {
  canvasCollection[i].id = canvasID;
  canvasID++;
}


for (var i = 0; i < remoteStats.length; i++) {
  console.log(document.getElementById(i+1000));
}

/* Data visualization via canvas */

for (var i = 0; i < canvasCollection.length; i++) {
  var context = document.getElementById(i+2000).getContext("2d");
  var leftLength = document.getElementById(i).innerHTML;
  leftLength = leftLength.substring(0, leftLength.length - 1);
  var rightLength = document.getElementById(i+1000).innerHTML;
  rightLength = rightLength.substring(0, rightLength.length - 1);
  context.fillStyle = "purple";
  context.fillRect(0,0,parseInt(leftLength),20);
  context.fillStyle = "green";
  context.fillRect(parseInt(leftLength),0,parseInt(rightLength),20);
}
