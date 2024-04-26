public class ch3StacksQueues {
  class Stack {
    Node top;

    Object pop() {
      if (top != null) {
        Object item = top.data;
        top = top.next;
        return item;
      }
      return null;
    }

    void push(Object item) {
      Note t = new Node(item);
      t.next = top;
      top = t;
    }

    Object peek() {
      return top.data;
    }
  }

  class Queue {
    Node first, last;

    void enqueue(Object item) {
      if (first == null) {
        last = new Node(item);
        first = last;
      } else {
        last.next = new Node(item);
        last = last.next;
      }
    }

    Object dequeue() {
      if (first != null) {
        Object item = first.data;
        first = first.next;
        return item;
      }
      return null;
    }
  }
}
