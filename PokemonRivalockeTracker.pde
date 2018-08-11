/* PokemonRivalockeTracker.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

Player ben;
Player will;
Player jay;

Gym pewter;

Battle battle1;
Battle battle2;
Battle battle3;

TextBox tb;
TextBox tb2;

Page mainPage;
Page secondPage;
Page currentPage;

public void setup() {
  size(600, 400);
  
  ben  = new Player("Ben");
  will = new Player("Will");
  jay  = new Player("Jay");
  
  Gym pewter = new Gym("Pewter");
  
  ben.team().addPokemon(new Pokemon("Bill", "Charmander", "Fire", "Male", 16));
  
  pewter.addPlayer(ben);
  pewter.addPlayer(jay);
  pewter.addPlayer(will);
  
  battle1 = new Battle(pewter, ben, jay, true);
  battle2 = new Battle(pewter, ben, will, false);
  battle3 = new Battle(pewter, jay, will, true);
  
  ben.team().getPokemon(0).changeName("Carlos");
  ben.team().getPokemon(0).changeLevel(25);
  
  tb = new TextBox(new Coord(40, 40), new Coord(160, 100), battle1.summary());
  tb.setTextColor(color(255));
  tb.setFillColor(color(0));
  tb.setBorderColor(color(255));
  
  tb2 = new TextBox(new Coord(300, 40), new Coord(160, 100), battle3.summary());
  
  mainPage = new Page();
  mainPage.addTextBox(tb);
  
  secondPage = new Page();
  secondPage.addTextBox(tb);
  secondPage.addTextBox(tb2);
  
  currentPage = mainPage;
}

public void keyPressed() {
  if (key == 'd') {
    currentPage = secondPage;
  }
}

public void draw() {
  background(0);
  currentPage.show();
}
