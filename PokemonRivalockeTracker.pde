/* PokemonRivalockeTracker.pde
 * 
 * Main file of the program. This is where the magic happens.
 * Contains the two most important functions in the whole application: setup() and draw()
 * Naming restriction forces this file to be named the same as the folder it is saved within,
 * otherwise it will not run correctly during development and compilation.
 * 
 * See code for more detailed commenting on execution process.
 * 
 * J Karstin Neill    08.16.18
 */

//Declare Pages
Page spotlightPage;
Page playersPage;
Page gymsPage;
Page playerCreationPage;
Page teamCreationPage;
Page pokemonCreationPage;
Page breedSelectionPage;
Page typeSelectionPage;
Page genderSelectionPage;
Page levelNumberPage;
Page gymCreationPage;
Page namingPage;

//Declare Tiles
Menu mainMenu;
Menu playerMenu;
Menu gymMenu;
Menu playerCreationMenu;
Menu teamCreationMenu;
Menu pokemonCreationMenu;
Label spotlightWelcomeLabel;
Label namingPageNameLabel;
Label levelNumberLabel;
Label gymCreationWelcomeLabel;
Keypad namingKeypad;
Keypad numberKeypad;
Keypad typeKeypad;
Keypad genderKeypad;
Button createPlayerButton;
Button createTeamButton;
Button createPokemonButton;
Button setNameButton;
Button setLevelButton;
Button delButton;
Button backButton;

//Declare system variables
String nameData;
int    nameDataCharCount;
String numberData;
int    numberDataCharCount;
String playerName;
Team   playerTeam;
String          pokemonName;
PokeData.Breed  pokemonBreed;
PokeData.Type   pokemonType;
PokeData.Gender pokemonGender;
int             pokemonLevel;
Collection<Page> pageHistory;
Page currentPage;
Collection<Player> players; //Currently unused; here as a placeholder if needed in the future

