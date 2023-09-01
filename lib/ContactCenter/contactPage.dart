import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Center",
          style: TextStyle(fontSize: 24.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 40,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    'Silahlan Kontak Admin Kami... \n\n\nWhatsApp   : 0857-2677-4057 \n\nEmail            : alviannowijaya@gmail.com ',
                    style: TextStyle(fontSize: 18.0)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 300, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text(
                    "SAYANGI HEWAN & TUMBUHAN BERSAMA PETNEAR. \n \n © 2023 PT. Wijaya Global Solusindo \n ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
