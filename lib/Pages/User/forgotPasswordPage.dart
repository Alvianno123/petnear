import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:petnear/Email/email.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petnear/Api/apiConnect.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
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

      ////////////////////////BODY////////////////////
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('SILAHKAN MASUKAN E-MAIL ANDA !!!'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your E-mail.';
                  }
                  return null;
                },
                //   controller: user,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'E-Mail',
                  hintText: 'E-Mail',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <-- SEE HERE
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      sendEmail(context);
                      //   tampil();
                    }
                  },
                  child: const Text('Registrasi / Daftar'),
                )),
          ],
        ),
      ),
    );
  }
}

void tampil() {
  Fluttertoast.showToast(
      msg: "Forgot Password Sudah Berhasil, Silahkan Login !!!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
