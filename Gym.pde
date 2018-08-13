/* Gym.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */
 
public class Gym extends Page {
  private final static int MAXPLAYERS = 8;
  
  private Collection<Player> mPlayers;
  
  public Gym(String name) {
    super(name);
    mPlayers = new Collection<Player>(MAXPLAYERS);
  }
  
  public void addPlayer(Player player) {
    mPlayers.addElement(player);
  }
  
  public Player first() {
    return mPlayers.getElement(0);
  }
};
