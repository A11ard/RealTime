static class AI{
  /************************
  Determine if a unit or a miner should be built
  
  Evaluate difference in player's and computer's army strength, train more units if player has
  higher strength, else train miners.
  
  Args:
  playerTeam (ArrayList<Unit>): player team roster
  computerTeam (ArrayList<Unit>): computer team roster
  
  Returns:
  boolean: true if a unit should be trained, false if a miner should be trained.
  ************************/
  static boolean unitOrMiner(ArrayList<Unit> playerTeam, ArrayList<Unit> computerTeam){
     int playerTeamStrength = unitStrength(playerTeam);
     int computerTeamStrength = unitStrength(computerTeam);
     
     return(playerTeamStrength > computerTeamStrength);
  }
  
  /**********************
  Calculate unit strength
  
  strength:
    swordsmen:5
    archers:15
    wizards:40
    commander:100
    
  Args:
  team (ArrayList<Unit>): team roster
  
  Returns:
  int: Unit strength of team.
  **********************/
  static int unitStrength(ArrayList<Unit> team){
    int unitStrength = 0;
    for (Unit unit : team){
      if(unit.identifier() == 0){//swordsman
        unitStrength += 5; 
      }
      else if (unit.identifier() == 1){//archer
        unitStrength += 15;
      }
      else if (unit.identifier() == 2){//wizard
        unitStrength += 40;
      }
      else if (unit.identifier() == 3){//commander
        unitStrength += 100;
      }
    }
    return unitStrength;
  }
  
  
  /***********************
    
   ***********************/
  static boolean saveUp(ArrayList<Unit> playerTeam, ArrayList<Unit> computerTeam){
    int playerUnitStrength = unitStrength(playerTeam);
    int computerUnitStrength = unitStrength(computerTeam);
    
    return (playerUnitStrength + 200 < computerUnitStrength);
  }
}