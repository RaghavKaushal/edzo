import 'package:edzo_app/models/user.dart';
import 'package:edzo_app/pages/auth-screen.dart';
import 'package:edzo_app/pages/intro_screen.dart';
import 'package:edzo_app/pages/search.dart';
import 'package:edzo_app/pages/user_wogym.dart';
import './pages/splash-screen.dart';
import 'package:edzo_app/provider/Users.dart';
import 'package:edzo_app/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/user_info.dart';
import './pages/med_cond.dart';
import './pages/gym_offer.dart';
import './pages/my_profile.dart';
import './pages/insights.dart';
import './pages/goal.dart';
import './pages/summary.dart';
import './pages/reminders.dart';
import './pages/foodpref.dart';
import 'package:provider/provider.dart';

// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Users>(
              builder: (ctx, auth, previousUser) => Users(
                  auth.token,
                  auth.userId,
                  previousUser == null ? [] : previousUser.userlist)),
          ChangeNotifierProvider(
            builder: (ctx) => User(),
          )
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
              title: 'Edzo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.pink,
              ),
              home: //Search(),
                  auth.isAuth
                      ? UserwoGym()
                      : FutureBuilder(
                          future: auth.tryAutoLogin(),
                          builder: (ctx, authResultSnapshot) =>
                              authResultSnapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? SplashScreen()
                                  : AuthScreen(),
                        ),
              routes: {
                // '/': (BuildContext context) => IntroScreenPage(),
                '/profile': (BuildContext context) => MyProfile(),
                '/intropage': (BuildContext context) => UserwoGym(),
                '/summary': (BuildContext context) => SummaryPage(),
                '/medcond': (BuildContext context) => MedicalCondition(),
                '/reminders': (BuildContext context) => RemindersPage(),
                '/userinfo': (BuildContext context) => UserInfo(auth.userId),
                '/insights': (BuildContext context) => InsightsPage(),
                '/gymoffer': (BuildContext context) => GymOfferPage(),
                '/goal': (BuildContext context) => GoalPage(),
                '/gymservices': (BuildContext context) => GymOfferPage(),
                '/foodpref': (BuildContext context) => FoodPref(),
              }),
        ));
  }
}
