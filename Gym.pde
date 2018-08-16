/* Gym.pde
 * 
 * 
 * J Karstin Neill    08.16.18
 */
 
public class Gym extends Page {
  private final static int MAXPLAYERS = 8;
  
  private Collection<Player> mPlayers;
  
  public Gym(String name) {
    super(name);
    mPlayers = new Collection<Player>(MAXPLAYERS);
    Label profileLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future " + name + "'s GYM PROFILE Page, coming soon!");
    this.addTile(profileLabel);
  }
  
  public void addPlayer(Player player) {
    mPlayers.addElement(player);
  }
  
  public Player first() {
    return mPlayers.getElement(0);
  }
};
