import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petnear/Api/apiConnect.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController kota = new TextEditingController();
  TextEditingController kecamatan = new TextEditingController();
  TextEditingController desa_kelurahan = new TextEditingController();
  TextEditingController kode_pos = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController nohp = new TextEditingController();
  TextEditingController jenis_kelamin = new TextEditingController();

  Future _daftar() async {
    String url = (API.daftar);
    try {
      return await http.post(
        Uri.parse(url),
        body: {
          "username": user.text,
          "password": pass.text,
          "nama": nama.text,
          "alamat": alamat.text,
          "kota": kota.text,
          "kecamatan": kecamatan.text,
          "desa_kelurahan": desa_kelurahan.text,
          "kode_pos": kode_pos.text,
          "email": email.text,
          "nohp": nohp.text,
          "jenis_kelamin": jenis_kelamin.text,
        },
      ).then((value) {
        var data = jsonDecode(value.body);
        print(data["message"]);

        tampil();
      });
    } catch (e) {
      print(e);
    }
  }

  void clearText() {
    pass.clear();
    user.clear();
    nama.clear();
    alamat.clear();
    kota.clear();
    kecamatan.clear();
    desa_kelurahan.clear();
    kode_pos.clear();
    email.clear();
    nohp.clear();
    jenis_kelamin.clear();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Registration",
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

      //////BODY///////////////////////////////////////
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            // Column(
            //   alignment: Alignment.center,
            //  child: Text('Halo Daftar', style: TextStyle(fontSize: 25.0)),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your username.';
                  }
                  return null;
                },
                controller: user,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Username',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <-- SEE HERE
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Password.';
                  }
                  return null;
                },
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Password',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Name.';
                  }
                  return null;
                },
                controller: nama,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Nama Lengkap',
                  hintText: 'Nama Lengkap',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Address.';
                  }
                  return null;
                },
                controller: alamat,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Alamat',
                  hintText: 'Alamat',
                ),
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.multiline,
                maxLines: 3, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your City.';
                  }
                  return null;
                },
                controller: kota,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Kota',
                  hintText: 'Kota',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Kecamatan.';
                  }
                  return null;
                },
                controller: kecamatan,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Kecamatan',
                  hintText: 'Kecamatan',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Desa/Kelurahan.';
                  }
                  return null;
                },
                controller: desa_kelurahan,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Desa/Kelurahan',
                  hintText: 'Desa/Kelurahan',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Kode Pos.';
                  }
                  return null;
                },
                controller: kode_pos,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Kode Pos',
                  hintText: 'Kode Pos',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your E-mail.';
                  }
                  return null;
                },
                controller: email,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  hintText: 'E-mail',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your No HP.';
                  }
                  return null;
                },
                controller: nohp,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'No HP',
                  hintText: 'No HP',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Enter your Jenis Kelamin.';
                  }
                  return null;
                },
                controller: jenis_kelamin,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  border: OutlineInputBorder(),
                  labelText: 'Jenis Kelamin',
                  hintText: 'Jenis Kelamin',
                ),
                style: TextStyle(fontSize: 16),
                maxLines: 1, // <-- SEE HERE
                minLines: 1, // <
              ),
            ),
/////////// Button //////////////
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _daftar();
                      clearText();
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
      msg: "Registrasi / Pendaftaran Sudah Berhasil, Silahkan Login !!!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
