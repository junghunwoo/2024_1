float [] x, y, d, vx, vy, serno; // 각 캐릭터들의 x, y위치, 크기d, x,y속도 vx,vy, 떨어지는 캐릭터 피카츄, 메타몽 구분 위한 serno
int state=0; // 메인메뉴, 플레이화면, 게임오버 구현 위한 state
int frames = 0;
void setup(){
  size(800,1000);
  frameRate(60);
  x = new float [11];
  y = new float [11];
  d = new float [11];
  vx = new float [11];
  vy = new float [11];
  serno = new float [11];
  for(int i=1; i<11; i++){//각 변수의 [0]위치는 공란임, 이 위치를 플레이어블 캐릭터로 하고 아래는 떨어지는 캐릭터들의 값
    d[i] = random(1,3);
    y[i] = 0;
    vx[i] = random(-4,4);
    vy[i] = random(3,5);
    serno[i] = i%2;//홀수는 이 값이 1, 짝수는 이 값이 0 -> 이 값이 0이면 메타몽, 이 값이 1이면 피카츄 생성
    if(serno[i] == 0) x[i] = random(47.5*d[i], width - 47.5*d[i]);//메타몽과 피카츄의 몸체가 다 화면 안에 생성되기 위한 if문
    else x[i] = random(27.5*d[i], width - 27.5*d[i]);
  }
}

void draw(){
  if(state == 0) {//state가 0상태이면 메인메뉴 화면입니다
    mainMenu();
  }
  else if(state ==1) {//state가 1상태이면 플레이 화면입니다
    playing();
  }
  else{ //state가 2상태이면 게임오버 화면입니다
    gameOver();
}
}

void mousePressed(){ //클릭에 관한 동작입니다
  if(state == 0) {//메인메뉴일 때
    if(mouseX > width/2 - 200 && mouseX < width/2 + 200
    && mouseY > height/2 + 300 && mouseY < height/2 + 400)
    state =1;
  }
  if(state == 2) {//게임오버 화면일 때
    if(mouseX > width/2 - 200 && mouseX < width/2 + 200
    && mouseY > height/2 + 300 && mouseY < height/2 + 400)
    frames = 0;//점수를 0으로 초기화합니다
    for(int i=1; i<11; i++){// 모든 적들을 화면 상단으로 이동시킵니다
      y[i] = 0;
    }
    state =1;//플레이 화면으로 넘어갑니다
  }
}
  
    

void mainMenu(){// 메인메뉴 구성입니다
 background(181, 206, 235); fill(255);
 rect(width/2 -200, height/2 + 300, 400, 100);
 fill(0);
 textSize(60);
 text("Start", width/2 -63, height/2 + 365);
}
  
void playing(){//플레이화면입니다
  background(181, 206, 235);
  frames++;//매 초 100점을 획득합니다
  fill(255);
  textSize(60);
  text("Score: " + frames*100/60, 275, 70);// 화면 상단에 점수를 표시합니다
  x[0] = mouseX;//플레이어블 캐릭터
  y[0] = mouseY;
  renini(x[0], y[0], 40);
  for(int i=1; i<11; i++){ // 적 캐릭터
    if(serno[i] == 0){   // serno 0이면 메타몽을 그립니다
      x[i] += vx[i];
      y[i] += vy[i];
      makeDitto(x[i], y[i], d[i]);
      if(x[i] < 47.5*d[i] || x[i] > width - 47.5*d[i]) vx[i] = -vx[i];//메타몽이 벽에 튕깁니다
      if(y[i] > height - 35*d[i]){//메타몽이 바닥에 닿으면 크기와 속도가 바뀐 채 위쪽에 재생성됩니다
        y[i] = 0; d[i] = random(1,3); vx[i] = random(-4,4); vy[i] = random(3, 5);}
    }
    else{   // serno 1이면 피카츄를 그립니다
      x[i] += vx[i];
      y[i] += vy[i];
      pikachu(x[i], y[i], d[i]);
      if(x[i] < 27.5*d[i] || x[i] > width - 27.5*d[i]) vx[i] = -vx[i];//피카츄가 벽에 튕깁니다
      if(y[i] > height - 25*d[i]){//피카츄가 바닥에 닿으면 크기와 속도가 바뀐 채 위쪽에 생성됩니다
        y[i] = 0; d[i] = random(1,3); vx[i] = random(-4,4); vy[i] = random(3, 5);}
    }
    if((x[i]-40*d[i]) < x[0] && x[0] < (x[i]+40*d[i]) && (y[i]-40*d[i]) < y[0] && y[0] < (y[i]+40*d[i])){//플레이어블 캐릭터가 각 캐릭터의 일정 영역 안에 들어오면 부딪힌 것으로 간주하고 게임오버됩니다
      state = 2;
    }
  }
}
  
void gameOver(){//게임 오버 화면 구성입니다
  background(181, 206, 235);
  fill(255);
  textSize(60);
  text("Score: " + frames*100/60, 275, 70);// 화면 상단에 점수를 표시합니다
  rect(width/2 -200, height/2 + 300, 400, 100);
  fill(0);
  textSize(60);
  text("Restart", width/2 -90, height/2 + 365);
}
