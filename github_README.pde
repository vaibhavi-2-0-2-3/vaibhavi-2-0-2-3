String[][] strs = new String[6][2];
PFont font;

void setup() {
  size(1920, 1080);
  font = createFont("HelveticaNeue-48.vlw", 48);
  textFont(font);
  frameRate(30);
  textAlign(CENTER);
  textSize(40);
  background(255);
  fill(0);

  strs[0][0] = "Hey there!";
  strs[0][1] = "I'm Vaibhavi, a passionate developer.";

  strs[1][0] = "Currently, I’m tackling the world of web development.";
  strs[1][1] = "But really, I’m just here for the free Wi-Fi.";

  strs[2][0] = "My goal for 2025:";
  strs[2][1] = "Graduate as a confident developer (or at least pretend really well).";

  strs[3][0] = "Here’s my mantra:";
  strs[3][1] = "When in doubt, Google it. If that doesn’t work, restart the computer.";

  strs[4][0] = "Let’s connect!";
  strs[4][1] = "Reach me at: v.a.i.bhavi062024@gmail.com. I promise I’m friendly!";
}

int i = 0;
boolean delete = false;
int s = 0;
int offset = 50;
int mainFontSize = 60;
int secondaryFontSize = 40;

void draw() {
  background(255);

  if (s < strs.length) {
    if ((strs[s][0].length() >= i || strs[s][1].length() >= i) && !delete) {
      if (strs[s][0].length() >= i) {
        textSize(mainFontSize);
        text(strs[s][0].substring(0, i), width/2, height/2 - offset);
      } else {
        textSize(mainFontSize);
        text(strs[s][0], width/2, height/2 - offset);
      }
      if (strs[s][1].length() >= i) {
        textSize(secondaryFontSize);
        text(strs[s][1].substring(0, i), width/2, height/2 + offset);
      } else {
        textSize(secondaryFontSize);
        text(strs[s][1], width/2, height/2 + offset);
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
          text(strs[s][0].substring(0, i - 1), width/2, height/2 - offset);
        } else {
          textSize(mainFontSize);
          text(strs[s][0], width/2, height/2 - offset);
        }
        if (i < strs[s][1].length()) {
          textSize(secondaryFontSize);
          text(strs[s][1].substring(0, i - 1), width/2, height/2 + offset);
        } else {
          textSize(secondaryFontSize);
          text(strs[s][1], width/2, height/2 + offset);
        }
        i--;
      } else {
        delete = false;
        s++;
      }
    }
  }
}
