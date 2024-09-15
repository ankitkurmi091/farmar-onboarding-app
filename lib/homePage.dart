// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget{
//
//   const HomePage({super.key});
//
//   @override
//    HomePage1 createState() => HomePage1();
//
// }
//
// class HomePage1 extends State<HomePage>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FarmerEats'),
//       ),
//       body: const Text('Home Page'),
//     );
//   }
//
// }

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmerEats', style: TextStyle(fontSize: 24)),
        // backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is Home Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Icon(Icons.home, size: 50, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
