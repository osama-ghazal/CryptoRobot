import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:StockVest/services/auth.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: true,
        title: Text('Contact Us'),
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
              title: Text('Crypto News'),
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
        child: Column(
          children: [
            Container(
              height: 30.0,
              width: double.infinity,
              color: Colors.blueGrey[100],
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              color: Colors.blueGrey[100],
              child: Image.asset('images/mail.png',
                  height: 400, width: 100, fit: BoxFit.contain),
            ),
            Container(
              height: 50.0,
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.blueGrey[100],
              child: Text(
                'NEED TO CONTACT US?',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 20.0,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text(
                'Facebook',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/osamaFB');
                  },
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.facebook),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Osama Ghazal',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/alaaFB');
                    },
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.facebook),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Alaa Zaid',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 10),
              child: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.envelope),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'osamaghazal@gmail.com',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(FontAwesomeIcons.envelope),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        'alaazaid@gmail.com',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 10),
              child: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.phoneAlt),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          '+972 597 528821',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.phoneAlt),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        child: Text(
                          '+972 597 528821',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
