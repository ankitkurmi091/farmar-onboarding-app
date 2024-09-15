import 'package:flutter/material.dart';
import 'package:onboarding/ForgotReset.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'ForgotPass.dart';

class Forgot2 extends StatefulWidget {
  // final String emailD;
  // Forgot2({Key? key, required this.emailD}) : super(key: key);
  const Forgot2({super.key});

  @override
  VerifyT createState() => VerifyT();
}


class VerifyT extends State<Forgot2>{
  String otp = '';
  String token = '';
  // Map<String, dynamic> sendToForgot = {
  //
  // };

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
              'Verify OTP',
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
                // Navigate back to login page
                Navigator.pop(context);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 32),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                otp = value;
              },
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                // fieldsColor: Colors.grey[200],
                fieldHeight: 50,
                fieldWidth: 40,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey[200],
                selectedColor: Colors.blue,
                activeFillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                token = await verifyOtp(otp);
                if(token == 'false') {
                  Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => const Forgot1()
                    ),
                  );
                }
                else{
                  Navigator.push(context,
                    MaterialPageRoute(builder:
                        (context) => ForgotLast(tokenData: token),
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
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {

              },
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> verifyOtp(String otp) async {
  String url = 'https://sowlab.com/assignment/user/verify-otp';
  bool check = false;
  String message1 = '';
  String token = '';
  try {
    var body = jsonEncode({"otp": otp});
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print('Status Code: ${response.statusCode}');
    print('...............................................${response.body}');

    Map<String, dynamic> map = jsonDecode(response.body);
    check = map['success'];
    message1 = map['message'];
    token = map['token'];
  }
  catch (e) {
    print(e);
  }
  if (check) {
    return token;
  }
  else {
    Fluttertoast.showToast(msg: message1);
    return 'false';
  }
}
