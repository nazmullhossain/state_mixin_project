import 'package:flutter/material.dart';

import '../local/servicce.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Servicess servicess=Servicess();
  final TextEditingController _controller = TextEditingController();
  String _username = '';
  
  void _saveUsername()async{
    _username = _controller.text;
    servicess.saveData("username", _username);
  }
  void _loadUsername() async {
    _username = await servicess. readData('username') ?? '';
    print("username ${_username}");
    setState(() {

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    _loadUsername();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveUsername,
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: _loadUsername,
              child: Text('Load'),
            ),
            SizedBox(height: 16),
            Text('Saved Username: $_username'),
          ],
        ),
      ),
    );
  }
}
