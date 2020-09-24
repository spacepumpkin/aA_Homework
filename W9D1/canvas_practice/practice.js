document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.height = 500;
  canvasEl.width = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "red";
  ctx.fillRect(0, 0, 100, 100);

  ctx.beginPath(); // starts a new path separate from the rectangle
  ctx.arc(300, 300, 250, 0, 2*Math.PI, true); // moves to position and draws circle
  ctx.lineWidth = 5;
  ctx.strokeStyle = "green";
  ctx.stroke(); // outline
  ctx.fillStyle = "teal";
  ctx.fill(); // auto closes current path if open and fills current path

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
  ctx.stroke();
});
