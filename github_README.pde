// Import GIFExport library
import gifAnimation.*;

GIFMaker gifExport;
int frameCountLimit = 300;  // Limit for the number of frames for the GIF
int currentFrame = 0;

// Define the strings to be displayed
String[][] strs = new String[6][2];
PFont font;

void setup() {
  size(1920, 1080);  // Set the size of the canvas
  font = createFont("HelveticaNeue-48.vlw", 48);  // Load font
  textFont(font);
  frameRate(30);  // Set the frame rate
  textAlign(CENTER);
  textSize(40);
  background(255);
  fill(0);

  // Initialize the strings to be displayed
  strs[0][0] = "Hey, I’m Vaibhavi!";
  strs[0][1] = "A tech lover, coffee addict, and professional Googler.";

  strs[1][0] = "Currently, I’m tackling the world of web development.";
  strs[1][1] = "Solving problems, writing code, and occasionally pretending to be a wizard.";

  strs[2][0] = "Fun Fact:";
  strs[2][1] = "I speak fluent JavaScript... and sarcasm.";

  strs[3][0] = "My goal is simple:";
  strs[3][1] = "Graduate as a confident developer (and maybe pretend I know what I’m doing).";

  strs[4][0] = "Random Thought:";
  strs[4][1] = "The ‘it works on my machine’ excuse is just part of the dev process, right?";

  strs[5][0] = "Let’s connect!";
  strs[5][1] = "Reach me at: your-email@example.com. I promise I’m friendly!";

  // Initialize GIFExport
  gifExport = new GIFMaker(this, "output.gif");
  gifExport.setRepeat(0);  // Set GIF to loop forever
  gifExport.setQuality(10);  // Set the quality (higher value is better, but more memory-intensive)
}

int i = 0;  // For controlling text animation
int s = 0;  // For switching between text messages
boolean delete = false;
int offset = 50;
int mainFontSize = 60;
int secondaryFontSize = 40;

void draw() {
  background(255);

  if (s < strs.length) {
    if ((strs[s][0].length() >= i || strs[s][1].length() >= i) && !delete) {
      if (strs[s][0].length() >= i) {
        textSize(mainFontSize);
        text(strs[s][0].substring(0, i), width / 2, height / 2 - offset);
      } else {
        textSize(mainFontSize);
        text(strs[s][0], width / 2, height / 2 - offset);
      }
      if (strs[s][1].length() >= i) {
        textSize(secondaryFontSize);
        text(strs[s][1].substring(0, i), width / 2, height / 2 + offset);
      } else {
        textSize(secondaryFontSize);
        text(strs[s][1], width / 2, height / 2 + offset);
      }
      i++;
    } else {
      if (!delete) {
        delay(1500);
      }
      delete = true;
    }

    if (delete) {
      if (i > 0) {
        if (i < strs[s][0].length()) {
          textSize(mainFontSize);
          text(strs[s][0].substring(0, i - 1), width / 2, height / 2 - offset);
        } else {
          textSize(mainFontSize);
          text(strs[s][0], width / 2, height / 2 - offset);
        }
        if (i < strs[s][1].length()) {
          textSize(secondaryFontSize);
          text(strs[s][1].substring(0, i - 1), width / 2, height / 2 + offset);
        } else {
          textSize(secondaryFontSize);
          text(strs[s][1], width / 2, height / 2 + offset);
        }
        i--;
      } else {
        delete = false;
        s++;
      }
    }

    // Capture the current frame and add it to the GIF
    gifExport.addFrame();

    // Stop after the desired number of frames
    if (frameCount >= frameCountLimit) {
      gifExport.finish();  // Finish the GIF creation
      noLoop();  // Stop the animation
    }
  }
}

