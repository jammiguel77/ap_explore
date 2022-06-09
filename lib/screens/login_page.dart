// todo: delete old db , convert password to caps ,

import 'dart:convert';
import 'package:ap_explore/constants/ursl.dart';
import 'package:ap_explore/database/database_helper.dart';
import 'package:ap_explore/screens/homescreen.dart';
import 'package:ap_explore/widgets/ap_explore_elevated_button.dart';
import 'package:http/http.dart' as http;
import 'package:ap_explore/widgets/ap_explore_image.dart';
import 'package:flutter/material.dart';
import 'package:ap_explore/constants/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsersdatabase();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const ApExploreImage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Usuario",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isNotEmpty && value.length >= 2) {
                          return null;
                        } else if (value.length < 3 && value.isNotEmpty) {
                          return "username is too short";
                        } else {
                          return "Please enter a username";
                        }
                      },
                     

                      controller: usernameController,
                      autofocus: false,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        contentPadding: const EdgeInsets.all(15.0),
                        suffixIconColor: Colors.black87,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            width: 0.05,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Contrasena",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a password ";
                        } else if (value.length < 3 && value.isNotEmpty) {
                          return "Paaaword is too short";
                        } else {
                          return null;
                        }
                      },
                       obscureText: true,
                       autocorrect: false,
                       enableSuggestions: false,
                      controller: passwordController,
                      // obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        contentPadding: const EdgeInsets.all(15.0),
                        suffixIconColor: Colors.black87,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                            width: 0.05,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                      onChanged: (value) => setState(() {}),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ApExploreButton(
                    buttonName: "Accesar",
                    onButtonPressed: () {
                      final form = _formkey.currentState;
                      if (form!.validate()) {
                        setState(() {
                          form.save();
                        });
                        checkUserInDatabase(
                            usernameController.text, passwordController.text);
                      }
                    },
                  ),
                  ApExploreButton(
                    buttonName: "Cancelar",
                    onButtonPressed: () {},
                  ),
                ],
              ),
              const FractionallySizedBox(
                widthFactor: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void queryUserInDb() async {}

 
  void fetchUsersdatabase() async {
    try {
      var usersDatabaseEndpointUrl = Uri.parse(userLoginUrl);
      var usersDatabaseEndpointResponse =
          await http.get(usersDatabaseEndpointUrl);
      final usersDatabaseEndpointJson =
          jsonDecode(usersDatabaseEndpointResponse.body);
      saveUsersToDatabase(usersDatabaseEndpointJson);
    } catch (err) {
      displayRetrySnackBar("Connection problem !");
    }
  }

  void saveUsersToDatabase(usersDatabaseEndpointJson) async {
    // check if database exits if yes then delete
    for (var users in usersDatabaseEndpointJson) {
      await UsersDatabase.instance.createUser(users);
    }
  }

  void displaySnackBar(text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
    );
    scaffoldKey.currentState?.showSnackBar(snackBar);
  }

  void displayRetrySnackBar(text) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
          label: "Retry",
          onPressed: () {
            fetchUsersdatabase();
          }),
    );
    scaffoldKey.currentState?.showSnackBar(snackBar);
  }

  void deleteUserTable() {}

  void checkUserInDatabase(username, password) async {
    // this lines the type from dynamic to string
    final String userName = username;
    final String passWord = password;
    try {
      final checkUser =
          await UsersDatabase.instance.readUser(userName, passWord);
      final returnedUsernameFromDB = checkUser[0]["user"];
      final returnedPasswordFromDB = checkUser[0]["password"];
      // if username from keyboard is the not same as that from the database
      if (userName != returnedUsernameFromDB) {
        displaySnackBar("Username does not exist");
        return;
      }

      // check if username from keyboard is the same as that from the database
      if (userName == returnedUsernameFromDB) {
        // check if password from keyboard is not the same as that from the database
        if (passWord != returnedPasswordFromDB) {
          displaySnackBar("Wrong password ");
          return;
        }
        // check if password from keyboard is the same as that from the database
        if (passWord == returnedPasswordFromDB) {
          displaySnackBar("Login successfull");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      } else {
        displaySnackBar("Invalid login credentials");
      }
    } catch (error) {
      displaySnackBar("user doesnt exists");
    }
  }
}
