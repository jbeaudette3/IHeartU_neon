PImage imgI;
PImage imgH;
PImage imgU;
PImage imgS;
PImage imgSL;
PImage imgSR;
PImage imgSS;

int imgIc;  // height = 107
int imgHc;  // height = 72
int imgUc;  // height = 96
int imgSc;  // height = 94

int imgSLc;  // height = 
int imgSRc;  // height = 
int imgSSc;  // height = 

int iy = 10;
int hy = 125;
int uy = 185;
int ey = 285;
int sy = 323;

void setup()
{
  size(400, 400);

  imgI = loadImage("I.png");
  imgI.resize(100, 0);
  imgIc = imgI.width/2;

  imgH = loadImage("Heart.png");
  imgH.resize(90, 0);
  imgHc = imgH.width/2;

  imgU = loadImage("U.png");
  imgU.resize(85, 0);
  imgUc = imgU.width/2;

  imgS = loadImage("Smile-full.png");
  imgS.resize(90, 0);
  imgSc = imgS.width/2;
  
  imgSL = loadImage("Smile-left.png");
  imgSL.resize(14, 0);
  imgSLc = imgSL.width/2;
  
  imgSR = loadImage("Smile-right.png");
  imgSR.resize(14, 0);
  imgSRc = imgSR.width/2;
  
  imgSS = loadImage("Smile-smile.png");
  imgSS.resize(90, 0);
  imgSSc = imgSS.width/2;

  background(0);
}

int frameIndex = 0;
int[] frames =
{0, 25,
2, 20, 0, 20, 4, 20, 0, 1, 20, 0, 20, 3, 20, 0, 20, 
1, 20, 2, 20, 3, 20, 4, 20, 0, 22, 5, 23,
10, 22, 7, 21, 10, 21, 10, 22, 7, 21, 10, 23,    // heart beat
10, 22, 7, 21, 10, 21, 10, 22, 7, 21, 10, 23,    // heart beat
10, 22, 7, 21, 10, 21, 10, 22, 7, 21, 10, 23,    // heart beat
10, 22, 6, 21, 10, 24,                           // wink
0, 2, 4, 24,
0, 4, 23,
0, 25};

// wink = 10, 22, 6, 21, 10, 22
// heart= 10, 22, 7, 21, 10, 22

void draw()
{  
  if (frameIndex < frames.length)
  {
     switch(frames[frameIndex])
     {
        case 0:                  // black
          fill(0);
          rect(0, 0, width, height);
          break;
          
        case 1:                  // I
          draw_I(255, 255);
          break;
          
        case 2:                  // heart
          draw_H(255, 255);
          break;
          
        case 3:                  // U
          draw_U(255, 255);
          break;
          
        case 4:                  // full smile
          draw_S(255, 255);
          break;
          
        case 5:                  // all with blur
          draw_I(255, 255);
          draw_H(255, 255);
          draw_U(255, 255);
          draw_SL(255, 255);
          draw_SR(255, 255);
          draw_SS(255, 255);
          //filter(BLUR, 5);
          //draw_I(255, 255);
          //draw_H(255, 255);
          //draw_U(255, 255);
          //draw_SL(255, 255);
          //draw_SR(255, 255);
          //draw_SS(255, 255);
          break;
          
        case 6:                  // eye wink
          draw_I(255, 255);
          draw_H(255, 255);
          draw_U(255, 255);
          draw_SR(255, 255);
          draw_SL(50, 255);
          draw_SS(255, 255);
          break;
          
        case 7:                  // heart beat
          draw_I(255, 255);
          draw_H(50, 255);
          draw_U(255, 255);
          draw_S(255, 255);
          break;
          
        case 10:                  // all 4
          draw_I(255, 255);
          draw_H(255, 255);
          draw_U(255, 255);
          draw_S(255, 255);
          
        case 20:                  // delay
          myDelay(20);
          break;
          
        case 21:                  // delay
          myDelay(50);
          break;
          
        case 22:                  // delay
          myDelay(250);
          break;
          
        case 23:                  // delay
          myDelay(500);
          break;
          
        case 24:                  // delay
          myDelay(1000);
          break;
        
        case 25:                  // delay
          myDelay(2000);
          break;
     }
     frameIndex++;
     
     if (frameIndex == frames.length)
     {
       frameIndex = 0;
     }
  }
}

/********** FUNCTIONS **********/

void myDelay(int d)
{
  int now = millis();
  while (millis() - now <= d);
}

void draw_I(int grey, int alpha)
{ 
  tint(grey, alpha);
  image(imgI, (width / 2) - imgIc, iy);
}

void draw_H(int grey, int alpha)
{
  tint(grey, alpha);
  image(imgH, (width / 2) - imgHc, hy);
}

void draw_U(int grey, int alpha)
{
  tint(grey, alpha);
  image(imgU, (width / 2) - imgUc, uy);
}

void draw_S(int grey, int alpha)
{
  tint(grey, alpha);
  image(imgS, (width / 2) - imgSc, ey);
}

void draw_SL(int grey, int alpha)
{
  tint(grey, alpha);
  image(imgSL, (width / 2) - imgSLc + 14.5, ey);
}

void draw_SR(int grey, int alpha)
{
  tint(grey, alpha);
  image(imgSR, (width / 2) - imgSRc - 14.5, ey);
}

void draw_SS(int grey, int alpha)
{
  tint(grey, alpha);
  image(imgSS, (width / 2) - imgSSc, sy);
}
