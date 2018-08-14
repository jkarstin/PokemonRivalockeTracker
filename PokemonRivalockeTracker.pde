/* PokemonRivalockeTracker.pde
 * 
 * Main file of the program. This is where the magic happens.
 * Contains the two most important functions in the whole application: setup() and draw()
 * Naming restriction forces this file to be named the same as the folder it is saved within,
 * otherwise it will not run correctly during development and compilation.
 * 
 * See code for more detailed commenting on execution process.
 * 
 * J Karstin Neill    08.13.18
 */

//Declare Players
Collection<Player> players;

//Declare Tiles
Menu mainMenu;
Menu playerMenu;
Menu playerCreationMenu;
Label spotlightWelcomeLabel;
Label namingPageNameLabel;
Label teamCreationWelcomeLabel;
Label teamsWelcomeLabel;

//Declare Pages
Page spotlightPage;
Page playersPage;
Page playerCreationPage;
Page namingPage;
Page teamCreationPage;
Page teamsPage;
Page lastPage;
Page currentPage;

//Declare system variables
String nameData;
int nameDataCharCount;

//Runs once at the beginning of the application
//Similar to the "int main()" function in C++ programs
public void setup() {
  //Set boundaries of the window size (width and height in number of pixels)
  //This is the size of the draw-able area inside the application window, not including the header bar at the top of the window
  //Dimensions of the window size are stored in system variables named "width" and "height," which can be accessed at any time
  size(600, 400);
  
  //Initialize Page variables
  spotlightPage      = new Page("SPOTLIGHT");
  playersPage        = new Page("PLAYERS");
  playerCreationPage = new Page("PLAYER CREATION");
  namingPage         = new Page("NAMING");
  teamCreationPage   = new Page("TEAM CREATION");
  teamsPage          = new Page("TEAMS");
  
  //Intialize Tile variables
  mainMenu           = new Menu(width-100, 10, 100, 310);
  playerMenu         = new Menu(80, 80, width-260, height-160);
  playerCreationMenu = new Menu(80, 80, width-260, height-160);
  spotlightWelcomeLabel    = new Label(new Coord(20, 20), new Coord(350, 30), "Welcome to the SPOTLIGHT Page!");
  namingPageNameLabel      = new Label(new Coord(20, 20), new Coord(350, 30), "NAME: ");
  teamCreationWelcomeLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future TEAM CREATION Page, coming soon!");
  teamsWelcomeLabel        = new Label(new Coord(20, 20), new Coord(350, 30), "Future TEAMS Page, coming soon!");
  
  //Populate pages
  spotlightPage.addTile(spotlightWelcomeLabel);
  spotlightPage.addMenu(mainMenu);
  playersPage.addMenu(playerMenu);
  playersPage.addMenu(mainMenu);
  playerCreationPage.addMenu(playerCreationMenu);
  playerCreationPage.addMenu(mainMenu);
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
  teamCreationPage.addTile(teamCreationWelcomeLabel);
  teamCreationPage.addMenu(mainMenu);
  teamsPage.addTile(teamsWelcomeLabel);
  teamsPage.addMenu(mainMenu);
  
  //Set starting value of currentPage
  lastPage = spotlightPage;
  currentPage = spotlightPage;
  
  //Initialize Players
  players = new Collection<Player>();
  
  //Populate menus
  mainMenu.addPage(spotlightPage);
  mainMenu.addPage(playersPage);
  mainMenu.addPage(teamsPage);
  playerMenu.addPage(playerCreationPage);
  playerCreationMenu.addPage(namingPage);
  playerCreationMenu.addPage(teamCreationPage);
  
  //Initialize system variables
  nameData = "";
  nameDataCharCount = 0;
}

//Called once each time a mouse button is pressed down and then released
//Isn't called until the mouse button has been released
public void mouseClicked() {
  //Click currentPage Menu buttons
  Menu currentMenu;
  Button currentButton;
  for (int m=0; currentPage.getMenu(m) != null; m++) {
    currentMenu = currentPage.getMenu(m);
    for (int b=0; currentMenu.getButton(b) != null; b++) {
      currentButton = currentMenu.getButton(b);
      if (currentButton.click(mouseX, mouseY)) {
        if (currentPage == namingPage) {
          //Reset nameData
          nameData = "";
          nameDataCharCount = 0;
          namingPageNameLabel.setText("NAME: " + nameData);
        }
        lastPage = currentPage;
        currentPage = currentMenu.getPage(b);
        //Don't process any more mouse actions this frame
        return;
      }
    }
  }
  currentMenu = null;
  currentButton = null;
  
  //Click namingPage buttons
  if (currentPage == namingPage) {
    for (int b=0; currentPage.getButton(b) != null; b++) {
      currentButton = currentPage.getButton(b);
      if (currentButton.click(mouseX, mouseY)) {
        if (currentButton.getText() == "DEL") {
          if (nameDataCharCount > 0) {
            nameDataCharCount--;
            nameData = nameData.substring(0, nameDataCharCount);
          }
        }
        else if (currentButton.getText() == "SPACE") {
          nameDataCharCount++;
          nameData += " ";
        }
        else if (currentButton.getText() == "DONE") {
          //Go back to last page
          currentPage = lastPage;
          //Create a new player using nameData
          Player p = new Player(nameData);
          p.addMenu(mainMenu);
          //Add player to players collection
          players.addElement(p);
          //Add player to playersPage
          Page creationPage = playerMenu.removePage(playerMenu.pageCount()-1);
          playerMenu.addPage(p);
          playerMenu.addPage(creationPage);
          //Reset nameData
          nameData = "";
          nameDataCharCount = 0;
          //Don't process any more mouse actions this frame
          return;
        }
        else {
          nameDataCharCount++;
          nameData += currentButton.getText();
        }
      }
    }
    namingPageNameLabel.setText("NAME: " + nameData);
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
  //Hover over Menu buttons
  for (int m=0; currentPage.getMenu(m) != null; m++) {
    for (int b=0; currentPage.getMenu(m).getButton(b) != null; b++) {
      currentPage.getMenu(m).getButton(b).hover(mouseX, mouseY);
    }
  }
  for (int b=0; currentPage.getButton(b) != null; b++) currentPage.getButton(b).hover(mouseX, mouseY);
}
