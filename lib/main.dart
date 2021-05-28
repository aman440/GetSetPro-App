import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.lightBlue,
      statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
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
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'taskify',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
