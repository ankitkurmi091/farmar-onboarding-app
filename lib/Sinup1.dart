import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onboarding/Sinup2.dart';

  class SignupPage1 extends StatefulWidget {
  @override
  SignupPage11 createState() => SignupPage11();
  }

  class SignupPage11 extends State<SignupPage1> {
    String fullName = "";
    String fullMail = "";
    String fullPhone = "";
    String fullPass = "";
    String fullPassC = "";

    final TextEditingController name = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController passC = TextEditingController();



    @override
    void dispose() {
      name.dispose();
      email.dispose();
      phone.dispose();
      password.dispose();
      passC.dispose();
      super.dispose();
    }

    void saveText () {
      // Store the value of the text in a variable
      fullName = name.text;
      print('Full Name: $fullName');
      fullMail = email.text;
      fullPhone = phone.text;
      fullPass = password.text;
      fullPassC = passC.text;
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Signup 1 of 4',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
            const SizedBox(height: 32),
            const Text(
              'or signup with',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: email,
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
              controller: phone,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Password',
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
                hintText: 'Re-enter Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                saveText();
                String fullPhone1 = fullPhone.toString();
                String passPhone = '+91$fullPhone1';
                print(passPhone);
                Map<String,dynamic> mapData = {
                  'full_name':fullName,
                  'email':fullMail,
                  'phone':passPhone,
                  'password':fullPass,
                  'role': "farmer",
                  'device_token': "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
                  "type": "email",
                   "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
                };

                if(fullPass==fullPassC && fullPassC !='' && fullName !='' && fullPass !='' && fullPhone !='' && fullMail !='') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage2(data2: mapData),
                    ),
                  );
                }
                else if(fullPass != fullPassC){
                  print('pass not matched');
                  Fluttertoast.showToast(
                    msg: "Password not match",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage1(),
                    ),
                  );
                }
                else{
                  Fluttertoast.showToast(
                    msg: "any field empty",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage1(),
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
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
