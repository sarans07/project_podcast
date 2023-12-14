import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
 File? _selectedImage;
 Future _pickImageFromGallary() async{
   final returedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
   if(returedImage==null) {
     return;
   }
   setState(() {
     _selectedImage=File(returedImage.path);
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF231d1f),Color(0xFF5f0176)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.settings,
                    size: 40,color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 5),
                      shape: BoxShape.circle,

                      image: DecorationImage(
                        image: _selectedImage !=null?
                        FileImage(_selectedImage!) as ImageProvider
                            : AssetImage("assets/wa2.jpg"),
                          fit: BoxFit.cover
                      )
                      // image: DecorationImage(
                      //   image: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                      //   fit: BoxFit.cover
                      // ),
                    ),
                  ),
                  onTap: (){
                    _pickImageFromGallary();
                  },
                ),
                SizedBox(height: 20),
                Text("Saran",
                style: TextStyle(
                  fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                ),
                ),
                SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Column(
                //       children: [
                //         Text("15",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                //         )
                //         ),
                //         Text("Podcast",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,
                //             )
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text("158",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                //             )
                //         ),
                //         Text("Followers",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,
                //             )
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text("25",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                //             )
                //         ),
                //         Text("Following",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,
                //             )
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("My Favorite's",
                  style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                  ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                   height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext con, index)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 4),
                          image: DecorationImage(
                            image: NetworkImage("data:image/png;base64,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"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle
                        ),
                      ),
                    );
                  }
                ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ListTile(
                //     tileColor: Colors.orangeAccent,
                //     leading: Icon(Icons.query_stats,color: Colors.white,size: 30,),
                //     title: Text("Stats",
                //     style: TextStyle(
                //       color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                //     ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30,width: 2),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.query_stats,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Stats",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.download,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Downloads",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.file_open_sharp,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Files",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.star,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Starred",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.history,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("History",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


