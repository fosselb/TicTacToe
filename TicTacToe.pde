//Things to Add:
// - question mark operators for simple if/else statement functions

import java.util.Arrays;

private final int innerBoxWidth = 650;
private final int innerBoxHeight = 650;
private final int largeBoxMargin = 50;
private final int lineLength = 650;
private final int smallBoxMargin = 40;
private final int circleDiameter = 175;
private String[] playerMoves = new String[9]; //Players Data
private final int[] point0 = {largeBoxMargin, largeBoxMargin};
private final int[] point1 = {largeBoxMargin + innerBoxWidth/3, largeBoxMargin};
private final int[] point2 = {largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin};
private final int[] point3 = {largeBoxMargin + innerBoxWidth, largeBoxMargin};

private final int[] point4 = {largeBoxMargin, largeBoxMargin + innerBoxHeight/3};
private final int[] point5 = {largeBoxMargin + innerBoxWidth/3, largeBoxMargin + innerBoxHeight/3};
private final int[] point6 = {largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin + innerBoxHeight/3};
private final int[] point7 = {largeBoxMargin + innerBoxWidth, largeBoxMargin + innerBoxHeight/3};

private final int[] point8 = {largeBoxMargin, largeBoxMargin + innerBoxHeight*2/3};
private final int[] point9 = {largeBoxMargin + innerBoxWidth/3, largeBoxMargin + innerBoxHeight*2/3};
private final int[] point10 = {largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin + innerBoxHeight*2/3};
private final int[] point11 = {largeBoxMargin + innerBoxWidth, largeBoxMargin + innerBoxHeight*2/3};

private final int[] point12 = {largeBoxMargin, largeBoxMargin + innerBoxHeight};
private final int[] point13 = {largeBoxMargin + innerBoxWidth/3, largeBoxMargin + innerBoxHeight};
private final int[] point14 = {largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin + innerBoxHeight};
private final int[] point15 = {largeBoxMargin + innerBoxWidth, largeBoxMargin + innerBoxHeight};


public void setup() {
  size(750, 750);
  background(0);
  stroke(255);
  //Outline of game board
  line(largeBoxMargin + innerBoxWidth/3, largeBoxMargin, largeBoxMargin + innerBoxWidth/3, largeBoxMargin + lineLength);
  line(largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin, largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin + lineLength);
  line(largeBoxMargin, largeBoxMargin + innerBoxHeight/3, largeBoxMargin + lineLength, largeBoxMargin + innerBoxHeight/3);
  line(largeBoxMargin, largeBoxMargin + innerBoxHeight*2/3, largeBoxMargin + lineLength, largeBoxMargin + innerBoxHeight*2/3);
}

public void draw() {
  //drawAtPosition(1, 0);
  //drawAtPosition(1, 1);
  //drawAtPosition(1, 2);
  //drawAtPosition(1, 3);
  //drawAtPosition(1, 4);
  //drawAtPosition(1, 5);
  //drawAtPosition(1, 6);
  //drawAtPosition(1, 7);
  //drawAtPosition(1, 8);
  //drawAtPosition(0, 8);
  
  //drawAtPosition(0, 1);
  //drawAtPosition(0, 2);
  //drawAtPosition(1, 8);
  //drawAtPosition(1, 4);
  //drawAtPosition(0, 4);
  
  //System.out.println(Arrays.toString(playerMoves));
  //System.out.println("-----------");
}

//methods

public void mouseClicked() {
  if (validClick(mouseX, mouseY)) {
    drawAtPosition(0, positionToDraw(mouseX, mouseY));
  } else { 
    //do nothing
  }
}

public boolean validClick(int x, int y) {
  if (x < largeBoxMargin || x > (largeBoxMargin + innerBoxWidth) || y < largeBoxMargin || y > (largeBoxMargin + innerBoxWidth)) {
    return false;
  } else {
    return true;
  }
}

