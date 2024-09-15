import 'package:flutter/material.dart';
import 'package:onboarding/LoginPage.dart';

class WelcomePage extends StatefulWidget {
  String fileName;

  WelcomePage({Key? key, required this.fileName}) :super(key: key);

  @override
  Welcome1 createState() => Welcome1();

}

  class Welcome1 extends State<WelcomePage>{

  @override
  Widget build(BuildContext context) {
    String fileName1 = widget.fileName;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 32),
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 32),
            const Text(
              "You're all done!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(fileName1),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    // Handle file download or preview
                  },
                  icon: const Icon(Icons.download),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder:
                (context) => const LoginPage()
                ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Got it!'),
            ),
            const SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => const LoginPage()
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}