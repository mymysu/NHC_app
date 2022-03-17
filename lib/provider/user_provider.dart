import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_resources_application/model/profile.dart';

class UserProvider with ChangeNotifier {
  Profile _userProfile = Profile();

  Profile get userProfile => _userProfile;

  bool get isLogin => _userProfile.uid != null;

  void addProfileToFirestore(Profile userProfile) async {
    Map<String, dynamic> userData = {
      'uid': userProfile.uid,
      'email': userProfile.email,
      'firstName': userProfile.firstName,
      'lastName': userProfile.lastName,
      'position': userProfile.position,
      'mobileNumber': userProfile.mobileNumber,
    };
    print(userData);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userProfile.uid)
        .set(userData);

    _userProfile.uid = userProfile.uid;
    _userProfile.email = userProfile.email;
    _userProfile.firstName = userProfile.firstName;
    _userProfile.lastName = userProfile.lastName;
    _userProfile.mobileNumber = userProfile.mobileNumber;
    _userProfile.position = userProfile.position;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', userProfile.email.toString());
    await prefs.setStringList('user', <String>[
      _userProfile.email.toString(),
      _userProfile.firstName.toString(),
      _userProfile.lastName.toString(),
      _userProfile.mobileNumber.toString()
    ]);
    notifyListeners();
  }

  void updateProfileToFirestore(String uid, Profile userProfile) async {
    Map<String, dynamic> userData = {
      'lastName': userProfile.lastName,
      'firstName': userProfile.firstName,
      'mobileNumber': userProfile.mobileNumber,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(userData);

    _userProfile.firstName = userProfile.firstName;
    _userProfile.lastName = userProfile.lastName;
    _userProfile.mobileNumber = userProfile.mobileNumber;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('user', <String>[
      _userProfile.email.toString(),
      _userProfile.firstName.toString(),
      _userProfile.lastName.toString(),
      _userProfile.mobileNumber.toString()
    ]);
    notifyListeners();
  }

  void getProfileFromFirestore(String? uid) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

    _userProfile.uid = userData['uid'];
    _userProfile.email = userData['email'];
    _userProfile.firstName = userData['firstName'];
    _userProfile.lastName = userData['lastName'];
    _userProfile.mobileNumber = userData['mobileNumber'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('user', <String>[
      _userProfile.email.toString(),
      _userProfile.firstName.toString(),
      _userProfile.lastName.toString(),
      _userProfile.mobileNumber.toString()
    ]);
    var user = prefs.getStringList("user");

    print(user);
    notifyListeners();
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var d = prefs.remove('user');
    print(d);
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    // if (userId != null) {
    //   FirebaseMessaging.instance.getToken().then((token) {});
    // }

    FirebaseAuth.instance.signOut();
    _userProfile.uid = "";
    _userProfile.email = '';
    _userProfile.firstName = '';
    _userProfile.lastName = '';
    _userProfile.mobileNumber = '';
    _userProfile.mobileNumber = '';

    notifyListeners();
  }
}
