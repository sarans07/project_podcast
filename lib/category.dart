import 'package:flutter/material.dart';
class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {

  final items = [
    "Hot News",
    "Trending",
    "Motivation",
    "Technology",
    "Interview",
    "Society",
    "Education",
    "Sports",
    "Politics",
    "Arts",
    "Music",
    "Cinema",
    "History",
    "Crime",
    "Culture",
    "Drama",
    "Spirituality",
  ];

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
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Category :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 750,
              width: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 3),
                          borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent
                        ),
                        child: Center(
                          child: Text(items[index],
                          style: TextStyle(
                            fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
