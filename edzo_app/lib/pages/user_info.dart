import 'package:edzo_app/pages/insights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user.dart';
import '../provider/Users.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
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

  final _emailFN = FocusNode();

  final _contactFN = FocusNode();

  final _ageFN = FocusNode();

  final _sexFN = FocusNode();

  final _weightFN = FocusNode();

  final _heightFN = FocusNode();

  final _chestFN = FocusNode();

  final _shoulderFN = FocusNode();

  final _forearmFN = FocusNode();

  final _hipFN = FocusNode();

  final _waistFN = FocusNode();

// Addign global key to submit form data
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFN.dispose();
    _contactFN.dispose();
    _ageFN.dispose();
    _sexFN.dispose();
    _weightFN.dispose();
    _heightFN.dispose();
    _chestFN.dispose();
    _shoulderFN.dispose();
    _forearmFN.dispose();
    _hipFN.dispose();
    _waistFN.dispose();

    super.dispose();
  }

  void passingData(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InsightsPage(
          id: _savedUser.id,
          height: _savedUser.height,
          weight: _savedUser.weight,
          age: _savedUser.age,
          sex: _savedUser.sex,
        ),
      ),
    );
  }

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
    if (_isInit) {
      final userID = ModalRoute.of(context).settings.arguments as String;
      print(userID.toString() + ' userID');
      if (userID != null) {
        _savedUser =
            Provider.of<Users>(context, listen: false).findById(userID);

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
      }
      // final da = Provider.of<Users>(context).fetchandssetuser();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    //adding a validator
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    // trigger save function on every textformfield
    _form.currentState.save();
    if (_savedUser.id != null) {
      Provider.of<Users>(context, listen: false)
          .updateUser(_savedUser.id, _savedUser);
    } else if (_savedUser.id == null) {
      Provider.of<Users>(context).addUser(_savedUser);
    }

    passingData(context);
  }

  @override
  Widget build(BuildContext context) {
    //final users = userData._savedUser;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
        title: Text('Basic Information'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              passingData(context);
            },
          )
        ],
        // bottom: AppBar(
        //   backgroundColor: Colors.pinkAccent,
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.accessibility),
        //       onPressed: () {
        //         Provider.of<Users>(context)
        //             .updateUser(_savedUser.id, _savedUser);
        //       },
        //     )
        //   ],
        // ),
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  initialValue: _initValues['username'],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Name', icon: Icon(Icons.people)),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: val,
                        age: _savedUser.age,
                        //sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: _savedUser.height,
                        hip: _savedUser.hip,
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  //CAN ADD VALIDATOR
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please provide your name';
                    }
                    return null;
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: TextFormField(
                    initialValue: _initValues['email'],
                    focusNode: _emailFN,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email ID'),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_contactFN);
                    },
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please provide an Email';
                      }
                      String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                          "\\@" +
                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                          "(" +
                          "\\." +
                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                          ")+";
                      RegExp regExp = new RegExp(p);
                      if (regExp.hasMatch(val)) {
                        return null;
                      }
                      return 'Email provided isn\'t valid.Try another email address';
                    },
                    onSaved: (val) {
                      _savedUser = User(
                          username: _savedUser.username,
                          age: _savedUser.age,
                          // sex: _savedUser.sex,
                          chest: _savedUser.chest,
                          contact: _savedUser.contact,
                          email: val,
                          forearm: _savedUser.forearm,
                          height: _savedUser.height,
                          hip: _savedUser.hip,
                          shoulder: _savedUser.shoulder,
                          id: _savedUser.id,
                          waist: _savedUser.waist,
                          weight: _savedUser.weight);
                    },
                  ),
                ),
                TextFormField(
                  initialValue: _initValues['contact'],
                  focusNode: _contactFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Contact', icon: Icon(Icons.contact_phone)),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_ageFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        // sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: int.parse(val),
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: _savedUser.height,
                        hip: _savedUser.hip,
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please provide your contact number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    initialValue: _initValues['age'],
                    focusNode: _ageFN,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Age', icon: Icon(Icons.accessibility)),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_weightFN);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide your age';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _savedUser = User(
                          username: _savedUser.username,
                          age: int.parse(val),
                          // sex: _savedUser.sex,
                          chest: _savedUser.chest,
                          contact: _savedUser.contact,
                          email: _savedUser.email,
                          forearm: _savedUser.forearm,
                          height: _savedUser.height,
                          hip: _savedUser.hip,
                          shoulder: _savedUser.shoulder,
                          id: _savedUser.id,
                          waist: _savedUser.waist,
                          weight: _savedUser.weight);
                    }),
                // TextFormField(
                //     initialValue: _initValues['sex'],
                //     focusNode: _sexFN,
                //     decoration: InputDecoration(
                //         labelText: 'Sex', icon: Icon(Icons.accessibility)),
                //     onFieldSubmitted: (_) {
                //       FocusScope.of(context).requestFocus(_weightFN);
                //     },
                //     validator: (value) {
                //       if (value.isEmpty) {
                //         return 'Please provide your sex';
                //       }
                //       if (value == 'M' ||
                //           value == 'm' ||
                //           value == 'F' ||
                //           value == 'f') {
                //         return null;
                //       }
                //       return 'Please give a valid answer';
                //     },
                //     onSaved: (val) {
                //       _savedUser = User(
                //           name: _savedUser.name,
                //           age: _savedUser.age,
                //           sex: val,
                //           chest: _savedUser.chest,
                //           contact: _savedUser.contact,
                //           email: _savedUser.email,
                //           forearm: _savedUser.forearm,
                //           height: _savedUser.height,
                //           hip: _savedUser.hip,
                //           shoulder: _savedUser.shoulder,
                //           id: _savedUser.id,
                //           waist: _savedUser.waist,
                //           weight: _savedUser.weight);
                //     }),
                TextFormField(
                  initialValue: _initValues['weight'],
                  focusNode: _weightFN,
                  keyboardType: TextInputType.number,
                  onSaved: (val) {
                    _savedUser = User(
                      username: _savedUser.username,
                      age: _savedUser.age,
                      // sex: _savedUser.sex,
                      chest: _savedUser.chest,
                      contact: _savedUser.contact,
                      email: _savedUser.email,
                      forearm: _savedUser.forearm,
                      height: _savedUser.height,
                      hip: _savedUser.hip,
                      shoulder: _savedUser.shoulder,
                      id: _savedUser.id,
                      waist: _savedUser.waist,
                      weight: double.parse(val),
                    );
                  },
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    icon: Icon(
                      Icons.account_balance_wallet,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_heightFN);
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please provide your weight';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _initValues['height'],
                  focusNode: _heightFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Height',
                    icon: Icon(Icons.contact_phone),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_chestFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        //   sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: double.parse(val),
                        hip: _savedUser.hip,
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Please provide your height';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _initValues['chest'],
                  focusNode: _chestFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Chest',
                    icon: Icon(Icons.contact_phone),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_shoulderFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        // sex: _savedUser.sex,
                        chest: double.parse(val),
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: _savedUser.height,
                        hip: _savedUser.hip,
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  // validator: (val) {
                  //   if (val.isEmpty) {
                  //     return 'Please provide your chest';
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  initialValue: _initValues['shoulder'],
                  focusNode: _shoulderFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Shoulder', icon: Icon(Icons.ac_unit)),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_forearmFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        //  sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: _savedUser.height,
                        hip: _savedUser.hip,
                        shoulder: double.parse(val),
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  // validator: (val) {
                  //   if (val.isEmpty) {
                  //     return 'Please provide your shoulder';
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  initialValue: _initValues['forearm'],
                  focusNode: _forearmFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Forearm',
                    icon: Icon(Icons.contact_phone),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_hipFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        // sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: double.parse(val),
                        height: _savedUser.height,
                        hip: _savedUser.hip,
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  // validator: (val) {
                  //   if (val.isEmpty) {
                  //     return 'Please provide your forearm';
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  initialValue: _initValues['hip'],
                  focusNode: _hipFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Hip',
                    icon: Icon(Icons.contact_phone),
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_waistFN);
                  },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        //  sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: _savedUser.height,
                        hip: double.parse(val),
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: _savedUser.waist,
                        weight: _savedUser.weight);
                  },
                  // validator: (val) {
                  //   if (val.isEmpty) {
                  //     return 'Please provide your hip';
                  //   }
                  //   return null;
                  // },
                ),
                TextFormField(
                  initialValue: _initValues['waist'],
                  focusNode: _waistFN,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Waist',
                    icon: Icon(Icons.contact_phone),
                  ),
                  // onFieldSubmitted: (_) {
                  //   _saveForm();
                  // },
                  onSaved: (val) {
                    _savedUser = User(
                        username: _savedUser.username,
                        age: _savedUser.age,
                        //  sex: _savedUser.sex,
                        chest: _savedUser.chest,
                        contact: _savedUser.contact,
                        email: _savedUser.email,
                        forearm: _savedUser.forearm,
                        height: _savedUser.height,
                        hip: _savedUser.hip,
                        shoulder: _savedUser.shoulder,
                        id: _savedUser.id,
                        waist: double.parse(val),
                        weight: _savedUser.weight);
                  },
                  // validator: (val) {
                  //   if (val.isEmpty) {
                  //     return 'Please provide your waist';
                  //   }
                  //   return null;
                  // },
                ),
                RaisedButton(
                  color: Colors.pink,
                  onPressed: _saveForm,
                  child: Text('Done'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
