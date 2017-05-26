/*public class ArrayPriorityQueue<T>{

    private ArrayList<T> _priorityQ;

    public ArrayPriorityQueue(){
      _priorityQ = new ArrayList<T>();
    }
    
    public void add(T x){
      _priorityQ.add(x);
    }

    public boolean isEmpty(){
      return _priorityQ.size() == 0;
    }
    
    public T peekMin(){
    if(!isEmpty()){
      int min = (int)_priorityQ.get(0);
  
      for(int i = 1; i < _priorityQ.size(); i++){
        if((int)_priorityQ.get(i) < min ){
          min = (int)_priorityQ.get(i);
        }
      }
      return min;
  }
  return -1;
    }

    public int removeMin(){
      for(int i = 0; i < _priorityQ.size(); i++){
        if((int)_priorityQ.get(i) == peekMin()){
          int min =(int)_priorityQ.get(i);
          _priorityQ.remove(i);
          return min;
      }
  }
  return -1;
    }

    public String toString(){
      return _priorityQ.toString();
    }
  
}*/