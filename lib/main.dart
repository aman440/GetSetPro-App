import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/tabs.dart';
import 'services/auth.dart';
import 'task_list/models/task_data.dart';
import 'vedant_task/slidebar.dart';
import 'views/home.dart';
import 'views/login.dart';
import 'views/register.dart';
import 'views/space/home.dart';
import 'views/space/splash.dart';
import 'views/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Image.asset('assets/images/sloth.gif')));
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
        ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.id,
        routes: {
          AppContainer.id: (context) => AppContainer(),
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
