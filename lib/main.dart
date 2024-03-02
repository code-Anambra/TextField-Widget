import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //attributes
  List<String> inputs = ['First Item'];
  final TextEditingController _controller = TextEditingController();

  //method
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addInput() {
    setState(() {
      inputs.add(_controller.text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Add messages'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Add message here'),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(onPressed: addInput, child: Text('Submit')),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: inputs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(inputs[index]),
                    );
                  }),
            )
          ],
        ));
  }
}
