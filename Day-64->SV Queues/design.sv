/*create a queue of 5 elements {5,7,2,1,9}; perform below mentioed methods sequentially.
a)push_back
b)push_front
c)insert at position 3 an element 10
d)pop_front
e)pop_back
f)delete the item 1
g)display the final position of the elements remaining i the queue
h)delete an element from the remaining elements without using the delete method avaiilable.*/
module queue;
  integer queue[$]={5,7,2,1,9};
  int i;
  initial begin
    queue.push_back(3);
    queue.push_front(6);
    foreach(queue[i])
      $display(the queue values[%0d]=%d",i,queue[i]);
      queue.insert(3,10);
      foreach(queue[i])
      $display(the queue values[%0d]=%d",i,queue[i]);
      queue.pop_front();
      queue.pop_back();
      foreach(queue[i])
      $display(the queue values[%0d]=%d",i,queue[i]);
      queue.delete(4);
      foreach(queue[i])
      $display(the queue values[%0d]=%d",i,queue[i]);
      queue.pop_front();
      foreach(queue[i])
      $display(the queue values[%0d]=%d",i,queue[i]);
  end
endmodule
               
               
