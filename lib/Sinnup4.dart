import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/LoginPage.dart';
import 'dart:convert';
import 'Sinup1.dart';
import 'Sinup5.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignupPage4 extends StatefulWidget {

  final Map<String, dynamic> data4;
  const SignupPage4({Key? key, required this.data4}):super(key: key);

  @override
  SinFull createState() => SinFull();
}
class SinFull extends State<SignupPage4>{
  String fileName1 = '';
  String? selectTime;

  @override
  Widget build(BuildContext context) {
    fileName1 = widget.data4['registration_proof'];

    return Scaffold(
        appBar: AppBar(
        title: const Text('FarmerEats'),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 16),
            const Text(
              'Signup 4 of 4',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 60),
            child: Text(
              'Business Hours',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            // const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 10, right: 10),
              child: Center( // Added Center widget
                child: Text(
                  'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center, // Optional, for text alignment within the text box
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 50),
              child: Text(
                'Select Time',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectTime, // Selected value, can be null
                    hint: const Text('Select Working Time'), // Text shown when nothing is selected
                    isExpanded: true, // Makes dropdown take full width
                    items: <String>[
                      '8:00 - 11:00 AM',
                      '12:00 - 3:00 PM',
                      '3:00 - 6:00 PM',
                      'All Day'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectTime = newValue;

                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {

                var postData = postRequest(widget.data4);
                String postData1 = postData.toString();
                if(postData1.contains('fal')){
                  Fluttertoast.showToast(
                    msg: "try again",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(context,
                  MaterialPageRoute(builder:
                  (context) => SignupPage1())
                  );
                }
                else{
                  Fluttertoast.showToast(
                    msg: "registered",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );

                  Navigator.push(context,
                  MaterialPageRoute(builder:
                  (context) => const LoginPage())
                  );
                }


                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage(fileName: fileName1)),
               );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}


Future<String> postRequest(Map data) async {
  bool check = false;
  String token = '';
  String message = '';
  String url = 'https://sowlab.com/assignment/user/register';
  bool registration;
  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    String responseData = response.body;
    Map<String,dynamic> d = jsonDecode(responseData);

    check = d['success'];
    token = d['token'];
    message = d['message'];
    print('hi ..................................  $check');


  } catch (e) {
    print('Error: $e');
  }
  if(check){
    return token;
  }
  else{
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
    return 'fal';
  }
}