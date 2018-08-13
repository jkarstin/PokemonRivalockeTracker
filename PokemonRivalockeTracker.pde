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
Player ben;

//Declare Tiles
Menu mainMenu;
Menu playerMenu;
Label spotlightWelcomeLabel;
Label playerCreationWelcomeLabel;
Label teamsWelcomeLabel;

//Declare Pages
Page spotlightPage;
Page playersPage;
Page playerCreationPage;
Page teamsPage;
Page currentPage;

//Runs once at the beginning of the application
//Similar to the "int main()" function in C++ programs
public void setup() {
  //Set boundaries of the window size (width and height in number of pixels)
  //This is the size of the draw-able area inside the application window, not including the header bar at the top of the window
  //Dimensions of the window size are stored in system variables named "width" and "height," which can be accessed at any time
  size(600, 400);
  
  //Initialize Page variables
  spotlightPage = new Page("SPOTLIGHT");
  playersPage   = new Page("PLAYERS");
  playerCreationPage = new Page("PLAYER CREATION");
  teamsPage     = new Page("TEAMS");
  
  //Intialize Tile variables
  mainMenu = new Menu(width-100, 10, 100, 310);
  playerMenu = new Menu(80, 80, width-260, height-160);
  spotlightWelcomeLabel      = new Label(new Coord(20, 20), new Coord(350, 30), "Welcome to the SPOTLIGHT Page!");
  playerCreationWelcomeLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future PLAYER CREATION Page, coming soon!");
  teamsWelcomeLabel          = new Label(new Coord(20, 20), new Coord(350, 30), "Future TEAMS Page, coming soon!");
  
  //Populate pages
  spotlightPage.addTile(spotlightWelcomeLabel);
  spotlightPage.addMenu(mainMenu);
  playersPage.addMenu(playerMenu);
  playersPage.addMenu(mainMenu);
  playerCreationPage.addTile(playerCreationWelcomeLabel);
  playerCreationPage.addMenu(mainMenu);
  teamsPage.addTile(teamsWelcomeLabel);
  teamsPage.addMenu(mainMenu);
  
  //Set starting value of currentPage
  currentPage = spotlightPage;
  
  //Initialize Players
  ben = new Player("BEN");
  ben.profilePage().addMenu(mainMenu);
  playerMenu.addPage(ben.profilePage());
  
  //Populate menus
  mainMenu.addPage(spotlightPage);
  mainMenu.addPage(playersPage);
  mainMenu.addPage(teamsPage);
  playerMenu.addPage(playerCreationPage);
}

//Called once each time a mouse button is pressed down and then released
//Isn't called until the mouse button has been released
public void mouseClicked() {
  //Click Menu buttons
  Menu currentMenu;
  Button currentButton;
  for (int m=0; currentPage.getMenu(m) != null; m++) {
    currentMenu = currentPage.getMenu(m);
    for (int b=0; currentMenu.getButton(b) != null; b++) {
      currentButton = currentMenu.getButton(b);
      if (currentButton.click(mouseX, mouseY)) currentPage = currentMenu.getPage(b);
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
  //Hover over Menu buttons
  for (int m=0; currentPage.getMenu(m) != null; m++) {
    for (int b=0; currentPage.getMenu(m).getButton(b) != null; b++) {
      currentPage.getMenu(m).getButton(b).hover(mouseX, mouseY);
    }
  }
}
