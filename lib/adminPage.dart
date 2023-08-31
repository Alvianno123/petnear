import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  AdminPage({required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin",
          style: TextStyle(fontSize: 24.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text('Halo $username', style: TextStyle(fontSize: 25.0)),
            ),
          ],
        ),
      ),
    );
  }
}
