import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.home,
          size: 26.0,
        ),
        title: Text('Address'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Flat No./House No., Building No.',
                    suffixIcon: Icon(Icons.edit),
                  )
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Society/Apartment',
                    suffixIcon: Icon(Icons.edit),
                  )
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Area/Landmark',
                    suffixIcon: Icon(Icons.edit),
                  )
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: 'City',
                    suffixIcon: Icon(Icons.edit),
                  )
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                  decoration: InputDecoration(
                    hintText: 'PIN Code',
                    suffixIcon: Icon(Icons.edit),
                  )
              ),
            ],
          )
      ),
    );
  }
}
