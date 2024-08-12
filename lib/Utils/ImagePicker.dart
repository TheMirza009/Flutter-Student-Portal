import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepicker {
  var selectedImage;

  Future pickImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);

    return pickedImage != null ? File(pickedImage.path) : null;
  }
}

class ImageTest extends StatefulWidget {
  const ImageTest({super.key});

  @override
  State<ImageTest> createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final pickedPhoto = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    print(pickedPhoto?.path);
                    setState(() {
                      selectedImage = File(pickedPhoto!.path);
                    });
                  },
                  child: const Text("Pick Image")),
            ),
            selectedImage != null
                ? Image.file(selectedImage!)
                : const Text("Please select an image")
          ],
        ),
      ),
    );
  }
}
