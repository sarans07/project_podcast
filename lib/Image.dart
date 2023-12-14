// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// class image extends StatefulWidget {
//   const image({super.key});
//
//   @override
//   State<image> createState() => _imageState();
// }
//
// class _imageState extends State<image> {
//   Unit8List? _file;
//   _selectImage()async{
//     return showDialog(context: context, builder: (BuildContext context)){
//       return SimpleDialog(
//         title: Text("Select one"),
//         children: [
//           SimpleDialogOption(
//             padding: EdgeInsets.all(8),
//             child: Text("Take a photo"),onPressed: ()async{
//               Navigator.pop(context);
//               Unit8List file = await pickImage(ImageSource.camera);
//               setState(() {
//                 _file
//               });
//           },
//           )
//         ],
//       )
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Stack(
//           children:[
//             CircleAvatar(
//               radius: 80,
//               backgroundColor: Colors.orangeAccent,
//               backgroundImage: NetworkImage("https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
//             ),
//             Positioned(
//                 bottom: 10,
//                 right: 10,
//                 child: Icon(Icons.add_a_photo),),
//           ]
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickerScreen(),
    );
  }
}

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  late File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _showImageDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Image'),
          content: SingleChildScrollView(
            child: Center(
              child: _imageFile == null
                  ? Text('No image selected.')
                  : Image.file(_imageFile!),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null
                ? Text('No image selected.')
                : Image.file(_imageFile!),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: Text('Pick from Gallery'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                  },
                  child: Text('Take a Picture'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _showImageDialog();
              },
              child: Text('Show Selected Image'),
            ),
          ],
        ),
      ),
    );
  }
}
