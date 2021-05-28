import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.lightBlue,
      statusBarIconBrightness: Brightness.light));
  runApp(App());
}

// class App extends StatelessWidget {
//   // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//               child: Container(
//                   height: 100,
//                   width: MediaQuery.of(context).size.width,
//                   child: Text('An Unexpected Error occured! :(')));
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           return MyApp();
//         }

//         return Center(
//             child: Container(
//                 height: 100, width: 100, child: CircularProgressIndicator()));
//       },
//     );
//   }
// }
