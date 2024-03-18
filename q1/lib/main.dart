import 'dart:collection';

class Graph {
  Map<String, List<String>> adjacencyList;

  Graph(this.adjacencyList);

  List<List<String>> findAllPaths(String source, String destination) {
    List<List<String>> paths = [];
    Set<String> visited = {};

    void dfs(String currentNode, List<String> currentPath) {
      visited.add(currentNode);
      currentPath.add(currentNode);

      if (currentNode == destination) {
        paths.add(List.from(currentPath));
      } else {
        for (String neighbor in adjacencyList[currentNode]!) {
          if (!visited.contains(neighbor)) {
            dfs(neighbor, currentPath);
          }
        }
      }

      currentPath.removeLast();
      visited.remove(currentNode);
    }

    dfs(source, []);
    return paths;
  }

  List<String> findShortestPath(String source, String destination) {
    Map<String, String> previousNodes = {};
    Queue<String> queue = Queue();
    Set<String> visited = {};

    queue.add(source);
    visited.add(source);

    while (queue.isNotEmpty) {
      String currentNode = queue.removeFirst();

      if (currentNode == destination) {
        return reconstructPath(previousNodes, destination);
      }

      for (String neighbor in adjacencyList[currentNode]!) {
        if (!visited.contains(neighbor)) {
          queue.add(neighbor);
          visited.add(neighbor);
          previousNodes[neighbor] = currentNode;
        }
      }
    }

    return [];
  }

  List<String> reconstructPath(Map<String, String> previousNodes, String destination) {
    List<String> path = [destination];
    String currentNode = destination;

    while (previousNodes.containsKey(currentNode)) {
      currentNode = previousNodes[currentNode]!;
      path.insert(0, currentNode);
    }

    return path;
  }
}

void main() {
  final adjacencyList = {
    'A': ['B', 'D', 'H'],
    'B': ['A', 'C', 'D'],
    'C': ['B', 'D', 'F'],
    'D': ['A', 'B', 'C', 'E'],
    'E': ['D', 'F', 'H'],
    'F': ['C', 'E', 'G'],
    'G': ['F', 'H'],
    'H': ['A', 'E', 'G'],
  };

  final graph = Graph(adjacencyList);

  final source = 'A';
  final destination = 'H';

  print('All Paths between $source and $destination: ');
  final allPaths = graph.findAllPaths(source, destination);
  allPaths.forEach(print);

  final shortestPath = graph.findShortestPath(source, destination);
  print('Shortest Path between $source and $destination: $shortestPath');
}