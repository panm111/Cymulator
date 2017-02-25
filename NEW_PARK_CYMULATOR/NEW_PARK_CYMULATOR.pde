import processing.serial.*;
import processing.video.*;

// The serial port:
Serial myPort;       
String serial;
Movie cityMovie;

int myVal=0;

void setup(){
  //fullScreen();
  // List all the available serial ports:
printArray(Serial.list());

// Open the port you are using at the rate you want:
myPort = new Serial(this, Serial.list()[5], 9600);

size(1280, 720);
  //myMovie = new Movie(this, "Windows.mp4");
  //myMovie.play();
  //myMovie.loop();
  cityMovie = new Movie(this, "Park60FPS720.mp4");
  cityMovie.play();
  cityMovie.loop();
  
}
// Send a capital A out the serial port:
void draw(){
  println(myVal);
  image(cityMovie, 0,0);
  //image(movies[idx],0,0);
     if(myVal == 0){
        cityMovie.pause();
      } else if(myVal > 0 && myVal < 5){
        cityMovie.play();
        cityMovie.speed(0.5);
      } else if(myVal >= 5 && myVal < 15){
        cityMovie.speed(1);
      } else if(myVal >= 15 && myVal <= 20){
        cityMovie.speed(2);
      } else {
        cityMovie.speed(2.5);
      }
      //cityMovie.stop();
      //cityMovie.stop();
      //cityMovie.play();
      //cityMovie.loop();
      //println("city");
      
        
  
  //image(movies[idx],0,0);
  
  //if(keyPressed){
  // if(key == 'a'){
  //  image(movies[0], 0,0);
  //  movies[1].stop();
  //  movies[0].stop();
  //  movies[0].play();
  //  movies[0].loop();
  //  println("city");
  // }else if (key == 's'){
  //  image(movies[1],0,0); 
  //  movies[0].stop();
  //  movies[1].stop();
  //  movies[1].play();
  //  movies[1].loop();
  //  println("park");
  // }
  //}
  
  //if(myVal == 0){
  //  movies[idx].pause();
  //} else if(myVal > 0 && myVal < 10){
  //  movies[idx].play();
  //  movies[idx].speed(0.5);
  //} else if(myVal >= 10 && myVal < 20){
  //  movies[idx].speed(1);
  //} else {
  //  movies[idx].speed(2);
  //}
  
  
  fill(255, 255, 255);
  rect(0,0,240, 40);
  fill(0,0,0);
  textSize(32);
  text("SPEED: ", 5, 30);
  fill(0,0,0);
  textSize(32);
  text(myVal, 120, 30);
  fill(0,0,0);
  textSize(32);
  text("MPH", 160, 30);
}

void serialEvent(Serial myPort){
 String inString=myPort.readStringUntil('\n');
 if(inString!=null){
   inString=trim(inString);
   myVal=int(inString);
 }
}

void movieEvent(Movie m) {
  m.read();
}