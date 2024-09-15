import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Sinnup4.dart';

class SignupPage3 extends StatefulWidget {
  final Map<String, dynamic> data3;

  const SignupPage3({Key? key, required this.data3}) :super(key: key);

  @override
  _SignupPage3State createState() => _SignupPage3State();
}
class _SignupPage3State extends State<SignupPage3> {
  String imageName = 'a';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
      const Padding(
      padding: EdgeInsets.all(50.0),

            child: Text(
              'Signup 3 of 4',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
      ),
    const Padding(
    padding: EdgeInsets.only(top: 45.0),
            child: Text(
              'Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
    ),

            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Attached proof of Department of Agriculture registration. (Florida Fresh, USDA Approved, USDA Organic)',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(height: 32),
            // Add image picker widget here
            IconButton(
              onPressed: () async {
                final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (image != null) {
                  imageName = image.name;

                }
              },
              icon: const Icon(Icons.camera),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if(imageName == 'a'){
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
                    MaterialPageRoute(
                        builder:
                            (context) => SignupPage3(data3: widget.data3)
                    ),
                  );

                }
                else {
                  widget.data3['registration_proof']=imageName;
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:
                            (context) => SignupPage4(data4: widget.data3)
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
    );
  }
}