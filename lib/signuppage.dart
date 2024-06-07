import 'package:emailauth/loginpage.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'authpage.dart';

class signUP extends StatefulWidget {
  const signUP({super.key});

  @override
  State<signUP> createState() => _signUPState();
}

class _signUPState extends State<signUP> {

  final TextEditingController reName = TextEditingController();
  final TextEditingController rePassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: reName,
              decoration: InputDecoration(
                hintText: 'Name',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: rePassWord,
              decoration: InputDecoration(
                hintText: 'Password',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                final message = await AuthService().registration(
                  email:reName.text,
                  password: rePassWord.text,
                );
                if (message!.contains('Success')) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const homePage()));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ));
              },
              child: Text("ok"),
            ),
          ),
        ],
      ),
    );
  }
}
