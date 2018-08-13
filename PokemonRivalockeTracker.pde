/* PokemonRivalockeTracker.pde
 * 
 * Main file of the program. This is where the magic happens.
 * Contains the two most important functions in the whole application: setup() and draw()
 * Naming restriction forces this file to be named the same as the folder it is saved within,
 * otherwise it will not run correctly during development and compilation.
 * 
 * See code for more detailed commenting on execution process.
 * 
 * J Karstin Neill    08.11.18
 */

//Declare Tiles
Menu menu;
Label lb1;
Label lb2;

//Declare Pages
Page spotlightPage;
Page playersPage;
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
  teamsPage     = new Page("TEAMS");
  
  //Intialize Tile variables
  menu = new Menu(width-100, 10, 100, 310);
  menu.addPage(spotlightPage);
  menu.addPage(playersPage);
  menu.addPage(teamsPage);
  lb1 = new Label(new Coord(20, 20), new Coord(200, 200), "Welcome to the SPOTLIGHT Page!");
  lb2 = new Label(new Coord(90, 45), new Coord(200, 200), "Future PLAYERS Page, coming soon!");
  
  spotlightPage.addTile(lb1);
  spotlightPage.addTile(menu);
  playersPage.addTile(lb2);
  playersPage.addTile(menu);
  teamsPage.addTile(menu);
  
  //Set starting value of currentPage
  currentPage = spotlightPage;
}

//Called once each time a mouse button is pressed down and then released
//Isn't called until the mouse button has been released
public void mouseClicked() {
  //Click Menu buttons
  for (int b=0; menu.getButton(b) != null; b++) {
    if (menu.getButton(b).click(mouseX, mouseY)) currentPage = menu.getPage(b);
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
  for (int b=0; menu.getButton(b) != null; b++) menu.getButton(b).hover(mouseX, mouseY);
}
