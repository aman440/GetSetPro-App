import 'dart:io';
import 'dart:ui';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart' as firebase_core;
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/clay_containers.dart';

// import '../constants.dart';
// import '../views/tabs/user.dart';
// import 'submitBtn.dart';


enum AppState {
  free,
  picked,
}

String text = 'Upload';

class ImageUploader extends StatefulWidget {
  static String id = 'imageUpload';

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  late AppState state;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    state = AppState.free;
  }

  void showSnackBar(BuildContext context, String content, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: isError ? Colors.green : Colors.redAccent,
      content: Text(
        content,
        style: TextStyle(color: Colors.white, letterSpacing: 0.5),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, top: 40, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(
              //     image: Image.asset('assets/images/background.jpg').image,
              //     colorFilter: new ColorFilter.mode(
              //         Colors.black.withOpacity(0.3), BlendMode.dstATop),
              //     fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Text(
                  'Pick an image',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    textStyle: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 200,
                    width: 200,
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade200,
                        child: imageFile != null
                            ? Image.file(imageFile!,
                                height: 200, width: 200, fit: BoxFit.fill)
                            : Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 100,
                              ),
                      ),
                    )),
                SizedBox(height: 50),
                Text(
                  'Select an image source',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.blueGrey[400],
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _pickImage(ImageSource.camera);
                        },
                        child: FrostedGlassUserInfo(
                          title: 'Camera',
                          subtitle: '',
                          iconData: CupertinoIcons.camera_fill,
                          showActionButton: true,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: FrostedGlassUserInfo(
                          color: Colors.pinkAccent,
                          title: 'Gallery',
                          subtitle: '',
                          iconData: CupertinoIcons.photo,
                          showActionButton: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SubmitButton(text: text, onTap: (){
                  Navigator.pop(context);
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      sleep(Duration(milliseconds: 500));
      _cropImage();
    }
  }

  Future<Null> _cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile!.path,
        androidUiSettings: AndroidUiSettings(
            // hideBottomControls: true,
            toolbarTitle: 'Adjust picture',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Adjust picture',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.picked;
      });
    }
  }

//   Future<void> uploadImage() async {
//     // bool result = false;
//     firebase_storage.FirebaseStorage storage =
//         firebase_storage.FirebaseStorage.instance;
//     if (imageFile != null) {
//       firebase_storage.UploadTask task = storage
//           .ref()
//           .child('dp')
//           .child(FirebaseAuth.instance.currentUser!.email
//                   .toString()
//                   .split('@')[0] +
//               '.jpg')
//           .putFile(imageFile!);
//       task.snapshotEvents.listen(
//           (firebase_storage.TaskSnapshot snapshot) async {
//         text = 'Uploading';
//         var imgUrl = await snapshot.ref.getDownloadURL();
//       }, onError: (e) {
//         // The final snapshot is also available on the task via `.snapshot`,
//         // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
//         print(task.snapshot);
//
//         if (e.code == 'permission-denied') {
//           print('User does not have permission to upload to this reference.');
//         }
//       });
//       try {
//         await task;
//         setState(() {
//           text = 'Uploaded';
//         });
//         showSnackBar(context, 'Successfully updated!', true);
//         // final String path = await getApplicationDocumentsDirectory().path;
//
// // copy the file to a new path
//         // final File newImage = await imageFile!.copy('$path/image1.png');
//       } on firebase_core.FirebaseException catch (e) {
//         if (e.code == 'permission-denied') {
//           print('User does not have permission to upload to this reference.');
//         }
//         showSnackBar(context, 'Error updating profile picture', false);
//         // return false;
//       }
//     }
//
//     Navigator.pop(context);
//   }
}

class FrostedGlassUserInfo extends StatelessWidget {
  Color color;
  String title;
  IconData iconData;
  bool showActionButton;
  String subtitle;
  FrostedGlassUserInfo(
      {Key? key,
      required this.color,
      required this.subtitle,
      required this.title,
      this.iconData = CupertinoIcons.arrow_up,
      this.showActionButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      parentColor: Colors.white10,
      height: 100,
      borderRadius: 20,
      color: color,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: showActionButton
                ? EdgeInsets.only(left: 15, right: 20)
                : EdgeInsets.all(8),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200.withOpacity(0.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // showActionButton
              //     ? MainAxisAlignment.spaceAround
              //     : MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    subtitle == ''
                        ? Container()
                        : SizedBox(
                            height: 10,
                          ),
                    subtitle == ''
                        ? Container()
                        : Text(
                            subtitle,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.blueGrey[400],
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                  ],
                ),
                showActionButton ? Spacer() : Container(),
                showActionButton
                    ? ClayContainerHighlight(
                        isSpreadAllowed: false, iconData: iconData)
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClayContainerHighlight extends StatelessWidget {
  Function? onTap;
  bool isSpreadAllowed;
  IconData iconData;
  ClayContainerHighlight(
      {required this.iconData, this.onTap, this.isSpreadAllowed = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: ClayContainer(
          spread: isSpreadAllowed ? null : 0,
          color: Colors.white,
          parentColor: Color(0xffF2F7FC),
          depth: 2,
          width: 40,
          height: 40,
          borderRadius: 15,
          child: Icon(
            iconData,
            color: Colors.blueGrey,
          )),
    );
  }
}

class SubmitButton extends StatefulWidget {
  double height;
  RichText? richText;
  String subtitle;
  String text;
  bool isActionEnabled;
  bool isNumberEnabled;
  int number;
  Function() onTap;
  Color? pColor;
  Color? sColor;

  SubmitButton(
      {required this.text,
      this.height = 60,
      this.subtitle = '',
      this.richText,
      this.isActionEnabled = false,
      this.number = 0,
      this.isNumberEnabled = false,
      required this.onTap,
      this.pColor,
      this.sColor});

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      curveType: CurveType.convex,
      parentColor: widget.sColor ?? Color(0xffF6FAFE),
      color: widget.pColor ?? Color(0xff2F4858),
      height: widget.subtitle != '' ? 80 : widget.height,
      borderRadius: 15,
      width: double.infinity,
      child: widget.isActionEnabled
          ? Padding(
              padding: widget.subtitle == ''
                  ? EdgeInsets.symmetric(horizontal: 20.0)
                  : EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.richText == null
                          ? Text(
                              widget.text,
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            )
                          : Container(
                              padding: EdgeInsets.only(right: 40),
                              child: widget.richText!,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(),
                            ),
                      widget.subtitle != ''
                          ? SizedBox(
                              height: 5,
                            )
                          : Container(),
                      widget.subtitle != ''
                          ? Padding(
                              padding: EdgeInsets.only(right: 35.0),
                              child: Text(widget.subtitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.abel(
                                      fontSize: 14,
                                      color: Colors.blueGrey.shade700)),
                            )
                          : Container()
                    ],
                  ),
                  // Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: widget.isNumberEnabled
                        ? ClayContainer(
                            spread: 0,
                            color: Colors.pinkAccent.shade100,
                            parentColor: Colors.white,
                            depth: 2,
                            width: 40,
                            height: 40,
                            borderRadius: 15,
                            child: Center(
                              child: Text(
                                widget.number.toString(),
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : ClayContainerHighlight(
                            iconData: CupertinoIcons.chevron_forward),
                  )
                ],
              ),
            )
          : TextButton(
              onPressed: widget.onTap,
              child: Text(
                widget.text,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
    );
  }
}
