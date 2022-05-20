import 'package:flutter/material.dart';
import 'screens/get_started.dart';
import 'screens/login.dart';
import 'screens/registration.dart';
import 'screens/forgot_password.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/dashboard.dart';
import 'screens/prediction_screen.dart';
import 'screens/investment_tips.dart';

import 'screens/contact-us.dart';
import 'screens/update-profile.dart';
import 'screens/market_news.dart';
import 'screens/osamaFB.dart';
import 'screens/AlaaFB.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'screens/delete-account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await firebase_core.Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GetStarted(),
        '/login': (context) => Login(),
        '/home': (context) => Dashboard(),
        '/register': (context) => Register(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/dashboard': (context) => Dashboard(),
        '/prediction': (context) => PredictionScreen(),
        '/investmentTips': (context) => InvestmentTips(),
        '/updateProfile': (context) => UpdateProfile(),
        '/contactUs': (context) => ContactUs(),
        '/marketNews': (context) => MarketNews(),
        '/osamaFB': (context) => osamaFB(),
        '/alaaFB': (context) => AlaaFB(),
        '/deleteAccount': (context) => DeleteProfile(),
      },
    );
  }
}
