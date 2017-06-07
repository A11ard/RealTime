class ArrayPriorityQueue {
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
           if(frameCount % 60 == 0){
             _priorityQ.get(i).changeTrainingTime();
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
  
/*
//REMOVEMIN FOR TRAINING HEALTH: used by wizard to select attack range: enemies of lowest life gets priority
  Unit removeMinH() {
    for (int i = 0; i < _priorityQ.size(); i++) {
      if ((int)_priorityQ.get(i).getLife() == peekMinH()) {
        Unit removedUnit = _priorityQ.get(i);
        _priorityQ.remove(i);
        return removedUnit;
      }
    }
    return null;
  }
  */
   
   void copyArr(ArrayList<Unit> a){
     for(int x = 0; x < a.size(); x++){
       _priorityQ.add(a.get(x)); 
     }
   }
     
  public String toString(){
    return _priorityQ.toString();
  }
  
  /*
  Unit removeMinH(Unit firstTarget){
    if(_priorityQ.isEmpty()){
      return null;
    }
    Unit target = null;
    float minLife = 99999;
    int indexOfTarget = 0;
    for (int index = 0; index < _priorityQ.size(); index ++){
      Unit unit = _priorityQ.get(index);
      float distance = firstTarget.position.dist(unit.position);
      if(distance < 100 && unit.life < minLife){
        minLife = unit.life;
        target = unit;
        indexOfTarget = index;
      }
    }
    return _priorityQ.remove(indexOfTarget);   
  }  */
  
  Unit removeMinH(){
    if(_priorityQ.isEmpty()){
      return null;
    }
    float minLife = 99999;
    int indexOfRemoval = 0;
    for (int index = 0; index < _priorityQ.size(); index ++){
      Unit unit = _priorityQ.get(index);
      //float distance = firstTarget.position.dist(unit.position);
      if(unit.life < minLife){//find target with lowest life--> get the index and save that in indexOfRemoval
        minLife = unit.life;
        indexOfRemoval = index;
      }
    }
    return _priorityQ.remove(indexOfRemoval);   
  }
  
}
