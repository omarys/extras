/** DFS sample
 * void search(Node root) {
 *   if (root == null) return;
 *   visit(root);
 *   root.visited = true;
 *   foreach (Node n in root.adjacent) {
 *     if (n.visited == false) {
 *       search(n);
 *     }
 *   }
 * }
 */

/** BFS sample
 * void search(Node root) {
 *   Queue queue = new Queue();
 *   root.visited = true;
 *   visit(root);
 *   queue.enqueue(root); // Add to end of queue
 *
 *   while(!queue.isEmpty()) {
 *     Node r = queue.dequeue(); // Remove from front
 *     foreach (Node n in r.adjacent) {
 *       if (n.visited == false) {
 *         visit(n);
 *         n.visited = true;
 *         queue.enqueue(n);
 *       }
 *     }
 *   }
 * }
 */
