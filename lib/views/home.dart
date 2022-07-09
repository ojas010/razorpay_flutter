import 'dart:io';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'account.dart';
import 'address.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Razorpay razorpay;

  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_gWTUXYM761KGVl",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Sample",
      "description": "Payment for product",
      "prefill": {"contact": "2323232323", "email": "thisisatest@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Payment Successful");
    Fluttertoast.showToast(msg: "Payment Successful");
  }

  void handlerErrorFailure() {
    print("Payment Failed");
    Fluttertoast.showToast(msg: "Payment Failed");
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Fluttertoast.showToast(msg: "External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 56.0,
            child: const DecoratedBox(
                decoration: const BoxDecoration(
              color: Colors.redAccent,
            )),
          ),
          SizedBox(
            height: 15.0,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 26.0,
            ),
            title: const Text('Account', style: TextStyle(fontSize: 18.0)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Account()),
              );
            },
          ),
          new Divider(
            thickness: 1.0,
            color: Colors.redAccent,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 26.0,
            ),
            title: const Text('Address', style: TextStyle(fontSize: 18.0)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Address()),
              );
            },
          ),
          new Divider(
            thickness: 1.0,
            color: Colors.redAccent,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 26.0,
            ),
            title: const Text('Logout', style: TextStyle(fontSize: 18.0)),
            onTap: () => exit(0),
          ),
        ],
      )),
      appBar: AppBar(
        title: Center(child: Text("")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Enter the amount"),
            ),
            SizedBox(height: 12),
            RaisedButton(
                color: Colors.blue,
                child: Text("Pay Now",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  openCheckout();
                })
          ],
        ),
      ),
    );
  }
}
