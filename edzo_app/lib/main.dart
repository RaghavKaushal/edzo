import 'package:edzo_app/pages/auth-screen.dart';
import 'package:edzo_app/pages/intro_screen.dart';
import 'package:edzo_app/provider/user.dart';
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
                '/userinfo': (BuildContext context) => UserInfo(),
                '/insights': (BuildContext context) => InsightsPage(),
                '/gymoffer': (BuildContext context) => GymOfferPage(),
                '/goal': (BuildContext context) => GoalPage(),
                '/gymservices': (BuildContext context) => GymOfferPage(),
                '/foodpref': (BuildContext context) => FoodPref(),
              }),
        ));
  }
}
