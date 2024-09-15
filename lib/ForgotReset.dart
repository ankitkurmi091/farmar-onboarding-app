import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onboarding/LoginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotLast extends StatefulWidget {
  String tokenData;
  ForgotLast({Key? key, required this.tokenData}): super(key: key);

  @override
  ResetPass createState() => ResetPass();
}
class ResetPass extends State<ForgotLast>{
  String password = '';
  String passwordCheck = '';
  TextEditingController pass = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void dispose(){
    pass.dispose();
    passC.dispose();
    super.dispose();
  }
  saveText(){
    password = pass.text;
    passwordCheck = passC.text;
  }


  @override
  Widget build(BuildContext context) {

    Map<String,dynamic> resetData = {
      "token": widget.tokenData,
      "password": password,
      "cpassword": passwordCheck
    };

    return Scaffold(
        appBar: AppBar(
        title: const Text('FarmerEats'),
        ),
      
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Remember your password?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

              ],
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: pass,
              decoration: const InputDecoration(
                hintText: 'New Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passC,
              decoration: const InputDecoration(
                hintText: 'Confirm New Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                saveText();

                bool check = await passwordReset(resetData);
                if(check) {
                  Fluttertoast.showToast(msg: 'password changed');
                  Navigator.push(context,
                  MaterialPageRoute(builder:
                  (context) => const LoginPage()),
                  );
                }
                else{
                  Fluttertoast.showToast(msg: 'try again');
                  Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => const LoginPage()),
                  );
                }

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


Future<bool> passwordReset(Map mapA) async {
  String url = 'https://sowlab.com/assignment/user/reset-password';
  bool check = false;
  String message1 = '';
  print('.........................................................................................');
  print(mapA);
  try {

    http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(mapA),
    );
    print('Status Code: ${response.statusCode}');
    print('...............................................${response.body}');

    Map<String, dynamic> map = jsonDecode(response.body);
    check = map['success'];
    message1 = map['message'];
  }
  catch (e) {
    print(e);
  }
  if (check) {
    return true;
  }
  else {
    Fluttertoast.showToast(msg: message1);
    return false;
  }
}
