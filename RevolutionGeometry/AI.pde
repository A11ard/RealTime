static class AI{
  
  static int[] choose(ArrayList<Unit> playerTeam, ArrayList<Unit> computerTeam, int currency){
    //calculate all relevant statistics
    int playerTeamStrength = unitStrength(playerTeam);
    int computerTeamStrength = unitStrength(computerTeam);
    int economyDifference = minerDifference(playerTeam,computerTeam);
    int armyDifference = armyDifference(playerTeamStrength, computerTeamStrength);
    
    if((armyDifference - economyDifference * 20 < 0) && armyDifference < 0){//more $, less troops
      int[] output = {0, chooseUnitToTrain(currency)};
      return output;
    }
    else if(economyDifference < 0 && (armyDifference - economyDifference * 20 < 0)){ //train miner
      int[] output = {0,4};
      return output;
    }
    else{ //do nothing and save up
      int[] output = {1};
      return output;
    }

  }
  
  static int chooseUnitToTrain(int currency){
    if(currency > 100){
      return 5; //giant.identifier() result
    }
    else if(currency > 50){
      return 2;//wizard.identifier() result
    }
    else if(currency > 15){
      return 1;//archer.identifier()
    }
    else if(currency > 10){
      return 0;//swordsmen.identifier()
    }
    else {
      return -1;//no money
    }
  }
  
  /************************
  Returns the difference in the strength of armies
  
  Args:
  playerTeam (ArrayList<Unit>): player team roster
  computerTeam (ArrayList<Unit>): computer team roster
  
  Returns:
  int: positive if computerTeam has the stronger army, negative if playerTeam has the stronger army.
  **************************/
  static int armyDifference(int playerTeamStrength, int computerTeamStrength){
     return computerTeamStrength - playerTeamStrength;
  }
  
  /**********************
  Calculate unit strength of a team
  
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
  
  
  /******************
   Return the difference in value of computer's miner and the player's miner 
   ******************/
  static int minerDifference(ArrayList<Unit> playerTeam, ArrayList<Unit> computerTeam){
    int numPlayerMiner = 0;
    for (Unit unit: playerTeam){
      if(unit.identifier() == 4){
        numPlayerMiner ++; 
      }
    }
    int numComputerMiner = 0;
    for (Unit unit: computerTeam){
      if (unit.identifier() == 4){
        numComputerMiner ++; 
      }
    }
    return (numComputerMiner - numPlayerMiner);
  }
}