//Things to Add:
// - question mark operators for simple if/else statement functions

import java.util.Arrays;

private final int innerBoxWidth = 650;
private final int innerBoxHeight = 650;
private final int largeBoxMargin = 50;
private final int lineLength = 650;
private final int smallBoxMargin = 50;
private final int circleDiameter = 140;
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
//private final int[] point15 = {largeBoxMargin + innerBoxWidth, largeBoxMargin + innerBoxHeight};

private int gameState = 0;
private String winningPlayer = "";

//private int backgroundColor = #658499;
private int backgroundColor = #31909c;
private int textColor = #3d319c;
private int gameBoardColor = #FFFFFF;
private int XColor = #9c3d31;
private int OColor = #909c31;


public void setup() {
  size(750, 750);
  drawGameBoard();
}

public void draw() {
  if (gameState == 0) {
    initScreen();
  } else if (gameState == 1) {
    player0Screen();
  } else if (gameState == 2) {
    player1Screen();
  } else if (gameState == 3) {
    gameOverScreen();
  }   
}

//Game State methods

public void drawGameBoard() {
  //background(60);
  background(backgroundColor);
  stroke(gameBoardColor);
  strokeWeight(10);
  //Outline of game board
  line(largeBoxMargin + innerBoxWidth/3, largeBoxMargin, largeBoxMargin + innerBoxWidth/3, largeBoxMargin + lineLength);
  line(largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin, largeBoxMargin + innerBoxWidth*2/3, largeBoxMargin + lineLength);
  line(largeBoxMargin, largeBoxMargin + innerBoxHeight/3, largeBoxMargin + lineLength, largeBoxMargin + innerBoxHeight/3);
  line(largeBoxMargin, largeBoxMargin + innerBoxHeight*2/3, largeBoxMargin + lineLength, largeBoxMargin + innerBoxHeight*2/3);
}

public void initScreen() {
  textSize(40);
  //fill(219, 43, 31);
  fill(textColor);
  textAlign(CENTER);
  text("TIC-TAC-TOE", width/2, largeBoxMargin - 10); 
  text("Click anywhere to begin", width/2, largeBoxMargin*2 + innerBoxHeight - 10); 
}

public void player0Screen() {
  eraseBeginInstruction();
  if (isBoardFull() || threeInARow() != "") {
    winningPlayer = threeInARow();
    gameState = 3;
  }
}

public void player1Screen() {
  eraseBeginInstruction();
  if (isBoardFull() || threeInARow() != "") {
    winningPlayer = threeInARow();
    gameState = 3;
  }
}

public void gameOverScreen() {
  textSize(40);
  fill(textColor);
  textAlign(CENTER);
  if (winningPlayer == "X") {
    text("X Wins!", width/2, largeBoxMargin*2 + innerBoxHeight - 10); 
  } else if (winningPlayer == "O") {
    text("O Wins!", width/2, largeBoxMargin*2 + innerBoxHeight - 10); 
  } else {
    text("Cat's Game. Nobody Wins.", width/2, largeBoxMargin*2 + innerBoxHeight - 10); 
  }
}

public void mouseClicked() {
  //System.out.println("Game State: " + gameState);
  if (gameState == 0) {
    startGame();
  } else if (gameState == 1) {
    //System.out.println("Game State # 1 START");
    if (validClick(mouseX, mouseY) && validMove(positionToDraw(mouseX, mouseY))) {
      drawAtPosition(0, positionToDraw(mouseX, mouseY));
      switchPlayer();
    }
  } else if (gameState == 2) {
    //System.out.println("Game State # 2 START");
    if (validClick(mouseX, mouseY) && validMove(positionToDraw(mouseX, mouseY))) {
      drawAtPosition(1, positionToDraw(mouseX, mouseY));
      switchPlayer();
    }
  } else if (gameState == 3) {
    restart();
  }
  //System.out.println("------------");
}

public void eraseBeginInstruction() {
  fill(backgroundColor);
  noStroke();
  rect(largeBoxMargin, largeBoxMargin + innerBoxHeight + 5, innerBoxWidth, largeBoxMargin);
}

//temp
public boolean spaceBarPressed() {
  if (keyPressed) {
    if (key == ' ') {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

public void startGame() {
  gameState = 1;
}

public void restart() {
  eraseBeginInstruction();
  for (int i = 0; i < playerMoves.length; i++) {
    playerMoves[i] = null;
  }
  drawGameBoard();
  gameState = 0;
}

public void switchPlayer() {
  if (gameState == 1) {
    gameState = 2;
  } else if (gameState == 2) {
    gameState = 1;
  }
}


//Other methods

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
  stroke(XColor); 
  line(largeBoxMargin + smallBoxMargin, largeBoxMargin + smallBoxMargin, largeBoxMargin + innerBoxWidth/3 - smallBoxMargin, largeBoxMargin + innerBoxHeight/3 - smallBoxMargin);
  line(largeBoxMargin + innerBoxWidth/3 - smallBoxMargin, largeBoxMargin + smallBoxMargin, largeBoxMargin + smallBoxMargin, largeBoxMargin + innerBoxHeight/3 - smallBoxMargin);
}

public void drawO() {
  stroke(OColor);
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

public String threeInARow() {
  if (playerMoves[0] == "X" && playerMoves[1] == "X" && playerMoves[2] == "X") {
    return "X";
  } else if (playerMoves[3] == "X" && playerMoves[4] == "X" && playerMoves[5] == "X") {
    return "X";
  } else if (playerMoves[6] == "X" && playerMoves[7] == "X" && playerMoves[8] == "X") {
    return "X";
  } else if (playerMoves[0] == "X" && playerMoves[3] == "X" && playerMoves[6] == "X") {
    return "X";
  } else if (playerMoves[1] == "X" && playerMoves[4] == "X" && playerMoves[7] == "X") {
    return "X";
  } else if (playerMoves[2] == "X" && playerMoves[5] == "X" && playerMoves[8] == "X") {
    return "X";
  } else if (playerMoves[0] == "X" && playerMoves[4] == "X" && playerMoves[8] == "X") {
    return "X";
  } else if (playerMoves[2] == "X" && playerMoves[4] == "X" && playerMoves[6] == "X") {
    return "X";
  } else if (playerMoves[0] == "O" && playerMoves[1] == "O" && playerMoves[2] == "O") {
    return "O";
  } else if (playerMoves[3] == "O" && playerMoves[4] == "O" && playerMoves[5] == "O") {
    return "O";
  } else if (playerMoves[6] == "O" && playerMoves[7] == "O" && playerMoves[8] == "O") {
    return "O";
  } else if (playerMoves[0] == "O" && playerMoves[3] == "O" && playerMoves[6] == "O") {
    return "O";
  } else if (playerMoves[1] == "O" && playerMoves[4] == "O" && playerMoves[7] == "O") {
    return "O";
  } else if (playerMoves[2] == "O" && playerMoves[5] == "O" && playerMoves[8] == "O") {
    return "O";
  } else if (playerMoves[0] == "O" && playerMoves[4] == "O" && playerMoves[8] == "O") {
    return "O";
  } else if (playerMoves[0] == "O" && playerMoves[4] == "O" && playerMoves[8] == "O") {
    return "O";
  } else {
    return "";
  }
}
