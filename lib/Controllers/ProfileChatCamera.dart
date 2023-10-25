import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  final CameraController controller;
  final Function() onCapturePressed;

  CameraScreen(this.controller, this.onCapturePressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Capture a photo when the button is pressed
          onCapturePressed();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}