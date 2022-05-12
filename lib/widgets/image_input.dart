import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  const ImageInput({
    required this.onSelectImage,
    Key? key,
  }) : super(key: key);
  final Function onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  var _storedImage = File('');

  XFile? imageFile;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    imageFile = await picker.pickImage(
        source: ImageSource.camera, maxWidth: 600);
    if (imageFile!.path.isEmpty) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    final saveImage = await imageFile!.saveTo('${appDir.path}/$fileName');
    widget.onSelectImage(saveImage);
    //widget.onSelectImage(await imageFile.copy('${appDir.path}/$fileName'));
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            //color: Colors.black12,
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
            ),
            alignment: Alignment.center,
            child: _storedImage.path.isNotEmpty
                ? Image.file(
                    _storedImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : const Text(
                    'No image taken',
                    textAlign: TextAlign.center,
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextButton.icon(
              label: const Text('Take Picture'),
              onPressed: _takePicture,
              icon: const Icon(Icons.camera),
            ),
          ),
        ],
      );
}
