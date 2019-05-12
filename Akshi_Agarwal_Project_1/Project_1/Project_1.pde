/*

* Class: CMSC 388E
* Project 1
* Name: Akshita Agarwal
* Title of the Piece: "Wait, go Incognito first”
* Note: There is an image in the 'data' folder
*/


float x; //used to translate the (0,0) point to move eye ball
boolean canGoLeft; // a check for when the eyeball has reached the far right

void setup() {

      x = 0;
      canGoLeft = false; 

      //setting the size of the artboard
      size(600,600);
      //setting a background image
      PImage img;
      /*
        Background image - https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiN7o_m1s3gAhUXCTQIHW4ZCTMQjRx6BAgBEAU&url=http%3A%2F%2Fcvkom.dynns.com%2Febay-gutschein-einfach-sparsam.html&psig=AOvVaw2YaKl3n0oaPXDP2i54yekj&ust=1550867744548500
      */
      img = loadImage("background.jpg");
      /*Resizing the image. Processing needs the image to be 
      the to be the same size as the artboard.*/
      img.resize(width, height);
       //setting the background image
      background(img);

}

void draw() {
  
      // setting the (0,0) coordinates to the center
      translate(width/2,height/2);

      //Making the white part of the eye
      stroke(0);
      strokeWeight(3);
      fill(255);
      ellipse(0,0, 680, 300);

      //draw green eyeBall
      eyeBall();

}

/*    
      This function makes the eyeball and processes movement for it     
*/
void eyeBall(){
  
      // eyeball movement
      pushMatrix();

      if (x < 120 && canGoLeft == false) { //moves eyeball to (your) right
            x = x + 2;
      } else if(x == 120) { //when eyeball is on the far right
            canGoLeft = true;
            x = x - 2;
            delay(1500); //eyeball momentarily pauses
      } else if (canGoLeft == true && x >= -90) { //moves eyeball to (your) left
            x = x -2;
      } else { //when eyeball is on the far left
            canGoLeft = false;
            x = x + 2;
            delay(1500); //eyeball momentarily pauses
      }

      /* 
            value of x is continuosly changing above. 
            This determines where the eyeball will be drawn each time.
      */
      translate(x, 0);

      // drawing the circle for the eyeball with a black outline
      strokeWeight(5);
      stroke(0);
      // filling the circle with a green color
      fill(#335222);
      ellipse(0,0, 265, 265);

      // drawing the lines inside the eyeball
      for(int angle = 0;angle <= 100 ; angle = angle + 10) {
            pushMatrix();
            stroke(0);
            strokeWeight(2);
            rotate(angle);
            line(-130,0,130,0);
            popMatrix();
      }
      
      // drawing the iris of the eye with a white outline
      stroke(255);
      strokeWeight(3);
      fill(0);
      ellipse(0,0, 95, 95);

      popMatrix();

}
