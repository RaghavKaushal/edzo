import 'package:edzo_app/widgets/gymSearch.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './my_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../widgets/calories_bar.dart';
import '../provider/auth.dart';
import './food_screen.dart';
import './exercise_screen.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

class UserwoGym extends StatefulWidget {
  final proteinIntake;
  UserwoGym({this.proteinIntake});
  @override
  _UserwoGymState createState() => _UserwoGymState(
        proteinIntake: proteinIntake,
      );
}

class _UserwoGymState extends State<UserwoGym>
    with SingleTickerProviderStateMixin {
  //SingeTickerProvider is used to have TabController
  final proteinIntake;
  _UserwoGymState({this.proteinIntake});
  double _value = 0.0;
  double _starval = 0.0;
  double rating = 10;
  // var total = proteinBar / 2700;
  // var totalBar = proteinBar;
  bool isAlotted = false;
  bool isScanned = false;
  bool isProteinNull = true;
  onChanged(double value, {double starval}) {
    setState(() {
      _value = value;
      _starval = starval;
      debugPrint(_value.toString());
    });
  }

  TabController _tabController;
  ScrollController _scrollViewController;
  TextEditingController customController = TextEditingController();

// USE NAVIGATOR.PUSHREPLACEMENTNAMED

//Creating alert dialogue
  Future<String> createAlertDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Change Trainer"),
            content: TextFormField(
              controller: customController,
              decoration:
                  InputDecoration(labelText: 'Please tell us the reason '),
            ),
            actions: <Widget>[
              SmoothStarRating(
                allowHalfRating: true,
                color: Colors.deepOrangeAccent,
                rating: rating,
                onRatingChanged: (v) {
                  rating = v;
                  setState(() {
                    _starval = rating.toDouble();
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 2, vsync: this);
    _scrollViewController = ScrollController();
  }

  //ADDED DISPOSE
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollViewController.dispose();
  }
  //SideDrawer For User with Alloted Gym

  Widget _buildSideDrawerWithGym(BuildContext context) {
    //ADDED FLEX JUST IN CASE IT OVERFLOWS
    // final userId = Provider.of<Users>(context).userId;
    return Drawer(
      child: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: 100,
                        alignment: Alignment.bottomLeft,
                        //  color: Colors.black,// you cannot provide both decorartion and decoration
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          image: _buildImage(),
                        ),
                        child: Text(
                          'MR. Raghav Kaushal',
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                AppBar(
                  automaticallyImplyLeading: false,
                  leading: ListTile(
                    title: Icon(Icons.label_important),
                    subtitle: Text(
                      'Notice',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  title: ListTile(
                    title: Icon(
                      Icons.mail_outline,
                    ),
                    subtitle: Text(
                      'Chat',
                      textAlign: TextAlign.center,
                    ),
                    // trailing: ListTile(
                    //   title: Icon(Icons.watch),
                    //   subtitle: Text('Recent'),
                    // ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('My Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_view_day),
                  title: Text('Summary'),
                ),
                ListTile(
                  leading: Icon(Icons.dashboard),
                  title: Text('Request a Plan'),
                ),
                ListTile(
                  onTap: () {
                    createAlertDialogue(context).then((onValue) {
                      SnackBar mySnackbar = SnackBar(
                        content: Text('Hello ${onValue}'),
                      );
                      Scaffold.of(context).showSnackBar(mySnackbar);
                    });
                  },
                  leading: IconButton(
                    icon: Icon(Icons.compare_arrows),
                    onPressed: () {},
                  ),
                  title: Text('Change Trainer'),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Help'),
                ),
                ListTile(
                  leading: Icon(Icons.thumb_up),
                  title: Text('Leave Feedback'),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {},
                  ),
                  title: Text('Leave Gym'),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.time_to_leave),
                    onPressed: () {},
                  ),
                  title: Text('Log out'),
                ),
              ],
            ),
          ],
          direction: Axis.vertical,
        ),
      ),
    );
  }

  //SIDE DRAWER ENDS

  // IMAGE VIEWER FOR NOT AUTH SIDE DRAWER
