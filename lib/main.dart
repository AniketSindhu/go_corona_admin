import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_corona_admin/methods/addPost.dart';
import 'package:go_corona_admin/pages/login.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go corona',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                  body: Center(
                      child: Text(
                'Error',
                style: TextStyle(color: Colors.red),
              )));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return AddPost();
            }
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }),
    );
  }
}
