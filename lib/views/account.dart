import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person,
          size: 26.0,
        ),
        title: Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                suffixIcon: Icon(Icons.edit),
              )
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your phone number',
                suffixIcon: Icon(Icons.edit),
              ),
            ),
          ],
        )
      ),
    );
  }
}
