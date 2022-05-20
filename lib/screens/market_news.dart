import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:StockVest/services/auth.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:newsapi/newsapi.dart';

class MarketNews extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        automaticallyImplyLeading: true,
        title: Text('Market News'),
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
      body: WebView(
        initialUrl:
            'https://www.google.com/search?q=psx+news&source=lnms&tbm=nws&sa=X&ved=2ahUKEwjMvbqVsJTtAhW4TBUIHS-PBw4Q_AUoAXoECAwQAw&biw=1474&bih=794',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
