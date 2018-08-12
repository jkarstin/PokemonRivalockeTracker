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


//Declare Players, Gyms, Battles
Player ben;
Player will;
Player jay;
Gym pewter;
Battle battle1;
Battle battle2;
Battle battle3;

//Declare TextBoxes
TextBox tb;
TextBox tb2;

//Declare Pages
Page mainPage;
Page secondPage;
Page currentPage;

//Runs once at the beginning of the application
//Similar to the "int main()" function in C++ programs
public void setup() {
  //Set boundaries of the window size (width and height in number of pixels)
  //This is the size of the draw-able area inside the application window, not including the header bar at the top of the window
  //Dimensions of the window size are stored in system variables named "width" and "height," which can be accessed at any time
  size(600, 400);
  
  //Initialize Player variables
  ben  = new Player("Ben");
  will = new Player("Will");
  jay  = new Player("Jay");
  
  //Initialize Gym variables
  Gym pewter = new Gym("Pewter");
  
  //Populate Player Teams
  ben.team().addPokemon(new Pokemon("Bill", "Charmander", "Fire", "Male", 16));
  
  //Add Players to Gyms
  pewter.addPlayer(ben);
  pewter.addPlayer(jay);
  pewter.addPlayer(will);
  
  //Initialize Battle variables
  battle1 = new Battle(pewter, ben, jay, true);
  battle2 = new Battle(pewter, ben, will, false);
  battle3 = new Battle(pewter, jay, will, true);
  
  //Update Player data after Battles
  ben.team().getPokemon(0).changeName("Carlos");
  ben.team().getPokemon(0).changeLevel(25);
  
  //Intialize TextBox variables
  tb = new TextBox(new Coord(40, 40), new Coord(160, 100), battle1.summary());
  tb.setTextColor(color(255));
  tb.setFillColor(color(255, 0, 255));
  tb.setBorderColor(color(127));
  tb2 = new TextBox(new Coord(300, 40), new Coord(160, 100), battle3.summary());
  
  //Initialize Page variables
  mainPage = new Page();
  mainPage.addTile(tb);
  secondPage = new Page();
  secondPage.addTile(tb);
  secondPage.addTile(tb2);
  
  //Set starting value of currentPage
  currentPage = mainPage;
}

//Runs once every time any key on the keyboard is pressed down
//Value of keyboard key which was pressed is stored as a char in a variable named "key"
public void keyPressed() {
  //If the [d] key was pressed, set the current Page to secondPage
  if (key == 'd') {
    currentPage = secondPage;
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
}
