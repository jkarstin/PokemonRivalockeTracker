/* Team.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Team {
  private final static int MAXPOKEMON = 6;
  
  private Pokemon[] mPokemon;
  private int mPokemonCount;
  
  public Team() {
    mPokemon = new Pokemon[MAXPOKEMON];
    mPokemonCount = 0;
  }
  
  public void addPokemon(Pokemon pokemon) {
    if (mPokemonCount < MAXPOKEMON) {
      mPokemon[mPokemonCount++] = pokemon;
    }
  }
  
  public Pokemon getPokemon(int index) {
    if (index < mPokemonCount) return mPokemon[index];
    return null;
  }
};
