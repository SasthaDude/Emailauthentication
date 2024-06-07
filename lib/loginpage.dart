import 'package:emailauth/Homepage.dart';
import 'package:flutter/material.dart';

import 'authpage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController nAme = TextEditingController();
  final TextEditingController pAssWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nAme,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pAssWord,
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
                final message = await AuthService().login(
                  email:nAme.text,
                  password: pAssWord.text,
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
