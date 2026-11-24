
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // STATIC: Main screen
    return Scaffold(

      // STATIC: AppBar
      appBar: AppBar(
        title: const Text('My Study Planner'),
      ),

      // STATIC: Screen body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // STATIC: Heading
            const Text(
              'My Study Goals',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // STATIC: First goal card
            const Card(
              child: ListTile(
                title: Text('Dart Programming'),
                subtitle: Text('3 hours'),
              ),
            ),

            // STATIC: Second goal card
            const Card(
              child: ListTile(
                title: Text('Database Systems'),
                subtitle: Text('2 hours'),
              ),
            ),

            // STATIC: Third goal card
            const Card(
              child: ListTile(
                title: Text('Mobile App Development'),
                subtitle: Text('4 hours'),
              ),
            ),
          ],
        ),
      ),

      // STATIC: Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
