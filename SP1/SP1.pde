Snowflake[] snowflakes = new Snowflake[400]; //Array til snefnug
PVector[] stars = new PVector[300]; //Array til stjernerne 
boolean isDay = true; //Variabel til at vide om det er dag eller nat

void setup() { //Skal køre 1 gang
  size (500, 500); //Størrelsen på vinduet
  background (206, 251, 255); //Himmel
  
  // Initialiser snefnuggene, ved at bruge for-loop
  for (int i = 0; i < snowflakes.length; i++) {
    snowflakes[i] = new Snowflake();
 }
 
 // Initialiser stjernerne med tilfældige positioner
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new PVector(random(width), random(height));
  }
}

void draw() { //Programet skal blive ved med at køre.
  if (isDay) {
    // Tegn dag med snefnug
    background(206, 251, 255); // Himmel (dag)

    // Opdater og tegn snefnuggene kun om dagen
    for (int i = 0; i < snowflakes.length; i++) {
      snowflakes[i].update();  // Opdater snefnuggene
      snowflakes[i].display(); // Vis snefnuggene
    }
  } else {
    // Tegn nat med stjerner
    background(13, 34, 49); // Himmel (nat)

    // Tegn stjernerne kontinuerligt om natten
    for (int i = 0; i < stars.length; i++) {
      drawStar(stars[i].x, stars[i].y); // Brug gemte stjernepositioner
    }
  }

  // Tegn snemanden (fælles for dag og nat)
  drawSnowman();
}

// Funktion til at tegne snemanden (deles mellem dag og nat)
void drawSnowman() {
  fill (255); 
  noStroke (); 
  rect (0, 420, 500, 80); //Snebunke 
  ellipse (250, 375, 100, 100); //Nedredelen 
  ellipse (250, 290, 80, 80); //Midten 
  ellipse (250, 225, 60, 60); //Hoved

  fill(0);
  rect (235, 215, 5, 5); //Venstre øje
  rect (260, 215, 5, 5); //Højre øje
  
  fill (255, 102, 0);
  triangle (250, 225, 245, 230, 255, 230); //Næse

  //Mund
  fill(0); 
  ellipse(240, 240, 5, 5); // Første punkt (til venstre)
  ellipse(245, 245, 5, 5); // Andet punkt
  ellipse(250, 247, 5, 5); // Midterpunkt
  ellipse(255, 245, 5, 5); // Næste punkt
  ellipse(260, 240, 5, 5); // Sidste punkt (til højre)
  
  stroke (75, 50, 47);
  strokeWeight (3);
  line (290, 290, 320, 250); //Højre arm
  line (208, 290, 178, 250); //Venstre arm

  //Knapper
  strokeWeight (7);
  point (250, 270);
  point (250, 290);
  point (250, 310);
}

//Når der trykkes med musen skal det være dag (dvs. himlen er lyseblå).
void mousePressed() {
 isDay = true; //Skift til dag
}

//Når der trykkes på en tast, skal det være nat (dvs. himlen bliver mørk).
void keyPressed() {
  isDay = false; //Skift til nat
}
  
  //Stjerner på en bestemt position
void drawStar(float x, float y) {
  float starSize = random (2, 5); 
  noStroke();
  fill(255);
  ellipse (x, y, starSize, starSize);
}
  
//Klasse for snefnug
class Snowflake {
  float x, y, size, speed;

  Snowflake() {
    x = random(width);
    y = random(-50, height);
    size = random(6, 10);
    speed = random(1, 2);
  }

  void update() {
    y += speed;
    if (y > height) {
      y = random(-50, -10);
      x = random(width);
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
}
