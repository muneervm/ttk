import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:ttk/src/configs/app_styles.dart';
import 'package:ttk/src/models/image_response.dart' as s;
import 'package:ttk/src/widgets/tiny/app_round_button.dart';

class ImagePickerWidget extends StatefulWidget {
  final ValueChanged<List<s.Image>> onSelect;
  final List<s.Image> selectedFile;
  final bool enableGallery;
  final bool allowMultiple;

  const ImagePickerWidget(
      {Key? key,
      required this.onSelect,
      this.selectedFile = const [],
      this.enableGallery = true,
      this.allowMultiple = false})
      : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final _picker = ImagePicker();
  List<s.Image> selectedImage = [];

  @override
  void initState() {
    selectedImage = widget.selectedFile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        selectedImage != null && selectedImage.length > 0
            ? _imagesList()
            : Container(),
        selectedImage.length == 0 || widget.allowMultiple
            ? GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (widget.enableGallery)
                    _showPickDialog(context);
                  else
                    _pickFromCamera();
                },
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: [8, 4],
                    color: Colors.grey.shade400,
                    radius: Radius.circular(
                        selectedImage != null && selectedImage.length > 0
                            ? 32
                            : 16),
                    padding: EdgeInsets.all(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                    child: Container(
                      height: selectedImage != null && selectedImage.length > 0
                          ? 30
                          : 120,
                      padding: EdgeInsets.all(3),
                      width: double.infinity,
                      child: selectedImage != null && selectedImage.length > 0
                          ? Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_camera_outlined,
                                  color: Colors.grey.shade400,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Add picture",
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_camera_outlined,
                                  color: Colors.grey.shade400,
                                  size: 70,
                                ),
                                Text(
                                  "Upload a picture",
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  _imagesList() {
    return Container(
      height: 120,
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: selectedImage.length,
        itemBuilder: (context, index) {
          return Container(
              height: 70,
              padding: EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Image.file(
                    File("${selectedImage[index].image}"),
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImage.removeAt(index);
                          });
                          widget.onSelect(selectedImage);
                        },
                        child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 18,
                            )),
                      ))
                ],
              ));
        },
      ),
    );
  }

  _showPickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              //height: 360,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.hint,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close))
                      ],
                    ),
                    Center(
                        child: SvgPicture.asset(
                      'assets/images/upload.svg',
                      height: 152,
                      width: 152,
                    )),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'Upload a photo',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.hint,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppRoundButton(
                      text: "Upload from gallery".toUpperCase(),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _pickImage("gallery");
                      },
                      padding: 1.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppRoundButton(
                      text: "take Photo".toUpperCase(),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _pickFromCamera();
                      },
                      padding: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _pickImage(String source) async {
    FilePickerResult? result = await FilePicker.pickFiles(
        allowMultiple: true, type: FileType.image);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;

      for (File file in files) {
        var fileName = basename(file.path);
        File newFile = File(file.path);
        final File localImage = await newFile.copy(
            '$path/${DateTime.now().millisecondsSinceEpoch.toString()}_$fileName');
        selectedImage.add(s.Image(id: "", image: localImage.path));
      }
    }

    setState(() {
      selectedImage = selectedImage;
    });

    widget.onSelect(selectedImage);
  }

  _pickFromCamera() async {
    print('picking image from camera');
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 60);

    if (image == null) return;

    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    var fileName = basename(image.path);
    File file = File(image.path);
    final File localImage = await file.copy('$path/$fileName');
    if (selectedImage == null) selectedImage = [];
    setState(() {
      selectedImage.add(s.Image(id: "", image: localImage.path));
    });
    print('picked image from camera');
    widget.onSelect(selectedImage);
  }
}
