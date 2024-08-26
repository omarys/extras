public class HashTable {
  public HashMap<Integer, Student> buildMap(Student[] students){
    HashMap<Integer, Student> map = new HashMap<Integer, Student>();
    for (Student s : students) map.put(s.getId(),s);
    return map;
  }
}
public class ArrayList {
  public ArrayList<String> sentence = new ArrayList<String>();
  for (String w : words) sentence.add(w);
  for (String w : more) sentence.add(w);
  return sentence;
}
public class StringBuffer {
  public String joinWords(String[] words) {
    String sentence = "";
    for (String w : words) {
      sentence = sentence + w;
    }
    return sentence;
  }
}