public int positionToDraw(int x, int y) {
  if (x > point0[0] && x < point1[0] && y > point0[1] && y < point4[1]) {
    return 0;
  } else if (x > point1[0] && x < point2[0] && y > point1[1] && y < point5[1]) {
    return 1;
  } else if (x > point2[0] && x < point3[0] && y > point2[1] && y < point6[1]) {
    return 2;
  } else if (x > point4[0] && x < point5[0] && y > point4[1] && y < point8[1]) {
    return 3;
  } else if (x > point5[0] && x < point6[0] && y > point5[1] && y < point9[1]) {
    return 4;
  } else if (x > point6[0] && x < point7[0] && y > point6[1] && y < point10[1]) {
    return 5;
  } else if (x > point8[0] && x < point9[0] && y > point8[1] && y < point12[1]) {
    return 6;
  } else if (x > point9[0] && x < point10[0] && y > point9[1] && y < point13[1]) {
    return 7;
  }  else if (x > point10[0] && x < point11[0] && y > point10[1] && y < point14[1]) {
    return 8;
  } else {
    System.out.println("Error in positionToDraw()");
    return 10;
  }
}


public void drawX() {
  stroke(255); 
  line(largeBoxMargin + smallBoxMargin, largeBoxMargin + smallBoxMargin, largeBoxMargin + innerBoxWidth/3 - smallBoxMargin, largeBoxMargin + innerBoxHeight/3 - smallBoxMargin);
  line(largeBoxMargin + innerBoxWidth/3 - smallBoxMargin, largeBoxMargin + smallBoxMargin, largeBoxMargin + smallBoxMargin, largeBoxMargin + innerBoxHeight/3 - smallBoxMargin);
}

public void drawO() {
  stroke(255);
  noFill();
  ellipse(largeBoxMargin + innerBoxWidth/6, largeBoxMargin + innerBoxHeight/6, circleDiameter, circleDiameter);
}

public void drawAtPosition(int player, int position) {  
  if (validMove(position)) {
   updatePlayerData(player, position);
    
    switch (position) { 
      case 0: 
        playerToDraw(player); 
        break; 
      case 1: 
        translate(innerBoxWidth/3, 0);
        playerToDraw(player); 
        translate(-innerBoxWidth/3, 0);
        break; 
      case 2: 
        translate(innerBoxWidth*2/3, 0);
        playerToDraw(player);  
        translate(-innerBoxWidth*2/3, 0);
        break; 
      case 3: 
        translate(0, innerBoxHeight/3);
        playerToDraw(player); 
        translate(0, -innerBoxHeight/3);
        break; 
      case 4: 
        translate(innerBoxWidth/3, innerBoxHeight/3);
        playerToDraw(player);  
        translate(-innerBoxWidth/3, -innerBoxHeight/3);
        break; 
      case 5: 
        translate(innerBoxWidth*2/3, innerBoxHeight/3);
        playerToDraw(player); 
        translate(-innerBoxWidth*2/3, -innerBoxHeight/3);
        break; 
      case 6: 
        translate(0, innerBoxHeight*2/3);
        playerToDraw(player); 
        translate(0, -innerBoxHeight*2/3);
        break; 
      case 7: 
        translate(innerBoxWidth/3, innerBoxHeight*2/3);
        playerToDraw(player); 
        translate(-innerBoxWidth/3, -innerBoxHeight*2/3);
        break; 
      case 8: 
        translate(innerBoxWidth*2/3, innerBoxHeight*2/3);
        playerToDraw(player); 
        translate(-innerBoxWidth*2/3, -innerBoxHeight*2/3); 
        break; 
      default: 
      System.out.println("default");
        break; 
    }
  } else {
    System.out.println("Not a valid move");
  }
}

public void playerToDraw(int player) {
  if (player == 0) {
    drawX();
  } else if (player == 1) {
    drawO();
  } else {
    System.out.println("Incorrect input");
  }
}

public boolean validMove(int position) {
  if (!alreadyPlayed(position) && !isBoardFull()) {
    return true;
  } else {
    return false;
  }
}

public boolean isBoardFull() {
  if (Arrays.asList(playerMoves).contains(null)) {
    return false;
  } else {
    return true;
  }
}

public boolean alreadyPlayed(int position) {
  if (playerMoves[position] == null) {
    return false;
  } else {
    return true;
  }
}

public void updatePlayerData(int player, int position) {
  if (player == 0) {
    playerMoves[position] = "X";
  } else if (player == 1) {
    playerMoves[position] = "O";
  } else {
    System.out.println("Incorrect input : drawAtPosition");
  }
}

public void threeInARow() {
}
