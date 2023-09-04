import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'Api/apiConnect.dart';
import 'Pages/User/memberPage.dart';
import 'Pages/Oprator/opratorPage.dart';
import 'Pages/Admin/adminPage.dart';
import 'Pages/ContactCenter/contactPage.dart';
import 'Pages/User/registrationPage.dart';
import 'Pages/User/forgotPasswordPage.dart';

void main() {
  runApp(MyApp());
}

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Dengan MySql',
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(
              username: username,
            ),
        '/MemberPage': (BuildContext context) => new MemberPage(
              username: username,
            ),
        '/OpratorPage': (BuildContext context) => new OpratorPage(
              username: username,
            ),
        '/ContactPage': (BuildContext context) => new ContactPage(),
        '/RegistrationPage': (BuildContext context) => new RegistrationPage(),
        '/ForgotPasswordPage': (BuildContext context) =>
            new ForgotPasswordPage(),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isHidePassword = true;

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future<List?> _login() async {
    String url = (API.login);
    final response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
    });
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        tampil();
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['level'] == 'user') {
        Navigator.pushReplacementNamed(context, '/MemberPage');
      } else if (datauser[0]['level'] == 'oprator') {
        Navigator.pushReplacementNamed(context, '/OpratorPage');
      }

      setState(() {
        username = datauser[0]['username'];
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.contact_phone,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 40,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/ContactPage');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                child: Text(
                  'Welcome to PetNear \n Hug Me, Please !!!',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 145, 255)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                    //hintText: 'Username'

                    fillColor: Colors.lightGreen[40],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "Username",
                    hintText: 'Username anda',
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: TextField(
                  controller: pass,
                  obscureText: _isHidePassword,
                  decoration: InputDecoration(
                    //hintText: 'Password'

                    fillColor: Colors.lightGreen[40],
                    filled: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    prefixStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    labelText: "Password",
                    hintText: 'Pawssord anda',
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _togglePassword();
                      },
                      child: Icon(
                        _isHidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: _isHidePassword ? Colors.grey : Colors.blue,
                      ),
                    ),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                  //padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  //textColor: Colors.white,
                  //color: Colors.blue,
                  //shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  child: Text(
                    "Lupa Password? Klik di sini !!!",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/ForgotPasswordPage');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  child: Text(
                    "Daftar / Registrasi",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/RegistrationPage');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Text(
                    "SAYANGI HEWAN & TUMBUHAN BERSAMA PETNEAR. \n \n © 2023 PT. Wijaya Global Solusindo \n ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  onPressed: () {
                    _login();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void tampil() {
    Fluttertoast.showToast(
        msg: "LOGIN GAGAL",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
