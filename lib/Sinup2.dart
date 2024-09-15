import 'package:flutter/material.dart';
import 'package:onboarding/Sinup3.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SignupPage2 extends StatefulWidget {
  // final String data;
  final Map<String, dynamic> data2;
  // const SignupPage2({Key? key, required this.data}) : super(key: key);
  const SignupPage2({Key? key, required this.data2}) : super(key: key);
  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {

  String? selectedState;
  String fullNameB = "";
  String fullInformalName = "";
  String fullAdd = "";
  String fullCity = "";
  String fullZipCode = "";

  final TextEditingController business = TextEditingController();
  final TextEditingController info = TextEditingController();
  final TextEditingController add = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController zipCode = TextEditingController();

  @override
  void dispose() {
    business.dispose();
    info.dispose();
    add.dispose();
    city.dispose();
    zipCode.dispose();
    super.dispose();
  }

  void saveText () {
    // Store the value of the text in a variable
    fullNameB = business.text;
    // print('Full Name: $fullNameB');
    fullInformalName = info.text;
    fullAdd = add.text;
    fullCity = city.text;
    fullZipCode = zipCode.text;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('FarmerEats'),
        ),
        body: SingleChildScrollView(
        child:  Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Farm Info',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Signup 2 of 4',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 32),
            TextField(
              controller: business,
              decoration: const InputDecoration(
                hintText: 'Business Name',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: info,
              decoration: const InputDecoration(
                hintText: 'Informal Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: add,
              decoration: const InputDecoration(
                hintText: 'Street Address',
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: city,
              decoration: const InputDecoration(
                hintText: 'City',
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('State'),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedState,
                  hint: const Text('Select State'),
                  items: <String>['Delhi', 'Punjab','Madhya Pradesh', 'Karnataka','Maharashtra']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: zipCode,
              decoration: const InputDecoration(
                hintText: 'Enter Zipcode',
                prefixIcon: Icon(Icons.location_pin),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                saveText();
                widget.data2['business_name']= fullNameB;
                widget.data2['informal_name']= fullInformalName;
                widget.data2['address']= fullAdd;
                widget.data2['city']= fullCity;
                widget.data2['zip_code']= fullZipCode;
                widget.data2['state']=selectedState;
                print(widget.data2);

                if(fullNameB !='' && fullInformalName !='' && fullAdd !='' && fullCity !='' && fullZipCode !='') {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder:
                            (context) => SignupPage3(data3: widget.data2)
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
                      builder: (context) => SignupPage2(data2: widget.data2,),
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
      )
    );
  }
}
