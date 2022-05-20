import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:StockVest/services/auth.dart';
import 'package:StockVest/constants.dart';

class DeleteProfile extends StatefulWidget {
  @override
  _DeleteProfileState createState() => _DeleteProfileState();
}

class _DeleteProfileState extends State<DeleteProfile> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final User user = FirebaseAuth.instance.currentUser;

  String error = '';
  String passwordCheck = '';
  String updatePassword = '';
  String password = '';
  String email = '';
  String formEmail = '';
  String oldPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: true,
        title: Text('Delete Account'),
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
        child: Column(children: [
          Container(
            height: 30.0,
            width: double.infinity,
            color: Colors.blueGrey[100],
          ),
          Container(
            height: 100.0,
            width: double.infinity,
            color: Colors.blueGrey[100],
            child: Image.asset('images/delete-i-2.png',
                height: 400, width: 100, fit: BoxFit.contain),
          ),
          Container(
            height: 50.0,
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.blueGrey[100],
            child: Text(
              'DELETE YOUR ACCOUNT',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20.0,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Enter an email!";
                        } else {
                          email = val;
                          formEmail = val;
                          return null;
                        }
                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          icon: Icon(Icons.mail), hintText: 'Confirm Email')),
                ),
                Container(
                  width: 300,
                  child: TextFormField(
                      obscureText: true,
                      validator: (val) {
                        if (val.length < 6) {
                          return "Please enter at least 6 characters!";
                        } else {
                          password = val;
                          return null;
                        }
                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Confirm Password')),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                      color: Colors.blueGrey[900],
                      child: Text('DELETE ACCOUNT', style: buttonStyle),
                      onPressed: () async {
                        final snackBar = SnackBar(
                          duration: Duration(seconds: 10),
                          content:
                              Text('Matching credentials in the database!'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                        );

                        final snackBar2 = SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('Account successfully deleted!'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                        );

                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          EmailAuthProvider.credential(
                              email: 'email', password: 'password');

                          print(email);
                          print(password);
                          await _auth.loginWithEmailAndPassword(
                              email, password);
                          await user.delete();

                          if (email == null) {
                            error = 'Enter an email!';
                          }
                          if (password == null) {
                            error = 'Please enter valid credentials!';
                          } else {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar2);
                            Navigator.popAndPushNamed(context, '/login');
                          }
                        }
                      }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
