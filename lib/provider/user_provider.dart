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

  Future addProfileToFirestore(Profile userProfile) async {
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

    notifyListeners();
  }

  void updateProfileToFirestore(String uid, Profile userProfile) async {
    Map<String, dynamic> userData = {
      'lastName': userProfile.lastName,
      'firstName': userProfile.firstName,
      'mobileNumber': userProfile.mobileNumber,
      'position': userProfile.position,
    };
    print(userData);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(userData);

    _userProfile.firstName = userProfile.firstName;
    _userProfile.lastName = userProfile.lastName;
    _userProfile.mobileNumber = userProfile.mobileNumber;
    _userProfile.position = userProfile.position;
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
    _userProfile.position = userData['position'];
    notifyListeners();
  }

  void signOut() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    FirebaseAuth.instance.signOut();
    _userProfile.uid = "";
    _userProfile.email = '';
    _userProfile.firstName = '';
    _userProfile.lastName = '';
    _userProfile.mobileNumber = '';
    _userProfile.mobileNumber = '';
    _userProfile.position = '';

    notifyListeners();
  }
}
