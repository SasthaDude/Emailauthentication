import 'package:emailauth/loginpage.dart';
import 'package:emailauth/signuppage.dart';
import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context) => loginPage()));
            },
                child: Text("Login"),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder:(context) => signUP()));
            },
                child: Text("SignUP"),
            ),
          ],
        ),
      ),
    );
  }
}
