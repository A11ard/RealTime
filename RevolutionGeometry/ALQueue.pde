/*****************************************************
 * class ALQueue
 * uses an ArrayList to implement abstract data type QUEUE
 * (a collection with FIFO property)
 *
 *       -------------------------------
 *   end |  --->   Q U E U E   --->    | front
 *       -------------------------------
 *
 ******************************************************/
public class ALQueue<T>
{
  private ArrayList<T> _queue;

  // default constructor
  public ALQueue() { 
    /* YOUR IMPLEMENTATION HERE */
    _queue = new ArrayList<T>();
  }


  // means of adding an item to collection 
  public void enqueue( T x ) 
  {
    /* YOUR IMPLEMENTATION HERE */
    _queue.add(x);
  }//O(1)


  // means of removing an item from collection 
  public T dequeue() 
  {
    /* YOUR IMPLEMENTATION HERE */
    return _queue.remove(0);
  }//O(n)


  // means of "peeking" at the front item
  public T peekFront() 
  {
    /* YOUR IMPLEMENTATION HERE */
    return _queue.get(0);
  }//O(1)


  // means of checking to see if collection is empty
  public boolean isEmpty() 
  {
    /* YOUR IMPLEMENTATION HERE */
    return _queue.size() == 0;
  }//O(1)


  public String toString() 
  {
    /* YOUR IMPLEMENTATION HERE */
    String retStr = "";
    for (T item : _queue) {
      retStr += item + ", ";
    }
    return retStr;
  }//O(n)


  //main method for testing
}//end class ALQueue