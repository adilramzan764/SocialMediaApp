import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String imageUrl;

  ImageWidget(this.imageUrl);

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late Image image;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() {
    var storage = FirebaseStorage.instance;
    var imageRef = storage.ref().child(widget.imageUrl); // Use the correct path to your image in Firebase Storage

    // Get the download URL of the image
    imageRef.getDownloadURL().then((url) {
      // Set the image in the state once it's loaded
      setState(() {
        image = Image.network(url);
      });
    }).catchError((error) {
      // Handle any errors that occurred during the process
      print('Error loading image: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: image ?? CircularProgressIndicator(), // Show a loading indicator until the image is loaded
    );
  }
}
