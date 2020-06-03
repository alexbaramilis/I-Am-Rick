// After Provider

//class Task {
//  String name;
//  bool isCompleted;
//
//  Task(
//    this.name, {
//    this.isCompleted = false,
//  });
//}

// Before Provider

class Task {
  String name;
  bool isCompleted;

  Task(
    this.name, {
    this.isCompleted = false,
  });

  static List<Task> sampleTasks() {
    return [
      Task('Clear the walkers from the gate.'),
      Task('Go over the inventory.'),
      Task('Inspect the walls.'),
      Task('Clean my revolver.'),
      Task('Interrogate the newcomers.'),
      Task('Plan the new supply routes.'),
      Task('Give a motivational speech.'),
    ];
  }
}
