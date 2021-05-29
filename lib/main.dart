import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:taskify/services/auth.dart';
import 'package:taskify/views/home.dart';
import 'package:taskify/views/login.dart';
import 'package:taskify/views/register.dart';
import 'package:taskify/views/space/home.dart';
import 'package:taskify/views/space/splash.dart';
import 'package:flutter/material.dart';
import 'package:taskify/vedant_task/slidebar.dart';
import 'package:taskify/views/splash.dart';

import 'models/tabs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text('An Unexpected Error occured! :(')));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()));
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final _firebaseAuthUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final _auth = Auth(firebaseAuth: _firebaseAuthUser);
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (context) => _auth,
        ),
        ChangeNotifierProvider<TabViews>(
          create: (context) => TabViews(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => HomePage(),
          SplashPage.id: (context) => SplashPage(),
          RegisterPage.id: (context) => RegisterPage(),
          LoginPage.id: (context) => LoginPage(),
          SpaceSplashPage.id: (context) => SpaceSplashPage(),
          SpaceHomePage.id: (context) => SpaceHomePage(),
        },
      ),
    );
  }
}
