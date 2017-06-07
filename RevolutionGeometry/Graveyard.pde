class Graveyard{
    //this will be the underlying structure for the graveyard
    //standard static implementation: 
    //add to front and removes from front (last in first out) 
    
    ArrayList<Unit> _stack; 
    
    public Graveyard(){
      _stack = new ArrayList<Unit> (); 
    }
    
    Unit dequeue(){//remove the unit that was last put in 
      
      return _stack.remove(size() - 1); 
    }
    
    void enqueue(Unit a){//put a unit into the stack 
      _stack.add(a); 
    }
    
    Unit peek(){//see the Unit that was last put in 
      return _stack.remove(_stack.size()-1); 
    }
      
    int size(){
      return _stack.size(); 
    }
    
    boolean isEmpty(){
      return size() == 0;
    }
    
}