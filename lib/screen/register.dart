import 'dart:convert';

import 'package:delhibazar/rest/rest_services.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController pinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          color: Colors.grey.withOpacity(0.5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Welcome to",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "DELHI BAZAR ONLINE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: nameCtrl,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .80,
                    ),
                    border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailCtrl,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .80,
                    ),
                    border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phoneCtrl,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      "Mobile",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .80,
                    ),
                    border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordCtrl,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      "Passwoord",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .80,
                    ),
                    border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: pinCtrl,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: const Text(
                      "M-PIN",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .80,
                    ),
                    border: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var result = await RestServices.register(
                          nameCtrl.text.toString(),
                          emailCtrl.text.toString(),
                          phoneCtrl.text.toString(),
                          passwordCtrl.text.toString(),
                          pinCtrl.text.toString());



                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.6, 45),
                        primary: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  "Already have account? Login here",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
