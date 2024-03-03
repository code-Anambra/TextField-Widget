// Name: Nzeamalu David C.
// Mobile App Development
// tag: 08


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
  List<String> inputs = ['List of Items'];
  final TextEditingController _controller = TextEditingController();

  //method
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addInput() {
    String NewInpute = _controller.text.trim();
    if (NewInpute.isNotEmpty && !inputs.contains(NewInpute)){
    setState(() {
      inputs.add(NewInpute);
      _controller.clear();
    });
    }
  }

  void resetInputs(){
    setState(() {
      inputs.clear();
      inputs.add('First Item');
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            ElevatedButton(onPressed: addInput, child: Text('Submit')),
            SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: resetInputs, child: Text('Reset')),
            SizedBox(
              height: 10,
            ),
              ],
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

/*  IN THIS MODIFIED VERSION OF THIS CODE:
    1.  I added resetInputs() method to clear all the list.
    2.  I added a new ElevatedButton for resetting the list of Items. This button calls the 'ResetInputs() method when pressed
    3.  Finally i Modified the addInput() method to trim the input string and check if it's not empty (isNotEmpty) 
        and if it's not already in the list (!inputs.contains(newInput)). If these conditions are met, 
        the new message is added to the list. Otherwise, it will just be ignored. 
*/
