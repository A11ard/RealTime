public class ArrayPriorityQueue {
  int start;
  private ArrayList<Unit> _priorityQ;

  public ArrayPriorityQueue() {
    _priorityQ = new ArrayList<Unit>();
  }

  public void add(Unit x) {
    _priorityQ.add(x);
  }

  public boolean isEmpty() {
    return _priorityQ.size() == 0;
  }

  //PEEKMIN FOR TRAINING TIME
  public int peekMin() {
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

  public int peekMinH() {
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

 //Change training time for all units in queue by -1 every 1 second
  void changeTime(){
      for (int i = 0; i < _priorityQ.size(); i++) {
         if(millis() - start > 1000){
         _priorityQ.get(i).changeTrainingTime();
         start = millis();
       }
    }
  }
  //REMOVEMIN FOR TRAINING TIME
  public Unit removeMin() {
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

  public Unit removeMinH() {
    for (int i = 0; i < _priorityQ.size(); i++) {
      if ((int)_priorityQ.get(i).getLife() == peekMinH()) {
        Unit removedUnit = _priorityQ.get(i);
        _priorityQ.remove(i);
        return removedUnit;
      }
    }
    return null;
  }
  
  public String toString(){
    return _priorityQ.toString();
  }
  
}