//THIS METHOD IS NOT USED AS THEN GRADIENT EFFECT WILL NOT BE SHOWN, USED IN SHOW ALERT METHOD
  DecorationImage _buildImage() {
    return DecorationImage(
      alignment: Alignment.topCenter,
      // fit: BoxFit.cover,
      image: AssetImage('assets/images/edzo_user.png'),
    );
  }

  //SIDE DRAWER FOR USER WITH NO GYM
  Widget _buildSideDrawerNoGym(BuildContext context) {
    var quantity;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: Container(
                // height: 200,
                // width: 200,
                child: Image(
                  //height: 200,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/edzo_user.png'),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0xFF915FB5),
                        const Color(0xFFCA436B)
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  //image: _buildImage()
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              selected: true,
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
                selected: false,
                leading: Icon(Icons.verified_user),
                title: Text('My Profile'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => MyProfile()));
                }),
            ListTile(
              leading: Icon(Icons.calendar_view_day),
              title: Text('Summary'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/summary');
              },
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SearchGym(),
                  ),
                );
              },
              leading: Icon(Icons.youtube_searched_for),
              title: Text('Join Gym'),
            ),
            // ListTile(
            //   onTap: () {
            //     Navigator.pushReplacementNamed(context, '/reminders');
            //   },
            //   leading: IconButton(
            //     icon: Icon(Icons.watch_later),
            //     onPressed: () {},
            //   ),
            //   title: Text('Reminders'),
            // ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
            ),
            ListTile(
              leading: Icon(
                (Icons.exit_to_app),
              ),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  //Water Container POPUP

  waterContainerPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                child: Container(
                  height: 600,
                  width: 300,
                  child: Row(
                    children: <Widget>[
                      ListView(
                        children: <Widget>[
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/bottle.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/bottle1L.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/glass.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/large_mud.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/Large_mug.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/pint.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/pitcher.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/small_mug.png'),
                            ),
                          ),
                          Container(
                            child: Image(
                              //height: 200,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/tumbler.png'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  double getProtein() {
    if (proteinIntake == null) {
      return 0;
    }
    return proteinIntake;
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildSideDrawerNoGym(context),
        // isAlotted
        //     ? _buildSideDrawerNoGym(context)
        //     : _buildSideDrawerWithGym(context),
        appBar: AppBar(
            //   leading: Icon(Icons.dehaze),
            ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            String quantity;
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   child: Slider(
                        //     value: _value,
                        //     onChanged: onChanged,
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: new LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 50,
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 2500,
                            percent: getProtein(),
                            //   percent: isProteinNull: 0 ? proteinIntake,

                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Protein',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            // Container(
                            //     width: 50,
                            //     child: Align(
                            //       alignment: Alignment.centerLeft,
                            //       child: Slider(
                            //         value: _value,
                            //         onChanged: onChanged,
                            //       ),
                            //     )),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 50,
                              child: LinearProgressIndicator(
                                value: _value,
                                semanticsLabel: 'Target',
                                semanticsValue: '2500/2700',
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.pinkAccent[200]),
                              ),
                            ),
                            Text(
                              'Fats',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            // Container(
                            //     width: 50,
                            //     child: Align(
                            //       alignment: Alignment.center,
                            //       child: Slider(
                            //         value: _value,
                            //         onChanged: onChanged,
                            //       ),
                            //     )),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 50,
                              child: LinearProgressIndicator(
                                value: _value,
                                semanticsLabel: 'Target',
                                semanticsValue: '2500/2700',
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.pinkAccent[200]),
                              ),
                            ),
                            //Text('10gm left'),
                            Text(
                              'Carbs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            // Container(
                            //     width: 50,
                            //     child: Align(
                            //       alignment: Alignment.bottomRight,
                            //       child: Slider(
                            //         value: _value,
                            //         onChanged: onChanged,
                            //       ),
                            //     )),
                            //Text('120gm left'),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: 50,
                              child: LinearProgressIndicator(
                                value: _value,
                                semanticsLabel: 'Target',
                                semanticsValue: '2500/2700',
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.pinkAccent[200]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Water Intake',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                Future<void> _result = await showDialog(
                                    context: context,
                                    builder: (_) => Container(
                                          width: 100,
                                          height: 200,
                                          color: Color(0xFFFF3333),
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '2L';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/bottle.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '1L';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/bottle1L.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '125mL';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/glass.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '1L';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/large_mud.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '500mL';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/Large_mug.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '500mL';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/pint.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '1.5L';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/pitcher.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '250mL';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/small_mug.png'),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  quantity = '330mL';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/tumbler.png'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: Container(
                                  //decoration: BoxDecoration(),
                                  color: Colors.green,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Glass',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text('quantity')
                                    ],
                                  )),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              '2L/5L',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Icon(Icons.arrow_drop_down),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                pinned: true,
                floating: true,
                forceElevated: boxIsScrolled,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text('Food'),
                    ),
                    Tab(
                      child: Text('Exercise'),
                    )
                  ],
                  controller: _tabController,
                ),
              )
            ];
          },
          controller: _scrollViewController,
          body: TabBarView(
            children: <Widget>[FoodScreen(), ExerciseScreen()],
            controller: _tabController,
          ),
        ));
  }
}

// SizedBox(
//   height: 60,
// ),
// Scaffold(
//   body: NestedScrollView(
//     controller: _scrollViewController,

//     body:

//   ),
// )
