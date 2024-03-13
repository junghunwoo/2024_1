void renini(float x,float y, float z) {
  fill(29, 219, 22);
  noStroke();
  circle(x-0.5*z,y-0.8*z, z);
  circle(x+0.5*z,y-0.8*z, z);
  ellipse(x,y,2.6*z,1.7*z);
  fill(0);
  circle(x+0.3*z,y-0.5*z,z/7);
  circle(x-0.3*z,y-0.5*z,z/7);
  stroke(0,0,0);
  strokeWeight(z/10);
  line(x-0.3*z,y-0.1*z,x,y+0.05*z);
  line(x,y+0.05*z,x+0.3*z,y-0.1*z);
  fill(255,178,245);
  noStroke();
  circle(x-0.8*z,y+0.3*z,0.78*z);
  circle(x+0.8*z,y+0.3*z,0.78*z);
}
//--------------------------피카츄------------------------//
void pikachu(float x, float y, float z){
  fill(255,218,0);
  ellipse(x-15*z,y-30*z,10*z,40*z);
  fill(0);
  beginShape();
  curveVertex(x-15*z+4.5*z, y-30*z-10*z);
 curveVertex(x-15*z+4.5*z, y-30*z-10*z);
 curveVertex(x-15*z+2.5*z, y-30*z-20*z);
 curveVertex(x-15*z-2.5*z,y-30*z-20*z);
 curveVertex(x-15*z-4.5*z, y-30*z-10*z);
 curveVertex(x-15*z-4.5*z, y-30*z-10*z);
 endShape();
 fill(255,218,0);
  ellipse(x+15*z,y-30*z,10*z,40*z);
  fill(0);
  beginShape();
  curveVertex(x+15*z+4.5*z, y-30*z-10*z);
 curveVertex(x+15*z+4.5*z, y-30*z-10*z);
 curveVertex(x+15*z+2.5*z, y-30*z-20*z);
 curveVertex(x+15*z-2.5*z,y-30*z-20*z);
 curveVertex(x+15*z-4.5*z, y-30*z-10*z);
 curveVertex(x+15*z-4.5*z, y-30*z-10*z);
 endShape();
     fill(255,218,0);
  ellipse(x,y,55*z,50*z);// 얼굴부분
    fill(0);
  ellipse(x-10*z,y-5*z,10*z,10*z);
  ellipse(x+10*z,y-5*z,10*z,10*z);
  fill(255,255,255);
  ellipse(x-10*z+1.8*z,y-5*z-2.4*z,4*z,4*z);
  ellipse(x+10*z-1.8*z,y-5*z-2.4*z,4*z,4*z);
   fill(255,0,0);
  stroke(255);
  ellipse(x-17*z,y+7*z,10*z,10*z);
  ellipse(x+17*z,y+7*z,10*z,10*z);
     fill(0);
  ellipse(x,y,3*z,z);
  noFill();
  stroke(0);
  curve(x,y-10*z,x,y+7*z,x-10*z,y+7*z,x-10*z,y-10*z);
  curve(x,y-10*z,x,y+7*z,x+10*z,y+7*z,x+10*z,y-10*z);
 }
//------------------메타몽----------------------//
void makeDitto(float x, float y, float d){
  makeBody(x, y, d);
  makeHand(x, y, d);
  makeHead(x, y, d);
  makeSkin(x, y, d);
  makeCurve(x, y, d);
  face(x, y, d);
}
void makeBody(float x, float y, float d){
  fill(174, 153, 212);
  stroke(0);
  strokeWeight(d);
  arc(x, y + 35*d, 80*d, 80*d, PI, 2*PI);
  line(x - 40*d, y + 35*d, x + 40*d, y + 35*d);
}
void makeHand(float x, float y, float d){
  ellipse(x - 30*d, y - 5*d, 35*d, 20*d);
  ellipse(x + 30*d, y - 5*d, 35*d, 20*d);
}
void makeHead(float x, float y, float d){
  ellipse(x - 10*d, y - 15*d, 27*d, 16*d);
  ellipse(x + 10*d, y - 15*d, 27*d, 16*d);
}
void makeSkin(float x, float y, float d){
  stroke(174,153,212);
  strokeWeight(0);
  rect(x - 38*d,y - 19*d, 76*d, 45*d);
  square(x - 4*d, y - 20.5*d, 6*d);
}
void makeCurve(float x, float y, float d){
  fill(181, 206, 235);
  stroke(0);
  strokeWeight(d);
  arc(x - 41*d, y + 13.7*d, 14*d, 21*d, 0, 0.375*PI);
  arc(x - 41*d, y + 13.7*d, 14*d, 21*d, 1.55*PI, 2*PI);
  arc(x + 41*d, y + 13.7*d, 14*d, 21*d, 0.62*PI, 1.45*PI);
  arc(x - 47*d, y - 28.5*d, 63*d, 31*d, 0.18*PI, 0.42*PI);
  arc(x + 47*d, y - 28.5*d, 63*d, 31*d, 0.58*PI, 0.82*PI);
}
void face(float x, float y, float d){
  point(x - 10*d, y - 13*d);
  point(x + 10*d, y - 13*d);
  fill(174, 153, 212);
  arc(x, y - 11*d, 40*d, 15*d, 0.2*PI, 0.8*PI);
}
