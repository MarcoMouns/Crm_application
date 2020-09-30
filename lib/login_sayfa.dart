import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class LoginSayfa extends StatefulWidget {
  LoginSayfa({Key key}) : super(key: key);

  @override
  _LoginSayfaState createState() => _LoginSayfaState();
}

class _LoginSayfaState extends State<LoginSayfa> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icon.png"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "ESSENTE BİLİŞİM",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: TextFormField(
                          validator: (value) => EmailValidator.validate(value)
                              ? null
                              : "Lütfen geçerli bir mail adresi girin",
                          decoration: InputDecoration(
                              hintText: "Email", labelText: "Email"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Bu Alan Boş Bırakılamaz";
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Şifre", labelText: "Şifre"),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "GİRİŞ",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              }
                            },
                            color: Colors.orangeAccent,
                            elevation: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
