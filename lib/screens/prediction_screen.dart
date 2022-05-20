// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:StockVest/services/auth.dart';
import 'package:StockVest/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart' as firebase_core;

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class Item {
  Item(this.name);
  final String name;
}

class _PredictionScreenState extends State<PredictionScreen> {
  final AuthService _auth = AuthService();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref('images/graph1.png');

  Item selectedDays;
  Item selectedCoin;
  Item selectedTemp;

  String confirmDate = '';
  String predictMessage = '';
  String numberOfDays = '';
  int numDays;
  String selectedCoinn = '';
  String tempPrice = '';
  createProgressIndicator() {
    return CircularProgressIndicator();
  }

  List<Item> tempList;

  List<Item> days = <Item>[
    Item(
      '30',
    ),
    Item(
      '60',
    ),
    Item(
      '90',
    ),
  ];
  List<Item> coins = <Item>[
    Item(
      'BTC',
    ),
    Item(
      'XRM',
    ),
    Item(
      'ETH',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: true,
        title: Text('Crypto Prediction'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
                child: Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.home),
                title: Text('Home'),
                onTap: () => Navigator.popAndPushNamed(context, '/dashboard')),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.chartBar),
                title: Text('Crypto Prediction'),
                onTap: () => Navigator.popAndPushNamed(context, '/prediction')),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.newspaper),
              title: Text('Crypto Market News'),
              onTap: () => Navigator.popAndPushNamed(context, '/marketNews'),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.guilded),
              title: Text('Investment Tips'),
              onTap: () =>
                  Navigator.popAndPushNamed(context, '/investmentTips'),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.penAlt),
              title: Text('Update Profile'),
              onTap: () => Navigator.popAndPushNamed(context, '/updateProfile'),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.idCard),
              title: Text('Contact Us'),
              onTap: () => Navigator.popAndPushNamed(context, '/contactUs'),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.trash),
              title: Text('Delete Account'),
              onTap: () => Navigator.popAndPushNamed(context, '/deleteAccount'),
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.signOutAlt),
                title: Text('Sign Out'),
                onTap: () async {
                  await _auth.signOutFirebase();
                  Navigator.popAndPushNamed(context, '/login');
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Image.asset(
                'images/data-analyze.jpg', //Image.asset('images/data-analyze.jpg',
                width: double.infinity,
                height: 200),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'SELECT THE COIN',
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              )),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: DropdownButton<Item>(
              hint: Text("Select Coin"),
              value: selectedCoin,
              onChanged: (Item value) {
                setState(() {
                  predictMessage = '';

                  selectedCoin = value;
                });
              },
              items: coins.map((Item coins) {
                return DropdownMenuItem<Item>(
                  value: coins,
                  onTap: () {
                    selectedCoinn = coins.name.toString();
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        coins.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                'SELECT THE NUMBER OF DAYS',
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              )),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            child: DropdownButton<Item>(
              hint: Text("Select Days"),
              value: selectedDays,
              onChanged: (Item value) {
                setState(() {
                  predictMessage = '';

                  selectedDays = value;
                });
              },
              items: days.map((Item days) {
                return DropdownMenuItem<Item>(
                  value: days,
                  onTap: () {
                    numberOfDays = days.name.toString();
                    numDays = int.parse(numberOfDays);
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        days.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: FlatButton(
                color: Colors.blueGrey[900],
                child: Text('PREDICT', style: buttonStyle),
                onPressed: () async {
                  print('');

                  // print(companyName);

                  // print(predictMessage);
                }),
          ),
        ]),
      ),
    );
  }
}
