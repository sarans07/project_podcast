import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF231d1f),Color(0xFF5f0176)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.white,width: 3),
            //       borderRadius: BorderRadius.circular(30)
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text("Skip",
            //       style: TextStyle(
            //         color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold
            //       ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 100),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("https://png.pngtree.com/png-clipart/20220812/ourmid/pngtree-podcasting-neon-microphone-icon-png-image_6107861.png"),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Login to continue",
              style: TextStyle(
                color: Colors.white,fontSize: 30
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
