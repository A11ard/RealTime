class ArrayPriorityQueue {
  
  int start;
  ArrayList<Unit> _priorityQ;

  ArrayPriorityQueue() {
    _priorityQ = new ArrayList<Unit>();
  }

  void add(Unit x) {
    _priorityQ.add(x);
  }

  boolean isEmpty() {
    return _priorityQ.size() == 0;
  }

  //PEEKMIN FOR TRAINING TIME
  int peekMin() {
    if (!isEmpty()) {
      int min = (int)_priorityQ.get(0).getTrainingTime();

      for (int i = 1; i < _priorityQ.size(); i++) {
        if ((int)_priorityQ.get(i).getTrainingTime() < min ) {
          min = (int)_priorityQ.get(i).getTrainingTime();
        }
      }
      return min;
    }
    return -1;
  }

 /* int peekMinH() {
    if (!isEmpty()) {
      int min = (int)_priorityQ.get(0).getTrainingTime();

      for (int i = 1; i < _priorityQ.size(); i++) {
        if ((int)_priorityQ.get(i).getTrainingTime() < min ) {
          min = (int)_priorityQ.get(i).getTrainingTime();
        }
      }
      return min;
    }
    return -1;
  }*/

 //Change training time for all units in queue by -1 every 1 second
  void changeTime(){
      for (int i = 0; i < _priorityQ.size(); i++) {
         if(millis() - start > 1000){
         _priorityQ.get(i).changeTrainingTime();
         start = millis();
       }
    }
  }
  //REMOVEMIN FOR TRAINING TIME: used in queueing troops up to be trained: the troops that train the fastest gets priority 
  Unit removeMin() {
    for (int i = 0; i < _priorityQ.size(); i++) { 
      //Only remove if trainingTime equals zero and is the minimum
      if ((int)_priorityQ.get(i).getTrainingTime() == peekMin() && (int)_priorityQ.get(i).getTrainingTime() == 0) {
          Unit removedUnit = _priorityQ.get(i);
          _priorityQ.remove(i);
          return removedUnit;
        }
      }
    return null;
  }

//REMOVEMIN FOR TRAINING HEALTH: used by wizard to select attack range: enemies of lowest life gets priority
  /*Unit removeMinH() {
    for (int i = 0; i < _priorityQ.size(); i++) {
      if ((int)_priorityQ.get(i).getLife() == peekMinH()) {
        Unit removedUnit = _priorityQ.get(i);
        _priorityQ.remove(i);
        return removedUnit;
      }
    }
    return null;
  }*/
  
  Unit removeMinH(Unit firstTarget){//find the unit w the lowest life and is within strike range
   //firstTarget is the initial "target" in wizard's attack method
     
     if(_priorityQ.size() == 0){
       return null; 
     }
     else{
       Unit target = null;  
       float minLife = 99999;//represents the lowest life 
       int index = 0; 
       //System.out.println(_priorityQ);
       for(Unit a: _priorityQ){        
          if( firstTarget.position.dist(a.position) < 100 && a.life < minLife){ //if within lightning strike range and has a lower life than current lowest life
            minLife = a.life; 
            target = a; 
            index = _priorityQ.indexOf(a); 
          }
       }
       System.out.println(index);
       return _priorityQ.remove(index); 
     }
   }
    
 
  
  
  public String toString(){
    return _priorityQ.toString();
  }
  
}