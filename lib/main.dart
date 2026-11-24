import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // STATIC: Main application
    return MaterialApp(
      title: 'My Study Planner',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // LOGIC: Store study goals
  List<Map<String, dynamic>> goals = [
    {'subject': 'Dart Programming', 'hours': 3, 'done': false},
    {'subject': 'Database Systems', 'hours': 2, 'done': false},
    {'subject': 'Mobile App Development', 'hours': 4, 'done': false},
  ];

  // LOGIC: Add a sample goal
  void addGoal() {
    setState(() {
      goals.add({'subject': 'Software Engineering', 'hours': 2, 'done': false});
    });
  }

  // LOGIC: Mark a goal as done or not done
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // LOGIC: Delete a goal
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // STATIC: Main screen
    return Scaffold(
      // STATIC: AppBar
      appBar: AppBar(title: const Text('My Study Planner')),

      // STATIC: Screen body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STATIC: Heading
            const Text(
              'My Study Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // CONNECTION 1: Connect goal data to the screen
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];

                  return Card(
                    child: ListTile(
                      // CONNECTION 2: Connect user actions to logic
                      onTap: () {
                        toggleGoal(index);
                      },

                      leading: Checkbox(
                        value: goal['done'],
                        onChanged: (value) {
                          toggleGoal(index);
                        },
                      ),

                      title: Text(
                        goal['subject'],
                        style: TextStyle(
                          decoration: goal['done']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      subtitle: Text('${goal['hours']} hours'),

                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteGoal(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // STATIC: Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: addGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
