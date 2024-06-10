import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/util/app_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

class ImagePickerContainer extends StatefulWidget {
  final VoidCallback onImageUpload;

  ImagePickerContainer({Key? key, required this.onImageUpload})
      : super(key: key);

  @override
  _ImagePickerContainerState createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  XFile? _imageFile; // Stores the selected image file

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
        widget.onImageUpload(); // Call the onImageUpload callback
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show a dialog to choose between camera and gallery
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Choose Image Source'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Ionicons.camera),
                      title: Text('Camera'),
                      onTap: () {
                        _pickImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Ionicons.image),
                      title: Text('Gallery'),
                      onTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: _imageFile == null
              ? Border.all(
                  width: 0,
                  color:
                      Colors.grey) // Apply the border when no image is selected
              : null, // No border when an image is selected
        ),
        child: _imageFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  radius: 100,
                  child: Image.file(
                    File(_imageFile!.path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              )
            : CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                radius: 100,
                child: SvgPicture.asset(
                  'assets/svg/capture.svg',
                ),
              ),
      ),
    );
  }
}
