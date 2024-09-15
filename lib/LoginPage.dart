import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onboarding/ForgotPass.dart';
import 'package:onboarding/Sinup1.dart';
import 'package:onboarding/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  tempLogin createState() => tempLogin();

}
class tempLogin extends State<LoginPage>{

  String userName = "";
  String password = "";

  final TextEditingController userIn = TextEditingController();
  final TextEditingController passIn = TextEditingController();


  @override
  void dispose() {
    userIn.dispose();
    passIn.dispose();
    super.dispose();
  }

  void saveText () {
    // Store the value of the text in a variable
    userName = userIn.text;
    // print('Full Name: $fullNameB');
    password = passIn.text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Perform action for creating a new account
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage1()),
                  );
                  // print("Create account clicked");
                },
                child: const Text(
                  'New here? Create account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue, // Add color to make it look like a link
                    decoration: TextDecoration.underline, // Underline the text
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: userIn,
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passIn,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Perform action for forgot password
                      Navigator.push(context,
                      MaterialPageRoute(builder:
                      (context) => const Forgot1()
                      ),
                      );
                    },
                    child: const Text(
                      'Forgot?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue, // Add color to make it look like a link
                        decoration: TextDecoration.underline, // Underline the text
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  saveText();
                  Map<String,dynamic> loginData = {
                    "email": userName,
                    "password": password,
                    "role": "farmer",
                    "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
                    "type": "email",
                    "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
                  };
                  bool checkLogin = await loginPost(loginData);

                  if(checkLogin){
                    Navigator.push(context,
                      MaterialPageRoute(builder:
                      (context) => const HomePage())
                    );
                  }

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 32),
              const Text(
                'or login with ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   onPressed: () {
                  //     // Implement Google login logic
                  //   },
                  //   icon: const Icon(Icons.golf_course),
                  // ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Implement Google login logic
                    },
                    icon: Image.asset(
                      'assets/assets/google.png',

                      height: 23,
                      width: 23,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Implement Apple login logic
                    },
                    icon: const Icon(Icons.apple),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      // Implement Facebook login logic
                    },
                    icon: const Icon(Icons.facebook),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> loginPost(Map mapData) async {
  String url = 'https://sowlab.com/assignment/user/login';
  bool isSuccess = false;
  String message = '';

  try{
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(mapData),
    );

    Map<String,dynamic> responseData = jsonDecode(response.body);
    isSuccess = responseData['success'];
    message = responseData['message'];


    print(response.body);

  }
  catch(e){
    print(e);
  }

  if(isSuccess){
    return true;
  }
  else{
    print('...................$message');
    print('in else ...................');
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );

    // Fluttertoast.showToast(
    //   msg: "try again",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.white,
    //   textColor: Colors.black,
    //   fontSize: 16.0,
    // );
    return false;
  }

}
