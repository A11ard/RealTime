class Stack{
    //this will be the underlying structure for the graveyard
    //standard static implementation: 
    //add to front and removes from front (last in first out) 
    
    ArrayList<Unit> _stack; 
    
    public Stack(){
      _stack = new ArrayList<Unit> (); 
    }
    
    public Unit dequeue(){//remove the unit that was last put in 
      return _stack.remove(_stack.size()); 
    }
    
    public void enqueue(Unit a){//put a unit into the stack 
      _stack.add(a); 
    }
    
    public int size(){
      return _stack.size(); 
    }
    
}