//Runs once at the beginning of the application
//Similar to the "int main()" function in C++ programs
public void setup() {
  //Set boundaries of the window size (width and height in number of pixels)
  //This is the size of the draw-able area inside the application window, not including the header bar at the top of the window
  //Dimensions of the window size are stored in system variables named "width" and "height," which can be accessed at any time
  size(600, 400);
  
  //Initialize Page variables
  spotlightPage       = new Page("SPOTLIGHT");
  playersPage         = new Page("PLAYERS");
  gymsPage            = new Page("GYMS");
  playerCreationPage  = new Page("+ ADD A PLAYER");
  teamCreationPage    = new Page("BUILD A TEAM");
  pokemonCreationPage = new Page("+ ADD A POKEMON");
  breedSelectionPage  = new Page("CHOOSE A BREED");
  typeSelectionPage   = new Page("CHOOSE A TYPE");
  genderSelectionPage = new Page("CHOOSE A GENDER");
  levelNumberPage     = new Page("SET THEIR LEVEL");
  gymCreationPage     = new Page("+ ADD A GYM");
  namingPage          = new Page("CREATE A NAME");
  
  //Intialize Tile variables
  mainMenu            = new Menu(new Coord(width-110,  10), new Coord(       90, 40), 6);
  playerMenu          = new Menu(new Coord(       80,  80), new Coord(width-280, 40), 5);
  gymMenu             = new Menu(new Coord(       80,  80), new Coord(width-280, 40), 8);
  playerCreationMenu  = new Menu(new Coord(       80, 100), new Coord(width-280, 40), 3);
  teamCreationMenu    = new Menu(new Coord(       80,  20), new Coord(width-280, 40), 7);
  pokemonCreationMenu = new Menu(new Coord(       80,  40), new Coord(width-280, 40), 6);
  spotlightWelcomeLabel   = new Label(new Coord(20, 20), new Coord(350, 30), "Welcome to the SPOTLIGHT Page!");
  namingPageNameLabel     = new Label(new Coord(20, 20), new Coord(350, 30), "NAME: ");
  levelNumberLabel        = new Label(new Coord(20, 20), new Coord(350, 30), "LEVEL: ");
  gymCreationWelcomeLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future GYM CREATION Page, coming soon!");
  namingKeypad = new Keypad(new Coord( 80, 100), new Coord(10, 4));
  numberKeypad = new Keypad(new Coord( 80, 100), new Coord(3, 4));
  typeKeypad   = new Keypad(new Coord( 80,  80), new Coord(4, 5), new Coord(70, 30), new Coord(10, 10));
  genderKeypad = new Keypad(new Coord( 60, 120), new Coord(2, 1), new Coord(100, 30), new Coord(10, 10));
  createPlayerButton  = new Button(new Coord( 90, 210), new Coord(width-280, 40), "CREATE PLAYER");
  createTeamButton    = new Button(new Coord (90, 330), new Coord(width-280, 40), "CREATE TEAM");
  createPokemonButton = new Button(new Coord( 90, 300), new Coord(width-280, 40), "CREATE POKEMON");
  setNameButton       = new Button(new Coord( 90, 350), new Coord(width-280, 40), "SET NAME");
  setLevelButton      = new Button(new Coord( 90, 350), new Coord(width-280, 40), "SET LEVEL");
  delButton           = new Button(new Coord(500, 140), new Coord( 50, 30), "DEL");
  backButton          = new Button(new Coord(width-70, height-50), new Coord(50, 30), "BACK");
  
  //Populate keypads
  
  /* 3RD GEN FORMAT
   * ABC DEF  .
   * GHI JKL  ,
   * MNO PQRS 
   * TUV WXYA 
   */
  namingKeypad.addButton("A", new Coord(0, 0));
  namingKeypad.addButton("B", new Coord(1, 0));
  namingKeypad.addButton("C", new Coord(2, 0));
  namingKeypad.addButton("D", new Coord(4, 0));
  namingKeypad.addButton("E", new Coord(5, 0));
  namingKeypad.addButton("F", new Coord(6, 0));
  namingKeypad.addButton(".", new Coord(9, 0));
  namingKeypad.addButton("G", new Coord(0, 1));
  namingKeypad.addButton("H", new Coord(1, 1));
  namingKeypad.addButton("I", new Coord(2, 1));
  namingKeypad.addButton("J", new Coord(4, 1));
  namingKeypad.addButton("K", new Coord(5, 1));
  namingKeypad.addButton("L", new Coord(6, 1));
  namingKeypad.addButton(",", new Coord(9, 1));
  namingKeypad.addButton("M", new Coord(0, 2));
  namingKeypad.addButton("N", new Coord(1, 2));
  namingKeypad.addButton("O", new Coord(2, 2));
  namingKeypad.addButton("P", new Coord(4, 2));
  namingKeypad.addButton("Q", new Coord(5, 2));
  namingKeypad.addButton("R", new Coord(6, 2));
  namingKeypad.addButton("S", new Coord(7, 2));
  namingKeypad.addButton("T", new Coord(0, 3));
  namingKeypad.addButton("U", new Coord(1, 3));
  namingKeypad.addButton("V", new Coord(2, 3));
  namingKeypad.addButton("W", new Coord(4, 3));
  namingKeypad.addButton("X", new Coord(5, 3));
  namingKeypad.addButton("Y", new Coord(6, 3));
  namingKeypad.addButton("Z", new Coord(7, 3));
  namingKeypad.addButton(" ", new Coord(9, 2));
  numberKeypad.addButton("7");
  numberKeypad.addButton("8");
  numberKeypad.addButton("9");
  numberKeypad.addButton("4");
  numberKeypad.addButton("5");
  numberKeypad.addButton("6");
  numberKeypad.addButton("1");
  numberKeypad.addButton("2");
  numberKeypad.addButton("3");
  numberKeypad.addButton("0");
  typeKeypad.addButton("NORMAL");
  typeKeypad.addButton("FIGHT" );
  typeKeypad.addButton("FLYING");
  typeKeypad.addButton("POISON");
  typeKeypad.addButton("GROUND");
  typeKeypad.addButton("ROCK"  );
  typeKeypad.addButton("BUG"   );
  typeKeypad.addButton("GHOST" );
  typeKeypad.addButton("STEEL" );
  typeKeypad.addButton("FIRE"  );
  typeKeypad.addButton("WATER" );
  typeKeypad.addButton("GRASS" );
  typeKeypad.addButton("ELECTR");
  typeKeypad.addButton("PSYCHC");
  typeKeypad.addButton("ICE"   );
  typeKeypad.addButton("DRAGON");
  typeKeypad.addButton("DARK"  );
  typeKeypad.addButton("FAIRY" );
  genderKeypad.addButton("FEMALE");
  genderKeypad.addButton("MALE"  );
  
  //Populate pages
  spotlightPage.addTile(spotlightWelcomeLabel);
  spotlightPage.addMenu(mainMenu);
  playersPage.addMenu(playerMenu);
  playersPage.addMenu(mainMenu);
  gymsPage.addMenu(gymMenu);
  gymsPage.addMenu(mainMenu);
  playerCreationPage.addMenu(playerCreationMenu);
  playerCreationPage.addButton(createPlayerButton);
  playerCreationPage.addButton(backButton);
  teamCreationPage.addMenu(teamCreationMenu);
  teamCreationPage.addButton(createTeamButton);
  teamCreationPage.addButton(backButton);
  pokemonCreationPage.addMenu(pokemonCreationMenu);
  pokemonCreationPage.addButton(createPokemonButton);
  pokemonCreationPage.addButton(backButton);
  breedSelectionPage.addButton(backButton);
  typeSelectionPage.addKeypad(typeKeypad);
  typeSelectionPage.addButton(backButton);
  genderSelectionPage.addKeypad(genderKeypad);
  genderSelectionPage.addButton(backButton);
  levelNumberPage.addTile(levelNumberLabel);
  levelNumberPage.addKeypad(numberKeypad);
  levelNumberPage.addButton(delButton);
  levelNumberPage.addButton(setLevelButton);
  levelNumberPage.addButton(backButton);
  gymCreationPage.addTile(gymCreationWelcomeLabel);
  gymCreationPage.addButton(backButton);
  namingPage.addTile(namingPageNameLabel);
  namingPage.addKeypad(namingKeypad);
  namingPage.addButton(delButton);
  namingPage.addButton(setNameButton);
  namingPage.addButton(backButton);
  
  //Populate menus
  mainMenu.addPage(spotlightPage);
  mainMenu.addPage(playersPage);
  mainMenu.addPage(gymsPage);
  playerMenu.addPage(playerCreationPage);
  gymMenu.addPage(gymCreationPage);
  playerCreationMenu.addPage(namingPage);
  playerCreationMenu.addPage(teamCreationPage);
  teamCreationMenu.addPage(pokemonCreationPage);
  pokemonCreationMenu.addPage(namingPage);
  pokemonCreationMenu.addPage(breedSelectionPage);
  pokemonCreationMenu.addPage(typeSelectionPage);
  pokemonCreationMenu.addPage(genderSelectionPage);
  pokemonCreationMenu.addPage(levelNumberPage);
  
  //Initialize system variables
  resetNameData();
  resetNumberData();
  resetPokemonData();
  pageHistory = new Collection<Page>();
  currentPage = spotlightPage;
  
  //Initialize players collection
  players = new Collection<Player>();
}

