import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';
import '../provider/user.dart';

class GymInfo extends StatefulWidget {
  final gymName;
  final userID;
  GymInfo(this.gymName, this.userID);
  @override
  _GymInfoState createState() => _GymInfoState(gymName);
}

class _GymInfoState extends State<GymInfo> {
  final gymName;
  final userID;
  _GymInfoState(this.gymName, {this.userID});
  var _savedUser = User(
      id: null,
      age: null,
      sex: '',
      contact: null,
      username: '', //name previously
      chest: null,
      email: '',
      forearm: null,
      height: null,
      hip: null,
      shoulder: null,
      waist: null,
      weight: null);
  var _isInit = true;
  var _initValues = {
    'username': '',
    'email': '',
    'age': '',
    'sex': '',
    'contact': '',
    'height': '',
    'weight': '',
    'chest': '',
    'forearm': '',
    'shoulder': '',
    'hip': '',
    'waist': '',
  };

  @override
  void didChangeDependencies() {
    if (userID != null) {
      _savedUser = Provider.of<Users>(context, listen: false).findById(userID);
      _initValues = {
        'username': _savedUser.username,
        'email': _savedUser.email,
        'age': _savedUser.age.toString(),
        'sex': _savedUser.sex,
        'contact': _savedUser.contact.toString(),
        'height': _savedUser.height.toString(),
        'weight': _savedUser.weight.toString(),
        'chest': _savedUser.chest.toString(),
        'forearm': _savedUser.forearm.toString(),
        'shoulder': _savedUser.shoulder.toString(),
        'hip': _savedUser.hip.toString(),
        'waist': _savedUser.waist.toString()
      };
      super.didChangeDependencies();
    }

    void _sendRequest() {
      Provider.of<Users>(context).adduserDetails(_savedUser);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(gymName),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text(
                  'Noting but some random lorem ipsum comming in 3....2.....1 shbyhlsbdjbdHJBDhdfbgkdrb v,hDbfvj,sd fbhjgsv fg,msd vhjd vevfutlsc dksj vlwfkdtYWAKtcdmndfbeghckchjsdVufd,jfhvsdjc dc SfdyuvctysfcdbsdvhgDVckhdvcgdfg')
            ],
          ),
        ),
        bottomSheet: RaisedButton(
          onPressed: () {},
          child: Text('Request to join'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
