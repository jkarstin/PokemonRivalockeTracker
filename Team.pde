/* Team.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Team extends Page {
  private final static int MAXPOKEMON = 6;
  
  private Collection<Pokemon> mPokemon;
  
  public Team(String name) {
    super(name);
    mPokemon = new Collection<Pokemon>(MAXPOKEMON);
  }
  
  public void addPokemon(Pokemon pokemon) {
    mPokemon.addElement(pokemon);
  }
  
  public Pokemon getPokemon(int index) {
    return mPokemon.getElement(index);
  }
  
  public String summary() {
    String output = "";
    
    output += "TEAM NAME: " + mName + "\n";
    for (int p=0; mPokemon.getElement(p) != null; p++)
      output += mPokemon.getElement(p).summary();
    
    return output;
  }
};
