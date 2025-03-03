import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hayah_app/views/result.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);
  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  var dio = Dio();
  File? selectedImage;
  final imagePicker = ImagePicker();
  late Map<String, dynamic> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Upload Image"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImage == null
                ? const Text('Please pick image to upload',
                    style: TextStyle(color: Colors.grey))
                : Image.file(selectedImage!, width: 300, height: 300),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                onPressed: () {
                  uploadImage();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ResultScreen(
                          status: result['Status'],
                          type: result['Type'],
                          description: result['Description'],
                        ),
                      ));
                },
                icon: const Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                label: const Text("Upload",
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImageFromGallery,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

// function to get image from the camera
  Future getImageByCamera() async {
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource
            .camera); // this line will allow us to access the camera and get the picture
    setState(() {
      // assign the image path to our image file
      selectedImage = File(pickedImage!.path);
    });
  }

// function to get image from gallery
  Future getImageFromGallery() async {
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      // assign the image path to our image file
      selectedImage = File(pickedImage!.path);
    });
  }

  // Upload Image to flask server
  uploadImage() async {
    var formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(selectedImage!.path)});

    var response = await dio
        .post("https://bb58-154-185-249-157.eu.ngrok.io/api/upload",
            data: formData)
        .then((value) {
      result = value.data;
    });
    debugPrint(response.toString());
  }
}