//Called once each time a mouse button is pressed down and then released
//Isn't called until the mouse button has been released
public void mouseClicked() {
  Button currentButton = null;
  
  //currentPage Menu Buttons
  Menu currentMenu = null;
  for (int m=0; currentPage.getMenu(m) != null; m++) {
    currentMenu = currentPage.getMenu(m);
    for (int b=0; currentMenu.getButton(b) != null; b++) {
      currentButton = currentMenu.getButton(b);
      if (currentButton.click(new Coord(mouseX, mouseY))) {
        //Save currentPage to pageHistory, and change currentPage to destination designated by menu button
        pageHistory.addElement(currentPage);
        currentPage = currentMenu.getPage(b);
        //Don't process any more mouse actions this frame
        return;
      }
    }
  }
  
  //Back Button
  //Search through all of currentPage's buttons
  for (int b=0; currentPage.getButton(b) != null; b++) {
    currentButton = currentPage.getButton(b);
    //If the currentButton is clicked and is the backButton
    if (currentButton.click(new Coord(mouseX, mouseY)) && currentButton == backButton) {
      //Reset nameData if leaving playerCreationPage or namingPage
      if (currentPage == playerCreationPage || currentPage == namingPage) resetNameData();
      if (currentPage == playerCreationPage || currentPage == levelNumberPage) resetNumberData();
      //Go back to previous page
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Player Creation Page Buttons
  if (currentPage == playerCreationPage) {
    //If CREATE PLAYER button is clicked, make new Player using nameData
    if (createPlayerButton.click(new Coord(mouseX, mouseY))) {
      //Create a new player using nameData
      Player p = new Player(playerName);
      //Rename playerTeam with playerName value; create a new empty team if one hasn't been created yet
      if (playerTeam == null) playerTeam = new Team(playerName + "'S TEAM");
      else playerTeam.rename(playerName + "'S TEAM");
      //Set player's team as playerTeam variable
      p.setTeam(playerTeam);
      //Add the main menu to player's profile page
      p.addMenu(mainMenu);
      //Add player to players collection
      players.addElement(p);
      //Add player to playersPage
      //Remove and temporarily save last page in playerMenu (always playerCreationPage)
      Page creationPage = playerMenu.removePage(playerMenu.pageCount()-1);
      //Add new player as page to playerMenu
      playerMenu.addPage(p);
      //Relabel page's corresponding button to be more user friendly
      playerMenu.getButton(playerMenu.pageCount()-1).setText(playerName + "'S PROFILE");
      //Put last page back on the end of the playerMenu page collection
      playerMenu.addPage(creationPage);
      //Clear out all pokemon from teamCreationMenu; this also clears pokemonCreationPage
      teamCreationMenu.wipe();
      //Add back the pokemonCreationPage to the teamCreationMenu
      teamCreationMenu.addPage(pokemonCreationPage);
      
      //DEBUG: Show player and summary of player's team
      println(p.summary());
      
      //Go back to previous page
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Team Creation Page Buttons
  if (currentPage == teamCreationPage) {
    //CREATE TEAM Button
    if (createTeamButton.click(new Coord(mouseX, mouseY))) {
      //Make a new Team with an empty name
      playerTeam = new Team("");
      //Populate playerTeam with pokemon from teamCreationMenu (stored as Pages, so cast as Pokemon)
      for (int p=0; p < teamCreationMenu.pageCount()-1; p++)
        playerTeam.addPokemon((Pokemon)teamCreationMenu.getPage(p));
      //Go back to previous page
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Pokemon Creation Page Buttons
  if (currentPage == pokemonCreationPage) {
    //CREATE POKEMON Button
    if (createPokemonButton.click(new Coord(mouseX, mouseY))) {
      //Create new pokemon with stored data
      Pokemon p = new Pokemon(pokemonName, pokemonBreed, pokemonType, pokemonGender, pokemonLevel);
      //Add mainMenu to pokemon's profile page
      p.addMenu(mainMenu);
      //Add pokemon to teamCreationMenu
      //Remove and temporarily save last page in teamCreationMenu (always pokemonCreationPage)
      Page creationPage = teamCreationMenu.removePage(teamCreationMenu.pageCount()-1);
      //Add new pokemon as page to teamCreationMenu
      teamCreationMenu.addPage(p);
      //If maximum of 6 pokemon per team has not yet been reached
      if (teamCreationMenu.pageCount() < 6) {
        //Put last page back on the end of the teamCreationMenu page collection
        teamCreationMenu.addPage(creationPage);
      }
      //Reset nameData
      resetNameData();
      //Reset numberData
      resetNumberData();
      //Reset pokemon data
      resetPokemonData();
      //Go back to previous page
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Pokemon Type Selection Page Buttons
  if (currentPage == typeSelectionPage) {
    //Check every Type button
    for (int b=0; typeKeypad.getButton(b) != null; b++) {
      currentButton = typeKeypad.getButton(b);
      //If a given Type button is clicked, set pokemonType to its corresponding PokeData.Type value
      if (currentButton.click(new Coord(mouseX, mouseY))) {
        if      (currentButton.getText() == "NORMAL") pokemonType = PokeData.Type.NORMAL;
        else if (currentButton.getText() == "FIGHT" )  pokemonType = PokeData.Type.FIGHT;
        else if (currentButton.getText() == "FLYING") pokemonType = PokeData.Type.FLYING;
        else if (currentButton.getText() == "POISON") pokemonType = PokeData.Type.POISON;
        else if (currentButton.getText() == "GROUND") pokemonType = PokeData.Type.GROUND;
        else if (currentButton.getText() == "ROCK"  ) pokemonType = PokeData.Type.ROCK;
        else if (currentButton.getText() == "BUG"   ) pokemonType = PokeData.Type.BUG;
        else if (currentButton.getText() == "GHOST" ) pokemonType = PokeData.Type.GHOST;
        else if (currentButton.getText() == "STEEL" ) pokemonType = PokeData.Type.STEEL;
        else if (currentButton.getText() == "FIRE"  ) pokemonType = PokeData.Type.FIRE;
        else if (currentButton.getText() == "WATER" ) pokemonType = PokeData.Type.WATER;
        else if (currentButton.getText() == "GRASS" ) pokemonType = PokeData.Type.GRASS;
        else if (currentButton.getText() == "ELECTR") pokemonType = PokeData.Type.ELECTR;
        else if (currentButton.getText() == "PSYCHC") pokemonType = PokeData.Type.PSYCHC;
        else if (currentButton.getText() == "ICE"   ) pokemonType = PokeData.Type.ICE;
        else if (currentButton.getText() == "DRAGON") pokemonType = PokeData.Type.DRAGON;
        else if (currentButton.getText() == "DARK"  ) pokemonType = PokeData.Type.DARK;
        else if (currentButton.getText() == "FAIRY" ) pokemonType = PokeData.Type.FAIRY;
        //Once type is selected, automatically move back to previous page
        currentPage = pageHistory.removeTail();
        //Don't process any more mouse actions this frame
        return;
      }
    }
  }
  
  //Gender Selection Page Buttons
  if (currentPage == genderSelectionPage) {
    for (int b=0; genderKeypad.getButton(b) != null; b++) {
      currentButton = genderKeypad.getButton(b);
      if (currentButton.click(new Coord(mouseX, mouseY))) {
        if      (currentButton.getText() == "FEMALE") pokemonGender = PokeData.Gender.FEMALE;
        else if (currentButton.getText() == "MALE"  ) pokemonGender = PokeData.Gender.MALE;
        //Once gender is selected, automatically move back to previous page
        currentPage = pageHistory.removeTail();
        //Don't process any more mouse actions this frame
        return;
      }
    }
  }
  
  //Level Number Page Buttons
  if (currentPage == levelNumberPage) {
    //DEL Button
    if (delButton.click(new Coord(mouseX, mouseY))) {
      //If there is at least one character in nameData
      if (numberDataCharCount > 0) {
        //Remove last character by using String.substring()
        numberDataCharCount--;
        numberData = numberData.substring(0, numberDataCharCount);
        //Update levelNumberLabel to reflect current numberData value
        levelNumberLabel.setText("LEVEL: " + numberData);
        //Don't process any more mouse actions this frame
        return;
      }
    }
    //SET LEVEL Button
    else if (setLevelButton.click(new Coord(mouseX, mouseY))) {
      //Process numberData String into corresponding int and store it
      if (numberData != "") pokemonLevel = int(numberData);
      else pokemonLevel = 1;
      //Go back to last page
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
    //Keypad Buttons
    for (int b=0; numberKeypad.getButton(b) != null; b++) {
      currentButton = numberKeypad.getButton(b);
      //If any keypad button is clicked in numberKeypad, add its text value to numberData
      if (currentButton.click(new Coord(mouseX, mouseY))) {
        numberDataCharCount++;
        numberData += currentButton.getText();
        println(currentButton.getText());
        //Update levelNumberLabel to reflect current numberData value
        levelNumberLabel.setText("LEVEL: " + numberData);
        //Don't process any more mouse actions this frame
        return;
      }
    }
  }
  
  //Naming Page Buttons
  if (currentPage == namingPage) {
    //DEL Button
    if (delButton.click(new Coord(mouseX, mouseY))) {
      //If there is at least one character in nameData
      if (nameDataCharCount > 0) {
        //Remove last character by using String.substring()
        nameDataCharCount--;
        nameData = nameData.substring(0, nameDataCharCount);
        //Update namingPageNameLabel to reflect current nameData value
        namingPageNameLabel.setText("NAME: " + nameData);
        //Don't process any more mouse actions this frame
        return;
      }
    }
    //SET NAME Button
    else if (setNameButton.click(new Coord(mouseX, mouseY))) {
      if (pageHistory.getTail() == playerCreationPage)
        playerName = nameData;
      else if (pageHistory.getTail() == pokemonCreationPage)
        pokemonName = nameData;
      //Reset nameData
      resetNameData();
      //Go back to previous page
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
    //Keypad Buttons
    for (int b=0; namingKeypad.getButton(b) != null; b++) {
      currentButton = namingKeypad.getButton(b);
      //If any keypad button is clicked in namingKeypad, add its text value to nameData
      if (currentButton.click(new Coord(mouseX, mouseY))) {
        nameDataCharCount++;
        nameData += currentButton.getText();
        //Update namingPageNameLabel to reflect current nameData value
        namingPageNameLabel.setText("NAME: " + nameData);
        //Don't process any more mouse actions this frame
        return;
      }
    }
  }
}

//Runs once every cycle (aka frame) of the program's execution
//Used to draw shapes and text to the screen
public void draw() {
  //Fill the whole screen with the color black, drawing over anything that happened in the previous frame
  //Essentially a fresh slate for the next frame's drawing actions
  background(127);
  //Show the contents of the current Page
  currentPage.show();
  //Hover over Keypad buttons
  for (int k=0; currentPage.getKeypad(k) != null; k++) {
    for (int b=0; currentPage.getKeypad(k).getButton(b) != null; b++)
      currentPage.getKeypad(k).getButton(b).hover(new Coord(mouseX, mouseY));
  }
  //Hover over Page buttons
  for (int b=0; currentPage.getButton(b) != null; b++)
    currentPage.getButton(b).hover(new Coord(mouseX, mouseY));
}

private void resetNameData() {
  //Reset nameData
  nameData = "";
  nameDataCharCount = 0;
  //Update namingPageNameLabel
  namingPageNameLabel.setText("NAME: " + nameData);
}

private void resetNumberData() {
  //Reset numberData
  numberData = "";
  numberDataCharCount = 0;
  //Update levelNumberLabel
  levelNumberLabel.setText("LEVEL: " + numberData);
}

private void resetPokemonData() {
  pokemonName   = "";
  pokemonBreed  = PokeData.Breed.NONE;
  pokemonType   = PokeData.Type.NORMAL;
  pokemonGender = PokeData.Gender.FEMALE;
  pokemonLevel  = 1;
}
