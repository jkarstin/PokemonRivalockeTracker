/* Battle.pde
 * 
 * Stores information about a Player vs Player battle.
 * Saves information about the battle as a snapshot of the moment the battle took place.
 * Any future updates to Players involved in the battle will not be
 * reflected in the battle's info, unless it is manually changed.
 * 
 * J Karstin Neill    08.11.18
 */

//Class defintion
public class Battle {
  //Private member variables
  private Gym mGym;
  private Player mWinner;
  private Player mLoser;
  private Team mWinningTeam;
  private Team mLosingTeam;
  
  //Constructor method
  public Battle(Gym gym, Player player1, Player player2, boolean player1won) {
    mGym = gym;
    //If player1won is true, player1 argument passed to the constructor is the winner, and player2 is the loser
    if (player1won) {
      mWinner = player1;
      mLoser = player2;
    }
    //Otherwise player1 is the loser, and player2 is the winner
    else {
      mWinner = player2;
      mLoser = player1;
    }
    //Save copies of the winning and losing Teams
    mWinningTeam = mWinner.copyTeam();
    mLosingTeam = mLoser.copyTeam();
  }
  
  //Get Gym where the battle took place
  public Gym gym() {
    return mGym;
  }
  
  //Get Player who won the battle
  public Player winner() {
    return mWinner;
  }
  
  //Get Player who lost the battle
  public Player loser() {
    return mLoser;
  }
  
  //Get copy of the Team of the winning Player at the time the battle took place
  public Team winningTeam() {
    return mWinningTeam;
  }
  
  //Get copy of the Team of the losing Player at the time the battle took place
  public Team losingTeam() {
    return mLosingTeam;
  }
  
  //Get a generated String summarizing the details of the battle
  public String summary() {
    String output = "";
    
    output += "GYM: " + mGym.name() + "\n";
    output += "PLAYERS: " + mWinner.name() + " VS " + mLoser.name() + "\n";
    output += "WINNER: " + mWinner.name() + " !!!\n";
    
    return output;
  }
};
