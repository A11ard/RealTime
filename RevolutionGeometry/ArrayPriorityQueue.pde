public class ArrayPriorityQueue {

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




  public Unit removeMin() {
    for (int i = 0; i < _priorityQ.size(); i++) {
      if(frameCount % 30 == 0){
        _priorityQ.get(i).changeTrainingTime();
      }
      if ((int)_priorityQ.get(i).getTrainingTime() == peekMin()) {
        Unit removedUnit = _priorityQ.get(i);
        if((int)_priorityQ.get(i).getTrainingTime() == 0){
          _priorityQ.remove(i);
          return removedUnit;
        }
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