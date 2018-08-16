/* PokemonRivalockeTracker.pde
 * 
 * Main file of the program. This is where the magic happens.
 * Contains the two most important functions in the whole application: setup() and draw()
 * Naming restriction forces this file to be named the same as the folder it is saved within,
 * otherwise it will not run correctly during development and compilation.
 * 
 * See code for more detailed commenting on execution process.
 * 
 * TODO: May need to add a nameQueue to keep track of all of the name strings used in order to make the objects.
 * Need better management of lastPage variable. Not keeping track well enough. Perhaps have a collection of pages passed in order.
 * 
 * J Karstin Neill    08.13.18
 */

//Declare Players
Collection<Player> players; //Currently unused; here as a placeholder if needed in the future

//Declare Tiles
Menu mainMenu;
Menu playerMenu;
Menu playerCreationMenu;
Menu teamCreationMenu;
Menu pokemonCreationMenu;
Label spotlightWelcomeLabel;
Label namingPageNameLabel;
Label teamsWelcomeLabel;
Label levelNumberLabel;
Button createPlayerButton;
Button createTeamButton;
Button createPokemonButton;
Button chooseTypeButton;
Button setLevelButton;
Button normalTypeButton;
Button fightTypeButton;
Button flyingTypeButton;
Button poisonTypeButton;
Button groundTypeButton;
Button rockTypeButton;
Button bugTypeButton;
Button ghostTypeButton;
Button steelTypeButton;
Button fireTypeButton;
Button waterTypeButton;
Button grassTypeButton;
Button electrTypeButton;
Button psychcTypeButton;
Button iceTypeButton;
Button dragonTypeButton;
Button darkTypeButton;
Button fairyTypeButton;

//Declare Pages
Page spotlightPage;
Page playersPage;
Page playerCreationPage;
Page teamCreationPage;
Page pokemonCreationPage;
Page typeSelectionPage;
Page genderSelectionPage;
Page levelNumberPage;
Page teamsPage;
Page namingPage;
Page currentPage;

