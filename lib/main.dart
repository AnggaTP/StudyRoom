import 'package:flutter/material.dart';
import 'package:study_room/Pages/login.dart';
import 'package:study_room/Pages/splashscreen.dart';
import 'package:study_room/states/currentUsers.dart';
import 'Pages/createRoom.dart';
import 'Pages/homepage.dart';
import 'Pages/signin.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'states/root.dart';
import 'Pages/chatroom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => Root(),
          //'/splash':(context) => SplashPage(),
          '/login': (context) => LogInPage(),
          '/signin': (context) => SignInPage(),
          '/home': (context) => HomePage(),
          '/createroom': (context) => createRoom(),
          '/chat':(context) => ChatRoom(),
        },
      ),
    );
  }
}
