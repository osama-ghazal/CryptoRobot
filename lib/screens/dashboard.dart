import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:StockVest/services/auth.dart';
// import 'package:StockVest/screens/update-profile.dart';
//import 'package:StockVest/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: true,
        title: Text('Home'),
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
              title: Text('Cypto News'),
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
                onTap: () =>
                    Navigator.popAndPushNamed(context, '/updateProfile')),
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
            height: 30.0,
            width: double.infinity,
            color: Colors.blueGrey[100],
          ),
          Container(
            height: 100.0,
            // alignment: Alignment.center,
            width: double.infinity,
            color: Colors.blueGrey[100],
            child: Image.asset('images/dashboard.png',
                height: 400, width: 100, fit: BoxFit.contain),
          ),
          Container(
            height: 50.0,
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.blueGrey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Crypto',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20.0,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Robot',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 40.0),
            child: Text(
              'WELCOME TO Crypto Robot',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
                fontSize: 20.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