//Declare system variables
String nameData;
int nameDataCharCount;
String          playerName;
String          pokemonName;
PokeData.Breed  pokemonBreed;
PokeData.Type   pokemonType;
PokeData.Gender pokemonGender;
int             pokemonLevel;
Collection<Page> pageHistory;

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
  playerCreationPage  = new Page("+ ADD A PLAYER");
  teamCreationPage    = new Page("BUILD A TEAM");
  pokemonCreationPage = new Page("+ ADD A POKEMON");
  typeSelectionPage   = new Page("CHOOSE A TYPE");
  levelNumberPage     = new Page("SET THEIR LEVEL");
  teamsPage           = new Page("TEAMS");
  namingPage          = new Page("CREATE A NAME");
  
  //Intialize Tile variables
  mainMenu            = new Menu(new Coord(width-100, 10), new Coord(100, 310));
  playerMenu          = new Menu(new Coord(80, 80), new Coord(width-260, height-160));
  playerCreationMenu  = new Menu(new Coord(80, 80), new Coord(width-260, height-160));
  teamCreationMenu    = new Menu(new Coord(80, 80), new Coord(width-260, height-160));
  pokemonCreationMenu = new Menu(new Coord(80, 80), new Coord(width-260, height-160));
  spotlightWelcomeLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Welcome to the SPOTLIGHT Page!");
  namingPageNameLabel   = new Label(new Coord(20, 20), new Coord(350, 30), "NAME: ");
  teamsWelcomeLabel     = new Label(new Coord(20, 20), new Coord(350, 30), "Future TEAMS Page, coming soon!");
  levelNumberLabel      = new Label(new Coord(20, 20), new Coord(350, 30), "LEVEL: ");
  createPlayerButton  = new Button(new Coord(90, height-130), new Coord(width-280, 40), "CREATE PLAYER");
  createTeamButton    = new Button(new Coord(90, height-130), new Coord(width-280, 40), "CREATE TEAM");
  createPokemonButton = new Button(new Coord(90, height-130), new Coord(width-280, 40), "CREATE POKEMON");
  setLevelButton      = new Button(new Coord(90, height-130), new Coord(width-280, 40), "SET LEVEL");
  chooseTypeButton    = new Button(new Coord(90, height-130), new Coord(width-280, 40), "CHOOSE TYPE");
  normalTypeButton = new Button(new Coord( 40,  40), new Coord(70, 30), "NORMAL");
  fightTypeButton  = new Button(new Coord(120,  40), new Coord(70, 30), "FIGHT" );
  flyingTypeButton = new Button(new Coord(200,  40), new Coord(70, 30), "FLYING");
  poisonTypeButton = new Button(new Coord(280,  40), new Coord(70, 30), "POISON");
  groundTypeButton = new Button(new Coord( 40,  80), new Coord(70, 30), "GROUND");
  rockTypeButton   = new Button(new Coord(120,  80), new Coord(70, 30), "ROCK"  );
  bugTypeButton    = new Button(new Coord(200,  80), new Coord(70, 30), "BUG"   );
  ghostTypeButton  = new Button(new Coord(280,  80), new Coord(70, 30), "GHOST" );
  steelTypeButton  = new Button(new Coord( 40, 120), new Coord(70, 30), "STEEL" );
  fireTypeButton   = new Button(new Coord(120, 120), new Coord(70, 30), "FIRE"  );
  waterTypeButton  = new Button(new Coord(200, 120), new Coord(70, 30), "WATER" );
  grassTypeButton  = new Button(new Coord(280, 120), new Coord(70, 30), "GRASS" );
  electrTypeButton = new Button(new Coord( 40, 160), new Coord(70, 30), "ELECTR");
  psychcTypeButton = new Button(new Coord(120, 160), new Coord(70, 30), "PSYCHC");
  iceTypeButton    = new Button(new Coord(200, 160), new Coord(70, 30), "ICE"   );
  dragonTypeButton = new Button(new Coord(280, 160), new Coord(70, 30), "DRAGON");
  darkTypeButton   = new Button(new Coord(120, 200), new Coord(70, 30), "DARK"  );
  fairyTypeButton  = new Button(new Coord(200, 200), new Coord(70, 30), "FAIRY" );
  
  //Populate pages
  spotlightPage.addTile(spotlightWelcomeLabel);
  spotlightPage.addMenu(mainMenu);
  playersPage.addMenu(playerMenu);
  playersPage.addMenu(mainMenu);
  playerCreationPage.addMenu(playerCreationMenu);
  playerCreationPage.addButton(createPlayerButton);
  playerCreationPage.addMenu(mainMenu);
  teamCreationPage.addMenu(teamCreationMenu);
  teamCreationPage.addButton(createTeamButton);
  teamCreationPage.addMenu(mainMenu);
  pokemonCreationPage.addMenu(pokemonCreationMenu);
  pokemonCreationPage.addButton(createPokemonButton);
  pokemonCreationPage.addMenu(mainMenu);
  typeSelectionPage.addButton(normalTypeButton);
  typeSelectionPage.addButton( fightTypeButton);
  typeSelectionPage.addButton(flyingTypeButton);
  typeSelectionPage.addButton(poisonTypeButton);
  typeSelectionPage.addButton(groundTypeButton);
  typeSelectionPage.addButton(  rockTypeButton);
  typeSelectionPage.addButton(   bugTypeButton);
  typeSelectionPage.addButton( ghostTypeButton);
  typeSelectionPage.addButton( steelTypeButton);
  typeSelectionPage.addButton(  fireTypeButton);
  typeSelectionPage.addButton( waterTypeButton);
  typeSelectionPage.addButton( grassTypeButton);
  typeSelectionPage.addButton(electrTypeButton);
  typeSelectionPage.addButton(psychcTypeButton);
  typeSelectionPage.addButton(   iceTypeButton);
  typeSelectionPage.addButton(dragonTypeButton);
  typeSelectionPage.addButton(  darkTypeButton);
  typeSelectionPage.addButton( fairyTypeButton);
  typeSelectionPage.addButton(chooseTypeButton);
  levelNumberPage.addTile(levelNumberLabel);
  levelNumberPage.addButton(new Button(new Coord( 80, 180), new Coord(30, 30), "0"));
  levelNumberPage.addButton(new Button(new Coord( 40, 140), new Coord(30, 30), "1"));
  levelNumberPage.addButton(new Button(new Coord( 80, 140), new Coord(30, 30), "2"));
  levelNumberPage.addButton(new Button(new Coord(120, 140), new Coord(30, 30), "3"));
  levelNumberPage.addButton(new Button(new Coord( 40, 100), new Coord(30, 30), "4"));
  levelNumberPage.addButton(new Button(new Coord( 80, 100), new Coord(30, 30), "5"));
  levelNumberPage.addButton(new Button(new Coord(120, 100), new Coord(30, 30), "6"));
  levelNumberPage.addButton(new Button(new Coord( 40,  60), new Coord(30, 30), "7"));
  levelNumberPage.addButton(new Button(new Coord( 80,  60), new Coord(30, 30), "8"));
  levelNumberPage.addButton(new Button(new Coord(120,  60), new Coord(30, 30), "9"));
  levelNumberPage.addButton(setLevelButton);
  levelNumberPage.addMenu(mainMenu);
  typeSelectionPage.addMenu(mainMenu);
  teamsPage.addTile(teamsWelcomeLabel);
  teamsPage.addMenu(mainMenu);
  namingPage.addTile(namingPageNameLabel);
  namingPage.addButton(new Button(new Coord( 20,  60), new Coord(30, 30), "A"));
  namingPage.addButton(new Button(new Coord( 60,  60), new Coord(30, 30), "B"));
  namingPage.addButton(new Button(new Coord(100,  60), new Coord(30, 30), "C"));
  namingPage.addButton(new Button(new Coord(140,  60), new Coord(30, 30), "D"));
  namingPage.addButton(new Button(new Coord( 20, 100), new Coord(30, 30), "E"));
  namingPage.addButton(new Button(new Coord( 60, 100), new Coord(30, 30), "F"));
  namingPage.addButton(new Button(new Coord(100, 100), new Coord(30, 30), "G"));
  namingPage.addButton(new Button(new Coord(140, 100), new Coord(30, 30), "H"));
  namingPage.addButton(new Button(new Coord( 20, 140), new Coord(30, 30), "I"));
  namingPage.addButton(new Button(new Coord( 60, 140), new Coord(30, 30), "J"));
  namingPage.addButton(new Button(new Coord(100, 140), new Coord(30, 30), "K"));
  namingPage.addButton(new Button(new Coord(140, 140), new Coord(30, 30), "L"));
  namingPage.addButton(new Button(new Coord( 20, 180), new Coord(30, 30), "M"));
  namingPage.addButton(new Button(new Coord( 60, 180), new Coord(30, 30), "N"));
  namingPage.addButton(new Button(new Coord(100, 180), new Coord(30, 30), "O"));
  namingPage.addButton(new Button(new Coord(140, 180), new Coord(30, 30), "P"));
  namingPage.addButton(new Button(new Coord( 20, 220), new Coord(30, 30), "Q"));
  namingPage.addButton(new Button(new Coord( 60, 220), new Coord(30, 30), "R"));
  namingPage.addButton(new Button(new Coord(100, 220), new Coord(30, 30), "S"));
  namingPage.addButton(new Button(new Coord(140, 220), new Coord(30, 30), "T"));
  namingPage.addButton(new Button(new Coord( 20, 260), new Coord(30, 30), "U"));
  namingPage.addButton(new Button(new Coord( 60, 260), new Coord(30, 30), "V"));
  namingPage.addButton(new Button(new Coord(100, 260), new Coord(30, 30), "W"));
  namingPage.addButton(new Button(new Coord(140, 260), new Coord(30, 30), "X"));
  namingPage.addButton(new Button(new Coord( 20, 300), new Coord(30, 30), "Y"));
  namingPage.addButton(new Button(new Coord( 60, 300), new Coord(30, 30), "Z"));
  namingPage.addButton(new Button(new Coord(100, 300), new Coord(40, 30), "DEL"));
  namingPage.addButton(new Button(new Coord(150, 300), new Coord(50, 30), "DONE"));
  namingPage.addButton(new Button(new Coord( 20, 340), new Coord(60, 30), "SPACE"));
  namingPage.addMenu(mainMenu);
  
  //Set starting value of currentPage
  currentPage = spotlightPage;
  
  //Initialize players collection
  players = new Collection<Player>();
  
  //Populate menus
  mainMenu.addPage(spotlightPage);
  mainMenu.addPage(playersPage);
  mainMenu.addPage(teamsPage); //Not yet useful
  playerMenu.addPage(playerCreationPage);
  playerCreationMenu.addPage(namingPage);
  playerCreationMenu.addPage(teamCreationPage);
  teamCreationMenu.addPage(pokemonCreationPage);
  pokemonCreationMenu.addPage(namingPage);
  pokemonCreationMenu.addPage(typeSelectionPage);
  pokemonCreationMenu.addPage(levelNumberPage);
  
  //Initialize system variables
  nameData = "";
  nameDataCharCount = 0;
  playerName    = "";
  pokemonName   = "";
  pokemonBreed  = PokeData.Breed.NONE;
  pokemonType   = PokeData.Type.NORMAL;
  pokemonGender = PokeData.Gender.FEMALE;
  pokemonLevel  = 0;
  pageHistory = new Collection<Page>();
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
  
  //Naming Page Buttons
  if (currentPage == namingPage) {
    for (int b=0; currentPage.getButton(b) != null; b++) {
      currentButton = currentPage.getButton(b);
      if (currentButton.click(new Coord(mouseX, mouseY))) {
        //If DEL button clicked
        if (currentButton.getText() == "DEL") {
          //If there is at least one character in nameData
          if (nameDataCharCount > 0) {
            //Remove last character by using String.substring()
            nameDataCharCount--;
            nameData = nameData.substring(0, nameDataCharCount);
          }
        }
        //If SPACE button clicked
        else if (currentButton.getText() == "SPACE") {
          //Manually add space character
          nameDataCharCount++;
          nameData += " ";
        }
        //If DONE button clicked
        else if (currentButton.getText() == "DONE") {
          
          //If we entered namingPage from playerCreationPage, nameData will be the new Player's name
          if (pageHistory.getTail() == playerCreationPage) {
            playerName = nameData;
          }
          //If we entered namingPage from pokemonCreationPage, nameData will be the new Pokemon's name
          if (pageHistory.getTail() == pokemonCreationPage) {
            pokemonName = nameData;
          }
          
          //Go back to last page
          currentPage = pageHistory.removeTail();
          //Don't process any more mouse actions this frame
          return;
        }
        //If any other non-menu button clicked, add its text to nameData
        else {
          nameDataCharCount++;
          nameData += currentButton.getText();
        }
      }
    }
    //Update namingPageNameLabel to reflect current nameData value
    namingPageNameLabel.setText("NAME: " + nameData);
  }
  
  //Level Number Page Buttons
  if (currentPage == levelNumberPage) {
    //For now, when SET LEVEL button is clicked, go back to last page
    if (setLevelButton.click(new Coord(mouseX, mouseY))) {
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Pokemon Type Selection Page Buttons
  if (currentPage == typeSelectionPage) {
    //For now, when CHOOSE TYPE button is clicked, go back to last page
    if (chooseTypeButton.click(new Coord(mouseX, mouseY))) {
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Player Creation Page Buttons
  if (currentPage == playerCreationPage) {
    //If CREATE PLAYER button is clicked, make new Player using nameData
    if (createPlayerButton.click(new Coord(mouseX, mouseY))) {
      currentPage = pageHistory.removeTail();
      //Create a new player using nameData
      Player p = new Player(playerName);
      p.addMenu(mainMenu);
      //Add player to players collection
      players.addElement(p);
      //Add player to playersPage
      //Remove and temporarily save last page in playerMenu (always playerCreationPage)
      Page creationPage = playerMenu.removePage(playerMenu.pageCount()-1);
      //Add new player as page to playerMenu
      playerMenu.addPage(p);
      //Put last page back on the end of the playerMenu page collection
      playerMenu.addPage(creationPage);
      //Reset nameData
      nameData = "";
      nameDataCharCount = 0;
      //Update namingPageNameLabel
      namingPageNameLabel.setText("NAME: " + nameData);
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Team Creation Page Buttons
  if (currentPage == teamCreationPage) {
    //For now, when CREATE TEAM button is clicked, go back to last page
    if (createTeamButton.click(new Coord(mouseX, mouseY))) {
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
    }
  }
  
  //Pokemon Creation Page Buttons
  if (currentPage == pokemonCreationPage) {
    //For now, when CREATE POKEMON button is clicked, go back to last page
    if (createPokemonButton.click(new Coord(mouseX, mouseY))) {
      currentPage = pageHistory.removeTail();
      //Don't process any more mouse actions this frame
      return;
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
  //Hover over Menu and Page buttons
  for (int m=0; currentPage.getMenu(m) != null; m++) {
    for (int b=0; currentPage.getMenu(m).getButton(b) != null; b++) {
      currentPage.getMenu(m).getButton(b).hover(new Coord(mouseX, mouseY));
    }
  }
  for (int b=0; currentPage.getButton(b) != null; b++) currentPage.getButton(b).hover(new Coord(mouseX, mouseY));
}
