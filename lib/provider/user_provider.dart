import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:water_resources_application/model/profile.dart';

class UserProvider with ChangeNotifier {
  Profile _userProfile = Profile();

  Profile get userProfile => _userProfile;

  bool get isLogin => _userProfile.uid != null;

  void addProfileToFirestore(Profile userProfile) async {
    Map<String, dynamic> userData = {
      'uid': userProfile.uid,
      'email': userProfile.email,
      'fullName': userProfile.fullName,
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
    _userProfile.fullName = userProfile.fullName;
    _userProfile.mobileNumber = userProfile.mobileNumber;
    _userProfile.position = userProfile.position;

    notifyListeners();
  }

  void updateProfileToFirestore(String uid, Profile userProfile) async {
    Map<String, dynamic> userData = {
      'fullName': userProfile.fullName,
      'mobileNumber': userProfile.mobileNumber,
      'mobileNumber': userProfile.mobileNumber,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(userData);

    _userProfile.fullName = userProfile.fullName;
    _userProfile.mobileNumber = userProfile.mobileNumber;
    _userProfile.mobileNumber = userProfile.mobileNumber;

    notifyListeners();
  }

  void getProfileFromFirestore(String? uid) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

    _userProfile.uid = userData['uid'];
    _userProfile.email = userData['email'];
    _userProfile.fullName = userData['fullName'];
    _userProfile.mobileNumber = userData['mobileNumber'];
    _userProfile.mobileNumber = userData['mobileNumber'];

    notifyListeners();
  }

  void signOut() {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId != null) {
      //TODO remove FCM token from user profile
      FirebaseMessaging.instance.getToken().then((token) {});
    }

    FirebaseAuth.instance.signOut();
    _userProfile.uid = null;
    _userProfile.email = '';
    _userProfile.fullName = '';
    _userProfile.mobileNumber = '';
    _userProfile.mobileNumber = '';

    notifyListeners();
  }
}
