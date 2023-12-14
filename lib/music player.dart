// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final AudioPlayer audioPlayer = AudioPlayer();
//   final await{};
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Local Audio Player'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               playLocalAudio();
//             },
//             child: Text('Play Local Audio'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> playLocalAudio() async {
//     try {
//       int result =  await audioPlayer.play('assets/mp3.mp3' as Source, isLocal: true);
//       if (result == 1) {
//         // Success
//         print('Audio playing');
//       } else {
//         // Handle failures
//         print('Failed to play audio');
//       }
//     } catch (e) {
//       // Handle exceptions
//       print('Error playing audio: $e');
//     }
//   }
// }






import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final mobilecontroller = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}
  final _formkey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(

          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey[700]
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                const Image(image: NetworkImage("https://png.pngtree.com/png-clipart/20220812/ourmid/pngtree-podcasting-neon-microphone-icon-png-image_6107861.png")),

                const SizedBox(height: 30),

                Text(
                  'Login to continue',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    labelText: 'Enter Mobile Number'
                    ),
                    controller: mobilecontroller,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (value){

                    },
                    validator: (value){
                      if (value == null|| value.isEmpty||value.length<10||value.length>10) {
                        return 'Please enter valid phone number';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 100,
                  child: FloatingActionButton(onPressed: (){
                    if(_formkey.currentState!.validate());
                  },child: Text("Send Otp"),
                  backgroundColor: Colors.blue,

                  ),
                ),
                const SizedBox(height: 10),

                // forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Resend Otp',
                //         style: TextStyle(color: Colors.blue[600]),
                //       ),
                //     ],
                //   ),
                // ),

                //const SizedBox(height: 25),

                // sign in button
                // Button(
                //   onTap: signUserIn,
                // ),

                //const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 2,color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/gg.png"),
                                fit: BoxFit.fill)
                          ),
                        ),
                        SizedBox(width: 20),
                        Text("Login with Google",
                        style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                ),

                //const SizedBox(height: 50),

                // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: const [
                //     // google button
                //     //SquareTile(imagePath: 'lib/images/google.png'),
                //
                //     SizedBox(width: 25),
                //
                //     // apple button
                //    // SquareTile(imagePath: 'lib/images/apple.png')
                //   ],
                // ),
                //
                // const SizedBox(height: 50),
                //
                // // not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Not a member?',
                //       style: TextStyle(color: Colors.grey[700]),
                //     ),
                //     const SizedBox(width: 4),
                //     const Text(
                //       'Register now',
                //       style: TextStyle(
                //         color: Colors.blue,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}