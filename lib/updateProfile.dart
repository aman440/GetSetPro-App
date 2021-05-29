import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskify/task_list/widgets/inputTextFields.dart';

// import '../constants.dart';
// import '../services/validation.dart';
// import '../widgets/clayContainerHighlight.dart';
import 'imageUpload.dart';
//import '../widgets/inputTextFields.dart';
// import '../widgets/submitBtn.dart';
// import 'home.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'profilePage';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController rollController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    /**
     * Load user data and feed it into the profile page for editing purpose.
     */
    return Scaffold(
      body: ModalProgressHUD(
        dismissible: false,
        inAsyncCall: _isLoading,
        child: SingleChildScrollView(
          child: Container(
            height: 1000,
            padding: EdgeInsets.only(left: 20, top: 40, right: 20),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: Image.asset('assets/images/background.jpg').image,
            //       colorFilter: new ColorFilter.mode(
            //           Colors.black.withOpacity(0.3), BlendMode.dstATop),
            //       fit: BoxFit.cover),
            // ),
            child: Form(
              key: _registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Update Profile',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        textStyle: TextStyle(fontSize: 25)),
                  ),
                  Spacer(flex: 2),
                  Container(
                    height: 150,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.blueGrey.shade200,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 100,
                              ),
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: ClayContainerHighlight(
                              onTap: () {
                                print('here');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        ImageUploader(),
                                  ),
                                );
                              },
                              iconData: CupertinoIcons.camera),
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  InputTextField(
                    // validator: (value) => Validator.validateName(
                    //   name: value,
                    // ),
                    textInputType: TextInputType.name,
                    textEditingController: nameController,
                    isPasswordField: false,
                    color: Colors.white,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  InputTextField(
                    isDisabled: true,
                    // validator: (value) => Validator.validateEmail(
                    //   email: value,
                    // ),
                    textEditingController: emailController,
                    isPasswordField: true,
                    color: Color(0xffF2F7FC),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  InputTextField(
                    // validator: (value) => Validator.validatePhone(
                    //   phone: value,
                    // ),
                    textInputType: TextInputType.phone,
                    textEditingController: phoneController,
                    isPasswordField: false,
                    color: Colors.white,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About Me',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  InputTextField(
                    // validator: (value) => Validator.validateAddress(
                    //   address: value,
                    // ),
                    textInputType: TextInputType.streetAddress,
                    textEditingController: addressController,
                    isPasswordField: false,
                    color: Colors.white,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  SubmitButton(
                    // onTap: () async {
                    //   if (_registerFormKey.currentState!.validate()) {
                    //     final auth = Provider.of<Auth>(context, listen: false);
                    //     setState(() {
                    //       _isLoading = true;
                    //     });
                    //     /**
                    //      * TODO:
                    //      * Update User profile info and then write the corresponding data into firebase.
                    //      */
                    //     setState(() {
                    //       _isLoading = false;
                    //     });
                    //     var result = true;
                    //     if (result) {
                    //       kShowSnackBar(context, 'Updated Successfully', true);
                    //       setState(() {});
                    //       //Navigator.popAndPushNamed(context, HomePage.id);
                    //       Navigator.pop(context);
                    //     } else {
                    //       kShowSnackBar(context,
                    //           'An error occured, please retry!', false);
                    //     }
                    //   }
                    // },
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Update',
                  ),
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Validator {
  static String? validateEmail({required String email}) {
    RegExp emailRegExp = RegExp(r"^[A-Za-z0-9._%+-]+@iiitkalyani.ac.in$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    }
    /*else if (!emailRegExp.hasMatch(email)) {
      return 'Enter your institute email';
    }*/

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  static String? validateName({required String name}) {
    RegExp emailRegExp = RegExp(r".*");

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    } else if (!emailRegExp.hasMatch(name)) {
      return 'Please enter a valid name';
    }

    return null;
  }

  static String? validatePhone({required String phone}) {
    RegExp emailRegExp = RegExp(
        r"(\+?( |-|\.)?\d{1,2}( |-|\.)?)?(\(?\d{3}\)?|\d{3})( |-|\.)?(\d{3}( |-|\.)?\d{4})");

    if (phone.isEmpty) {
      return 'Phone Number can\'t be empty';
    } else if (!emailRegExp.hasMatch(phone)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  static String? validateAddress({required String address}) {
    RegExp emailRegExp = RegExp(r"^.*$");

    if (address.isEmpty) {
      return 'About Me can\'t be empty';
    }
    /*else if (!emailRegExp.hasMatch(address)) {
      return 'Please enter a valid address or Hostel Room no.';
    }*/

    return null;
  }

// static String? validateRoll({required String roll}) {
//   RegExp emailRegExp = RegExp(r"[A-Z]{3}\/[0-9]{5}\/[0-9]{3}");

//   if (roll.isEmpty) {
//     return 'Roll no. can\'t be empty';
//   } else if (!emailRegExp.hasMatch(roll)) {
//     return 'Please enter a valid Institute Roll no';
//   }

//   return null;
// }
}

void kShowSnackBar(BuildContext context, String content, bool noError) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: noError ? Colors.green : Colors.redAccent,
    content: Text(
      content,
      style: TextStyle(color: Colors.white, letterSpacing: 0.5),
    ),
  ));
}

// class InputTextField extends StatefulWidget {
//   TextEditingController textEditingController;
//   Function(String) validator;
//   bool isPasswordField;
//   Color color;
//   TextInputType textInputType;
//   bool isDisabled;
//   InputTextField(
//       {required this.color,
//         required this.isPasswordField,
//         this.isDisabled = false,
//         this.textInputType = TextInputType.emailAddress,
//         required this.validator,
//         required this.textEditingController});
//   @override
//   _InputTextFieldState createState() => _InputTextFieldState();
// }

// class _InputTextFieldState extends State<InputTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return ClayContainer(
//         spread: 0.5,
//         borderRadius: 15,
//         color: widget.color,
//         child: widget.isPasswordField
//             ? PasswordTextFormField(
//           validator: widget.validator,
//           textEditingController: widget.textEditingController,
//           color: widget.color,
//           isDisabled: widget.isDisabled,
//         )
//             : NormalTextFormField(
//           textInputType: widget.textInputType,
//           validator: widget.validator,
//           textEditingController: widget.textEditingController,
//         ));
//   }
// }

// class NormalTextFormField extends StatelessWidget {
//   Function(String) validator;
//   TextEditingController textEditingController;
//   TextInputType textInputType;

//   NormalTextFormField(
//       {required this.textEditingController,
//         required this.textInputType,
//         required this.validator});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: textEditingController,
//       validator: (value) => validator(value!),
//       keyboardType: textInputType,
//       style: TextStyle(
//           color: Color(0xff6683AB),
//           fontWeight: FontWeight.w500,
//           fontStyle: FontStyle.normal),
//       cursorRadius: Radius.circular(4),
//       cursorColor: Color(0xff2F4858),
//       cursorHeight: 20,
//       decoration: InputDecoration(
//         border: new OutlineInputBorder(
//           borderRadius: new BorderRadius.circular(25.0),
//           borderSide: BorderSide.none,
//         ),
//         fillColor: Colors.black,
//       ),
//     );
//   }
// }

// class PasswordTextFormField extends StatefulWidget {
//   bool isDisabled;
//   Function(String) validator;
//   TextEditingController textEditingController;
//   Color color;
//   PasswordTextFormField(
//       {required this.color,
//         this.isDisabled = false,
//         required this.textEditingController,
//         required this.validator});
//   @override
//   _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
// }

// class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.only(right: 50),
//           child: TextFormField(
//             enabled: !widget.isDisabled,
//             validator: (value) => widget.validator(value!),
//             controller: widget.textEditingController,
//             keyboardType: TextInputType.visiblePassword,
//             obscuringCharacter: '*',
//             obscureText: widget.isDisabled ? false : !showPassword,
//             style: TextStyle(
//                 color: Color(0xff6683AB),
//                 fontWeight: FontWeight.w500,
//                 fontStyle: FontStyle.normal),
//             cursorRadius: Radius.circular(4),
//             cursorColor: Color(0xff2F4858),
//             cursorHeight: 20,
//             decoration: InputDecoration(
//               border: new OutlineInputBorder(
//                 borderRadius: new BorderRadius.circular(25.0),
//                 borderSide: BorderSide.none,
//               ),
//               fillColor: Colors.black,
//             ),
//           ),
//         ),
//         widget.isDisabled
//             ? Container()
//             : Container(
//           margin: EdgeInsets.all(10),
//           alignment: Alignment.centerRight,
//           child: InkWell(
//             onTap: () {
//               setState(() {
//                 showPassword = !showPassword;
//               });
//             },
//             child: ClayContainer(
//               color: Colors.white,
//               parentColor: widget.color,
//               depth: 2,
//               width: 40,
//               height: 40,
//               borderRadius: 15,
//               child: Center(
//                 child: !showPassword
//                     ? Text(
//                   '?',
//                   style: TextStyle(fontSize: 18),
//                 )
//                     : Icon(Icons.remove_red_eye_outlined),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// enum CurveType { concave, convex, none }

// class ClayContainer extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final Color? color;
//   final Color? parentColor;
//   final Color? surfaceColor;
//   final double? spread;
//   final Widget? child;
//   final double? borderRadius;
//   final BorderRadius? customBorderRadius;
//   final CurveType? curveType;
//   final int? depth;
//   final bool? emboss;

//   ClayContainer(
//       {this.child,
//         this.height,
//         this.width,
//         this.color,
//         this.surfaceColor,
//         this.parentColor,
//         this.spread,
//         this.borderRadius,
//         this.customBorderRadius,
//         this.curveType,
//         this.depth,
//         this.emboss});

//   Color _getAdjustColor(Color baseColor, amount) {
//     Map colors = {
//       "red": baseColor.red,
//       "green": baseColor.green,
//       "blue": baseColor.blue
//     };
//     colors = colors.map((key, value) {
//       if (value + amount < 0) return MapEntry(key, 0);
//       if (value + amount > 255) return MapEntry(key, 255);
//       return MapEntry(key, value + amount);
//     });
//     return Color.fromRGBO(colors["red"], colors["green"], colors["blue"], 1);
//   }

//   List<Color> _getFlatGradients(baseColor, depth) {
//     return [
//       baseColor,
//       baseColor,
//     ];
//   }

//   List<Color> _getConcaveGradients(baseColor, depth) {
//     return [
//       _getAdjustColor(baseColor, 0 - depth),
//       _getAdjustColor(baseColor, depth),
//     ];
//   }

//   List<Color> _getConvexGradients(baseColor, depth) {
//     return [
//       _getAdjustColor(baseColor, depth),
//       _getAdjustColor(baseColor, 0 - depth),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double? heightValue = height == null ? null : height;
//     final double? widthValue = width == null ? null : width;
//     final int? depthValue = depth == null ? 20 : depth;
//     Color? colorValue = color == null ? Color(0xFFf0f0f0) : color;
//     final Color parentColorValue =
//     parentColor == null ? colorValue! : parentColor!;
//     final Color? surfaceColorValue =
//     surfaceColor == null ? colorValue : surfaceColor;
//     final double spreadValue = spread == null ? 6 : spread!;
//     final bool embossValue = emboss == null ? false : emboss!;
//     BorderRadius? borderRadiusValue = borderRadius == null
//         ? BorderRadius.zero
//         : BorderRadius.circular(borderRadius!);

//     if (customBorderRadius != null) {
//       borderRadiusValue = customBorderRadius;
//     }
//     final CurveType curveTypeValue =
//     curveType == null ? CurveType.none : curveType!;

//     List<BoxShadow> shadowList = [
//       BoxShadow(
//           color: _getAdjustColor(
//               parentColorValue, embossValue ? 0 - depthValue! : depthValue),
//           offset: Offset(0 - spreadValue, 0 - spreadValue),
//           blurRadius: spreadValue),
//       BoxShadow(
//           color: _getAdjustColor(
//               parentColorValue, embossValue ? depthValue : 0 - depthValue!),
//           offset: Offset(spreadValue, spreadValue),
//           blurRadius: spreadValue)
//     ];

//     if (embossValue) shadowList = shadowList.reversed.toList();
//     if (embossValue)
//       colorValue = _getAdjustColor(colorValue!, 0 - depthValue! ~/ 2);
//     if (surfaceColor != null) colorValue = surfaceColorValue;

//     late List<Color?> gradientColors;
//     switch (curveTypeValue) {
//       case CurveType.concave:
//         gradientColors = _getConcaveGradients(colorValue, depthValue);
//         break;
//       case CurveType.convex:
//         gradientColors = _getConvexGradients(colorValue, depthValue);
//         break;
//       case CurveType.none:
//         gradientColors = _getFlatGradients(colorValue, depthValue);
//         break;
//     }

//     return Container(
//       height: heightValue,
//       width: widthValue,
//       child: child,
//       decoration: BoxDecoration(
//           borderRadius: borderRadiusValue,
//           color: colorValue,
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: gradientColors as List<Color>),
//           boxShadow: shadowList),
//     );
//   }
// }
