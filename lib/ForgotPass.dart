import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/ForgotOTP.dart';
import 'package:http/http.dart' as http;

class Forgot1 extends StatefulWidget {
  const Forgot1({super.key});

  @override
  forgotPageT createState() => forgotPageT();
}
class forgotPageT extends State<Forgot1>{
  String emailT = '' ;
  TextEditingController email = TextEditingController();
  @override
  void dispose(){
    email.dispose();
    super.dispose();
  }

  void saveText(){
    emailT = email.text;
  }

  @override
  Widget build(BuildContext context) {
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
              'Forgot Password?',
              style: TextStyle(
                fontSize: 27,
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
                // const SizedBox(width: 8),
              ],
            ),
            TextButton(
              onPressed: () {
                // Navigate back to login page
                Navigator.pop(context);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email                                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                 saveText();
                 String email1 = emailT.toString();
                 String passPhone = '+91$email1';
                 bool checkS = await sendOtp(passPhone);
                 if(checkS) {
                   Navigator.push(context,
                     MaterialPageRoute(builder:
                         (context) => const Forgot2()
                     ),
                   );
                 }
                 else{
                   Navigator.push(context,
                     MaterialPageRoute(builder:
                         (context) => const Forgot1()
                     ),
                   );
                 }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Send Code'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> sendOtp(String mail) async {
  String url = 'https://sowlab.com/assignment/user/forgot-password';
  bool check = false;
  String message1 = '';
  try{
    String c = '+1984512598';
    var body = jsonEncode({"mobile": c});
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body
    );
    print('Status Code: ${response.statusCode}');
    print('...............................................${response.body}');

    Map<String,dynamic> map = jsonDecode(response.body);
    check = map['success'];
    message1 = map['message'];

  }
  catch(e){
    print(e);
  }
  if(check){
    return true;
  }
  else{
    Fluttertoast.showToast(msg: message1);
    return false;
  }
}